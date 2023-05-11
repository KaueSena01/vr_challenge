import 'dart:developer';

import 'package:sqflite/sqflite.dart';
import 'package:vr_challenge/app/layers/data/dtos/enrollment_dto.dart';
import 'package:vr_challenge/core/utils/exception.dart';

class EnrollmentService {
  final Database database;

  EnrollmentService({required this.database});

  Future<void> insertEnrollment(EnrollmentDTO enrollmentDTO) async {
    try {
      final batch = database.batch();
      final studentCode = enrollmentDTO.studentCode;

      for (final courseCode in enrollmentDTO.courseCode) {
        batch.insert(
          'enrollment',
          {
            'courseCode': courseCode,
            'studentCode': studentCode,
          },
          conflictAlgorithm: ConflictAlgorithm.replace,
        );
      }

      await batch.commit(noResult: true);
    } catch (e) {
      log(e.toString());
      throw exceptionMessage;
    }
  }

  Future<int> getEnrolledCoursesCount(int courseCode) async {
    final results = await database.rawQuery(
      'SELECT COUNT(*) FROM enrollment WHERE courseCode = ?',
      ['$courseCode'],
    );
    return Sqflite.firstIntValue(results) ?? 0;
  }

  Future<List<int>> getStudentsNotEnrolledForCourse(int courseCode) async {
    final List<Map<String, dynamic>> enrolledStudents = await database.query(
      'enrollment',
      columns: ['studentCode', 'courseCode'],
      where: 'courseCode = ?',
      whereArgs: [courseCode],
    );
    final enrolledStudentIds =
        enrolledStudents.map((student) => student['studentCode']).toSet();

    final notEnrolledStudents = await database.rawQuery(
      '''
        SELECT id FROM student
        WHERE id NOT IN (
          SELECT studentCode FROM enrollment WHERE courseCode != ?
        )
        GROUP BY id
        HAVING COUNT(*) < 3
      ''',
      [courseCode],
    );

    return notEnrolledStudents
        .map<int>((student) => student['id'] as int)
        .where((studentId) => !enrolledStudentIds.contains(studentId))
        .toList();
  }

  Future<List<int>> getEnrolledStudentsForCourse(int courseCode) async {
    final results = await database.query(
      'enrollment',
      columns: ['studentCode', 'courseCode'],
      where: 'courseCode = ?',
      whereArgs: [courseCode],
    );

    return results.map<int>((result) => result['studentCode'] as int).toList();
  }

  Future<void> addCourseToStudents(List<int> studentIds, int courseId) async {
    try {
      final batch = database.batch();

      for (final studentId in studentIds) {
        batch.insert(
          'enrollment',
          {'studentCode': studentId, 'courseCode': courseId},
        );
      }

      await batch.commit(noResult: true);
    } catch (e) {
      log(e.toString());
      throw exceptionMessage;
    }
  }

  Future<void> updateEnrolledCourses(
      int studentCode, List<int> courseCodes) async {
    try {
      final batch = database.batch();

      batch.delete(
        'enrollment',
        where: 'studentCode = ?',
        whereArgs: [studentCode],
      );

      for (final courseCode in courseCodes) {
        batch.insert(
          'enrollment',
          {'studentCode': studentCode, 'courseCode': courseCode},
        );
      }

      await batch.commit(noResult: true);
    } catch (e) {
      throw "Ocorreu um erro";
    }
  }

  Future<void> removeCourseFromStudents(
    List<int> studentIds,
    int courseCode,
  ) async {
    final batch = database.batch();

    for (final studentId in studentIds) {
      try {
        final enrollment = await database.query(
          'enrollment',
          where: 'studentCode = ? AND courseCode = ?',
          whereArgs: [studentId, courseCode],
        );

        if (enrollment.isNotEmpty) {
          batch.delete(
            'enrollment',
            where: 'studentCode = ? AND courseCode = ?',
            whereArgs: [studentId, courseCode],
          );
        }
      } catch (e) {
        log(e.toString());
        throw exceptionMessage;
      }
    }

    await batch.commit(noResult: true);
  }

  Future<List<int>> getCoursesEnrolledByStudent(int studentId) async {
    try {
      final results = await database.query(
        'enrollment',
        where: 'studentCode = ?',
        whereArgs: [studentId],
        columns: ['courseCode'],
      );

      return results.map<int>((result) => result['courseCode'] as int).toList();
    } catch (e) {
      log(e.toString());
      throw exceptionMessage;
    }
  }

  Future<List<int>> getCoursesNotEnrolledByStudent(int studentId) async {
    final enrolledCourses = await database.query(
      'enrollment',
      where: 'studentCode = ?',
      whereArgs: [studentId],
      columns: ['courseCode'],
    );

    final coursesNotEnrolled = await database.rawQuery(
      '''
        SELECT id FROM course 
        WHERE id NOT IN (${enrolledCourses.map((e) => '?').join(', ')})
        AND id NOT IN (
          SELECT courseCode FROM enrollment 
          GROUP BY courseCode 
          HAVING COUNT(*) >= 10
        )
    ''',
      enrolledCourses.map<int>((e) => e['courseCode'] as int).toList(),
    );

    return coursesNotEnrolled.map<int>((e) => e['id'] as int).toList();
  }

  Future<void> removeEnrollment(int studentId) async {
    await database.delete(
      'enrollment',
      where: 'studentCode = ?',
      whereArgs: [studentId],
    );
  }
}

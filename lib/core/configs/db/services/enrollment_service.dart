import 'dart:convert' as json;

import 'package:sqflite/sqflite.dart';
import 'package:vr_challenge/app/layers/data/dtos/enrollment_dto.dart';

class EnrollmentService {
  final Database database;

  EnrollmentService({required this.database});

  Future<void> insertEnrollment(EnrollmentDTO enrollmentDTO) async {
    try {
      final batch = database.batch();
      final studentCode = enrollmentDTO.studentCode;
      final course = enrollmentDTO.courseCode;

      if (course.isEmpty) {
        batch.insert(
          'enrollment',
          {
            'studentCode': studentCode,
          },
          conflictAlgorithm: ConflictAlgorithm.replace,
        );
      }

      for (final courseCode in enrollmentDTO.courseCode) {
        batch.insert(
          'enrollment',
          {
            'courseCodes': json.jsonEncode([courseCode]),
            'studentCode': studentCode,
          },
          conflictAlgorithm: ConflictAlgorithm.replace,
        );
      }

      await batch.commit(noResult: true);
    } catch (_) {
      throw "Ocorreu um erro";
    }
  }

  Future<int> getEnrolledCoursesCount(int courseCode) async {
    final results = await database.rawQuery(
      'SELECT COUNT(*) FROM enrollment WHERE courseCodes LIKE ?',
      ['%$courseCode%'],
    );

    return Sqflite.firstIntValue(results) ?? 0;
  }

  Future<List<int>> getStudentsNotEnrolledForCourse(int courseCode) async {
    final results = await database.query(
      'enrollment',
      columns: ['studentCode', 'courseCodes'],
    );

    final studentsEnrolled = <int>{};

    for (final result in results) {
      final courseCodes = result['courseCodes'] != null
          ? (result['courseCodes'] as String).codeUnits
          : null;

      if (courseCodes != null && courseCodes.contains(courseCode)) {
        studentsEnrolled.add(result['studentCode'] as int);
      }
    }

    final notEnrolledStudents = await database.rawQuery('''
    SELECT id FROM student
    WHERE NOT EXISTS (
      SELECT 1 FROM enrollment
      WHERE studentCode = student.id AND courseCodes LIKE '%$courseCode%'
    ) AND (
      SELECT COUNT(*) FROM enrollment WHERE studentCode = student.id
    ) < 3
  ''');

    return notEnrolledStudents
        .map<int>((student) => student['id'] as int)
        .toList();
  }

  Future<List<int>> getEnrolledStudentsForCourse(int courseCode) async {
    final results = await database.query(
      'enrollment',
      columns: ['studentCode', 'courseCodes'],
    );

    final enrolledStudents = <int>[];

    for (final result in results) {
      final courseCodes =
          json.json.decode(result['courseCodes'] as String).cast<int>();

      if (courseCodes.contains(courseCode)) {
        enrolledStudents.add(result['studentCode'] as int);
      }
    }

    return enrolledStudents;
  }

  Future<void> addCourseToStudents(
    List<int> studentCodes,
    int courseCode,
  ) async {
    final batch = database.batch();

    for (final studentCode in studentCodes) {
      try {
        final enrollment = await database.query(
          'enrollment',
          where: 'studentCode = ?',
          whereArgs: [studentCode],
          columns: ['courseCodes'],
        );

        if (enrollment.isEmpty) {
          continue;
        }

        final currentCourseCodes = (enrollment.first['courseCodes'] != null)
            ? json.json
                .decode(enrollment.first['courseCodes'] as String)
                .cast<int>()
            : [];

        if (!currentCourseCodes.contains(courseCode)) {
          currentCourseCodes.add(courseCode);
        }

        final updatedCourseCodes = json.json.encode(currentCourseCodes);

        batch.update(
          'enrollment',
          {'courseCodes': updatedCourseCodes},
          where: 'studentCode = ?',
          whereArgs: [studentCode],
        );
      } catch (e) {
        print('Erro ao atualizar dados do estudante $studentCode: $e');
      }
    }

    await batch.commit(noResult: true);
  }

  Future<void> updateEnrolledCourses(
    int studentCode,
    List<int> courseCodes,
  ) async {
    try {
      final batch = database.batch();

      final courseCodesJson = json.json.encode(courseCodes);

      batch.update(
        'enrollment',
        {'courseCodes': courseCodesJson},
        where: 'studentCode = ?',
        whereArgs: [studentCode],
      );

      await batch.commit(noResult: true);
    } catch (_) {
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
          where: 'studentCode = ?',
          whereArgs: [studentId],
          columns: ['courseCodes'],
        );

        if (enrollment.isEmpty) {
          continue;
        }

        final currentCourseCodes = (enrollment.first['courseCodes'] != null)
            ? json.json
                .decode(enrollment.first['courseCodes'] as String)
                .cast<int>()
            : [];

        if (currentCourseCodes.contains(courseCode)) {
          currentCourseCodes.remove(courseCode);

          final updatedCourseCodes = json.json.encode(currentCourseCodes);

          batch.update(
            'enrollment',
            {'courseCodes': updatedCourseCodes},
            where: 'studentCode = ?',
            whereArgs: [studentId],
          );
        }
      } catch (e) {
        print('Erro ao atualizar dados do estudante $studentId: $e');
      }
    }

    await batch.commit(noResult: true);
  }

  Future<List<int>> getCoursesEnrolledByStudent(int studentId) async {
    final results = await database.query(
      'enrollment',
      where: 'studentCode = ?',
      whereArgs: [studentId],
      columns: ['courseCodes'],
    );

    final coursesEnrolled = <int>[];

    for (final result in results) {
      final courseCodes =
          json.json.decode(result['courseCodes'] as String).cast<int>();
      coursesEnrolled.addAll(courseCodes);
    }

    return coursesEnrolled;
  }

  Future<List<int>> getCoursesNotEnrolledByStudent(int studentId) async {
    final courses = await database.query('course', columns: ['id']);

    final coursesEnrolled = await getCoursesEnrolledByStudent(studentId);

    final coursesNotEnrolled = courses
        .where((course) => !coursesEnrolled.contains(course['id'] as int))
        .map<int>((course) => course['id'] as int)
        .toList();

    return coursesNotEnrolled;
  }

  Future<void> removeEnrollment(int studentId) async {
    await database.delete(
      'enrollment',
      where: 'studentCode = ?',
      whereArgs: [studentId],
    );
  }
}

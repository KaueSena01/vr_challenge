import 'package:sqflite/sqflite.dart';
import 'package:vr_challenge/app/layers/data/dtos/enrollment_dto.dart';

class EnrollmentService {
  final Database database;

  EnrollmentService({required this.database});

  Future<void> insertEnrollment(EnrollmentDTO enrollmentDTO) async {
    try {
      await database.insert(
        'enrollment',
        enrollmentDTO.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
    } catch (_) {
      throw "Ocorreu um erro";
    }
  }

  Future<int> getEnrolledCoursesCount(int courseCode) async {
    final results = await database.query(
      'enrollment',
      columns: ['courseCode'],
    );

    int count = 0;

    for (final result in results) {
      final courseCodes = result['courseCode'] as List<int>;

      if (courseCodes.contains(courseCode)) {
        count++;
      }
    }

    return count;
  }

  Future<List<int>> getStudentsNotEnrolledForCourse(int courseCode) async {
    final results = await database.query(
      'enrollment',
      columns: ['studentCode', 'courseCode'],
    );

    final studentsEnrolled = <int>{};

    for (final result in results) {
      final courseCodes = result['courseCode'] as List<int>;

      if (courseCodes.contains(courseCode)) {
        studentsEnrolled.add(result['studentCode'] as int);
      }
    }

    final allStudents = await database.query('student', columns: ['id']);
    final studentsNotEnrolled = <int>[];

    for (final student in allStudents) {
      final studentCode = student['id'] as int;

      if (!studentsEnrolled.contains(studentCode)) {
        studentsNotEnrolled.add(studentCode);
      }
    }

    return studentsNotEnrolled;
  }

  Future<List<int>> getEnrolledStudentsForCourse(int courseCode) async {
    final results = await database.query(
      'enrollment',
      columns: ['studentCode', 'courseCode'],
    );

    final enrolledStudents = <int>[];

    for (final result in results) {
      final courseCodes = result['courseCode'] as List<int>;

      if (courseCodes.contains(courseCode)) {
        enrolledStudents.add(result['studentCode'] as int);
      }
    }

    return enrolledStudents;
  }
}

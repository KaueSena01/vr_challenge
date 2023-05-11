import 'dart:developer';

import 'package:sqflite/sqflite.dart';
import 'package:vr_challenge/app/layers/data/data_sources/enrollment_datasource.dart';
import 'package:vr_challenge/app/layers/data/dtos/enrollment_dto.dart';
import 'package:vr_challenge/app/layers/domain/entities/enrollment_entity.dart';
import 'package:vr_challenge/core/configs/db/db.dart';
import 'package:vr_challenge/core/configs/db/services/enrollment_service.dart';

class EnrollmentDataSourceImpl extends EnrollmentDataSource {
  EnrollmentDataSourceImpl(this.databaseProvider);

  final DatabaseProvider databaseProvider;

  late Database database;

  @override
  Future<void> saveStudentAndCourses(EnrollmentEntity enrollmentEntity) async {
    final enrollment = EnrollmentService(database: database);
    final enrollmentDTO = EnrollmentDTO.fromEntity(enrollmentEntity);

    try {
      await enrollment.insertEnrollment(enrollmentDTO);
    } catch (_) {
      log(_.toString());
      rethrow;
    }
  }

  @override
  Future<int> getEnrolledCoursesCount(int courseCode) async {
    database = await databaseProvider.database;

    final enrollment = EnrollmentService(database: database);

    try {
      return await enrollment.getEnrolledCoursesCount(courseCode);
    } catch (_) {
      log(_.toString());
      rethrow;
    }
  }

  @override
  Future<List<int>> getStudentsNotEnrolledForCourse(int courseCode) async {
    database = await databaseProvider.database;

    final enrollment = EnrollmentService(database: database);

    try {
      return await enrollment.getStudentsNotEnrolledForCourse(courseCode);
    } catch (_) {
      log(_.toString());
      rethrow;
    }
  }

  @override
  Future<List<int>> getEnrolledStudentsForCourse(int courseCode) async {
    database = await databaseProvider.database;

    final enrollment = EnrollmentService(database: database);

    try {
      return await enrollment.getEnrolledStudentsForCourse(courseCode);
    } catch (_) {
      log(_.toString());
      rethrow;
    }
  }

  @override
  Future<void> updateCourseStudents(
    List<int> studentCode,
    int courseCode,
  ) async {
    database = await databaseProvider.database;

    final enrollment = EnrollmentService(database: database);

    try {
      await enrollment.addCourseToStudents(studentCode, courseCode);
    } catch (_) {
      log(_.toString());
      rethrow;
    }
  }

  @override
  Future<void> removeCourseFromEnrollment(
    List<int> studentCode,
    int courseCode,
  ) async {
    database = await databaseProvider.database;

    final enrollment = EnrollmentService(database: database);

    try {
      await enrollment.removeCourseFromStudents(studentCode, courseCode);
    } catch (_) {
      log(_.toString());
      rethrow;
    }
  }

  @override
  Future<List<int>> getCoursesEnrolledByStudent(int studentCode) async {
    database = await databaseProvider.database;

    final enrollment = EnrollmentService(database: database);

    try {
      return await enrollment.getCoursesEnrolledByStudent(studentCode);
    } catch (_) {
      log(_.toString());
      rethrow;
    }
  }

  @override
  Future<List<int>> getCoursesNotEnrolledByStudent(int studentCode) async {
    database = await databaseProvider.database;

    final enrollment = EnrollmentService(database: database);

    try {
      return await enrollment.getCoursesNotEnrolledByStudent(studentCode);
    } catch (_) {
      log(_.toString());
      rethrow;
    }
  }

  @override
  Future<void> updateEnrolledCourses(
    int studentCode,
    List<int> courseCodes,
  ) async {
    database = await databaseProvider.database;

    final enrollment = EnrollmentService(database: database);

    try {
      return await enrollment.updateEnrolledCourses(studentCode, courseCodes);
    } catch (_) {
      log(_.toString());
      rethrow;
    }
  }

  @override
  Future<void> removeEnrollment(int studentCode) async {
    database = await databaseProvider.database;

    final enrollment = EnrollmentService(database: database);

    try {
      await enrollment.removeEnrollment(studentCode);
    } catch (_) {
      log(_.toString());
      rethrow;
    }
  }
}

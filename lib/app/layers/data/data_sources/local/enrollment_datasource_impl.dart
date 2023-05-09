import 'dart:developer';

import 'package:sqflite/sqflite.dart';
import 'package:vr_challenge/app/layers/data/data_sources/enrollment_datasource.dart';
import 'package:vr_challenge/app/layers/data/dtos/enrollment_dto.dart';
import 'package:vr_challenge/app/layers/domain/entities/enrollment_entity.dart';
import 'package:vr_challenge/core/configs/db/db.dart';
import 'package:vr_challenge/core/configs/db/services/enrollment_service.dart';

class EnrollmentDataSourceImpl extends EnrollmentDataSource {
  late Database db;

  @override
  Future<void> saveStudentAndCourses(EnrollmentEntity enrollmentEntity) async {
    db = await DatabaseProvider.instance.database;
    final enrollment = EnrollmentService(database: db);
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
    db = await DatabaseProvider.instance.database;
    final enrollment = EnrollmentService(database: db);

    try {
      return await enrollment.getEnrolledCoursesCount(courseCode);
    } catch (_) {
      log(_.toString());
      rethrow;
    }
  }

  @override
  Future<List<int>> getStudentsNotEnrolledForCourse(int courseCode) async {
    db = await DatabaseProvider.instance.database;
    final enrollment = EnrollmentService(database: db);

    try {
      return await enrollment.getStudentsNotEnrolledForCourse(courseCode);
    } catch (_) {
      log(_.toString());
      rethrow;
    }
  }

  @override
  Future<List<int>> getEnrolledStudentsForCourse(int courseCode) async {
    db = await DatabaseProvider.instance.database;
    final enrollment = EnrollmentService(database: db);

    try {
      return await enrollment.getEnrolledStudentsForCourse(courseCode);
    } catch (_) {
      log(_.toString());
      rethrow;
    }
  }
}

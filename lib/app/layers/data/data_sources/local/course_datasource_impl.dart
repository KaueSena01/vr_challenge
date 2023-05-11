import 'dart:developer';

import 'package:sqflite/sqflite.dart';
import 'package:vr_challenge/app/layers/data/data_sources/course_datasource.dart';
import 'package:vr_challenge/app/layers/data/dtos/course_dto.dart';
import 'package:vr_challenge/app/layers/domain/entities/course_entity.dart';
import 'package:vr_challenge/core/configs/db/db.dart';
import 'package:vr_challenge/core/configs/db/services/course_service.dart';

class CourseDataSourceImpl extends CourseDataSource {
  CourseDataSourceImpl(this.databaseProvider);

  final DatabaseProvider databaseProvider;

  late Database database;

  @override
  Future<void> createCourse(CourseEntity courseEntity) async {
    database = await databaseProvider.database;

    final course = CourseService(database: database);
    final courseDTO = CourseDTO.fromEntity(courseEntity);

    try {
      await course.insertCourse(courseDTO);
    } catch (_) {
      log(_.toString());
      rethrow;
    }
  }

  @override
  Future<List<CourseEntity>> getAllCourses() async {
    database = await databaseProvider.database;

    final course = CourseService(database: database);

    try {
      return await course.getAllCourses();
    } catch (_) {
      log(_.toString());
      rethrow;
    }
  }

  @override
  Future<void> updateCourse(CourseEntity courseEntity) async {
    database = await databaseProvider.database;

    final course = CourseService(database: database);
    final courseDTO = CourseDTO.fromEntity(courseEntity);

    try {
      await course.updateCourse(courseDTO);
    } catch (_) {
      log(_.toString());
      rethrow;
    }
  }

  @override
  Future<void> deleteCourse(int courseCode) async {
    database = await databaseProvider.database;

    final course = CourseService(database: database);

    try {
      await course.deleteCourse(courseCode);
    } catch (_) {
      log(_.toString());
      rethrow;
    }
  }

  @override
  Future<List<CourseEntity>> getCoursesByIds(List<int> courseCode) async {
    database = await databaseProvider.database;

    final course = CourseService(database: database);

    try {
      return await course.getCoursesByIds(courseCode);
    } catch (_) {
      log(_.toString());
      rethrow;
    }
  }
}

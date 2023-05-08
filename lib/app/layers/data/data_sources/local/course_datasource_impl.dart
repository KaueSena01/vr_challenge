import 'dart:developer';

import 'package:sqflite/sqflite.dart';
import 'package:vr_challenge/app/layers/data/data_sources/course_datasource.dart';
import 'package:vr_challenge/app/layers/data/dtos/course_dto.dart';
import 'package:vr_challenge/app/layers/domain/entities/course_entity.dart';
import 'package:vr_challenge/core/configs/db/db.dart';
import 'package:vr_challenge/core/configs/db/services/course_service.dart';

class CourseDataSourceImpl extends CourseDataSource {
  late Database db;

  @override
  Future<void> createCourse(CourseEntity courseEntity) async {
    db = await DatabaseProvider.instance.database;
    final course = CourseService(database: db);
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
    db = await DatabaseProvider.instance.database;
    final course = CourseService(database: db);

    try {
      return course.getAllCourses();
    } catch (_) {
      log(_.toString());
      rethrow;
    }
  }

  @override
  Future<void> updateCourse(CourseEntity courseEntity) async {
    db = await DatabaseProvider.instance.database;
    final course = CourseService(database: db);
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
    db = await DatabaseProvider.instance.database;
    final course = CourseService(database: db);

    try {
      await course.deleteCourse(courseCode);
    } catch (_) {
      log(_.toString());
      rethrow;
    }
  }
}

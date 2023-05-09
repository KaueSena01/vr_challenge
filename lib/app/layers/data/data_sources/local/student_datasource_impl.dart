import 'dart:developer';

import 'package:sqflite/sqflite.dart';
import 'package:vr_challenge/app/layers/data/data_sources/student_datasource.dart';
import 'package:vr_challenge/app/layers/data/dtos/student_dto.dart';
import 'package:vr_challenge/app/layers/domain/entities/student_entity.dart';
import 'package:vr_challenge/core/configs/db/db.dart';
import 'package:vr_challenge/core/configs/db/services/student_service.dart';

class StudentDataSourceImpl extends StudentDataSource {
  late Database db;

  @override
  Future<StudentEntity> createNewStudent(StudentEntity studentEntity) async {
    db = await DatabaseProvider.instance.database;
    final student = StudentService(database: db);
    final studentDTO = StudentDTO.fromEntity(studentEntity);

    try {
      return await student.insertStudent(studentDTO);
    } catch (_) {
      log(_.toString());
      rethrow;
    }
  }

  @override
  Future<List<StudentEntity>> getAllStudents() async {
    db = await DatabaseProvider.instance.database;
    final studentService = StudentService(database: db);

    try {
      return await studentService.getAllStudents();
    } catch (_) {
      log(_.toString());
      rethrow;
    }
  }

  @override
  Future<void> updateStudent(StudentEntity studentEntity) async {
    db = await DatabaseProvider.instance.database;
    final studentService = StudentService(database: db);
    final studentDTO = StudentDTO.fromEntity(studentEntity);

    try {
      return await studentService.updateStudent(studentDTO);
    } catch (_) {
      log(_.toString());
      rethrow;
    }
  }

  @override
  Future<void> deleteStudent(int studentCode) async {
    db = await DatabaseProvider.instance.database;
    final studentService = StudentService(database: db);

    try {
      await studentService.deleteStudent(studentCode);
    } catch (_) {
      log(_.toString());
      rethrow;
    }
  }

  @override
  Future<List<StudentEntity>> getStudentsByIds(List<int> studentCode) async {
    db = await DatabaseProvider.instance.database;
    final studentService = StudentService(database: db);

    try {
      return await studentService.getStudentsByIds(studentCode);
    } catch (_) {
      log(_.toString());
      rethrow;
    }
  }
}

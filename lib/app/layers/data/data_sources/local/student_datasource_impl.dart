import 'dart:developer';
import 'package:sqflite/sqflite.dart';
import 'package:vr_challenge/app/layers/data/data_sources/student_datasource.dart';
import 'package:vr_challenge/app/layers/data/dtos/student_dto.dart';
import 'package:vr_challenge/app/layers/domain/entities/student_entity.dart';
import 'package:vr_challenge/core/configs/db/db.dart';
import 'package:vr_challenge/core/configs/db/services/student_service.dart';

class StudentDataSourceImpl extends StudentDataSource {
  StudentDataSourceImpl(this.databaseProvider);

  final DatabaseProvider databaseProvider;

  late Database database;

  @override
  Future<StudentEntity> createNewStudent(StudentEntity studentEntity) async {
    database = await databaseProvider.database;

    final student = StudentService(database: database);
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
    database = await databaseProvider.database;

    final studentService = StudentService(database: database);

    try {
      return await studentService.getAllStudents();
    } catch (_) {
      log(_.toString());
      rethrow;
    }
  }

  @override
  Future<void> updateStudent(StudentEntity studentEntity) async {
    database = await databaseProvider.database;

    final studentService = StudentService(database: database);
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
    database = await databaseProvider.database;

    final studentService = StudentService(database: database);

    try {
      await studentService.deleteStudent(studentCode);
    } catch (_) {
      log(_.toString());
      rethrow;
    }
  }

  @override
  Future<List<StudentEntity>> getStudentsByIds(List<int> studentCode) async {
    database = await databaseProvider.database;

    final studentService = StudentService(database: database);

    try {
      return await studentService.getStudentsByIds(studentCode);
    } catch (_) {
      log(_.toString());
      rethrow;
    }
  }
}

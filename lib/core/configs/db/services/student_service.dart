import 'package:sqflite/sqflite.dart';
import 'package:vr_challenge/app/layers/data/dtos/student_dto.dart';

class StudentService {
  final Database database;

  StudentService({required this.database});

  Future<StudentDTO> insertStudent(StudentDTO studentDTO) async {
    try {
      final id = await database.insert(
        'student',
        studentDTO.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
      final studentMap = await database.query(
        'student',
        where: 'id = ?',
        whereArgs: [id],
      );
      final student = StudentDTO.fromMap(studentMap.first);
      return student;
    } catch (_) {
      throw "Ocorreu um erro";
    }
  }

  Future<List<StudentDTO>> getAllStudents() async {
    final List<Map<String, dynamic>> maps = await database.query('student');
    return List.generate(
      maps.length,
      (i) {
        return StudentDTO(
          id: maps[i]['id'],
          name: maps[i]['name'],
          email: maps[i]['email'],
          password: maps[i]['password'],
        );
      },
    );
  }

  Future<void> updateStudent(StudentDTO studentDTO) async {
    try {
      await database.update(
        'student',
        studentDTO.toMap(),
        where: 'id = ?',
        whereArgs: [studentDTO.id],
      );
    } catch (_) {
      throw "Ocorreu um erro";
    }
  }

  Future<void> deleteStudent(int studentCode) async {
    try {
      await database.delete(
        'student',
        where: 'id = ?',
        whereArgs: [studentCode],
      );
    } catch (_) {
      throw "Ocorreu um erro";
    }
  }

  Future<List<StudentDTO>> getStudentsByIds(List<int> ids) async {
    final List<Map<String, dynamic>> maps = await database.query(
      'student',
      where: 'id IN (${ids.map((id) => '?').join(',')})',
      whereArgs: ids,
    );
    return List.generate(
      maps.length,
      (i) {
        return StudentDTO(
          id: maps[i]['id'],
          name: maps[i]['name'],
          email: maps[i]['email'],
          password: maps[i]['password'],
        );
      },
    );
  }
}

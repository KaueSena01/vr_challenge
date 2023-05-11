import 'package:sqflite/sqflite.dart';
import 'package:vr_challenge/app/layers/data/dtos/course_dto.dart';
import 'package:vr_challenge/core/utils/exception.dart';

class CourseService {
  final Database database;

  CourseService({required this.database});

  Future<void> insertCourse(CourseDTO courseDTO) async {
    try {
      await database.insert(
        'course',
        courseDTO.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
    } catch (_) {
      throw exceptionMessage;
    }
  }

  Future<List<CourseDTO>> getAllCourses() async {
    final List<Map<String, dynamic>> maps = await database.query('course');
    return List.generate(
      maps.length,
      (i) {
        return CourseDTO(
          id: maps[i]['id'],
          name: maps[i]['name'],
          description: maps[i]['description'],
          syllabus: maps[i]['syllabus'],
        );
      },
    ).reversed.toList();
  }

  Future<List<CourseDTO>> getCoursesByIds(List<int> courseIds) async {
    final List<Map<String, dynamic>> maps = await database.query(
      'course',
      where: 'id IN (${courseIds.map((id) => '?').join(', ')})',
      whereArgs: courseIds,
    );

    return List.generate(
      maps.length,
      (i) {
        return CourseDTO(
          id: maps[i]['id'],
          name: maps[i]['name'],
          description: maps[i]['description'],
          syllabus: maps[i]['syllabus'],
        );
      },
    );
  }

  Future<void> updateCourse(CourseDTO courseDTO) async {
    try {
      await database.update(
        'course',
        courseDTO.toMap(),
        where: 'id = ?',
        whereArgs: [courseDTO.id],
      );
    } catch (_) {
      throw exceptionMessage;
    }
  }

  Future<void> deleteCourse(int courseCode) async {
    try {
      await database.delete(
        'course',
        where: 'id = ?',
        whereArgs: [courseCode],
      );
    } catch (_) {
      throw exceptionMessage;
    }
  }
}

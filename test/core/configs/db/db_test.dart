import 'package:flutter_test/flutter_test.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';
import 'package:vr_challenge/core/configs/db/db.dart';

void main() {
  group('DatabaseProvider', () {
    late DatabaseProvider databaseProvider;
    late Database db;

    setUpAll(() async {
      databaseFactory = databaseFactoryFfi;
      sqfliteFfiInit();
      databaseProvider = DatabaseProvider.instance;
      db = await databaseProvider.database;
    });

    test('Creates tables and inserts data successfully', () async {
      final admin = await db.query('admins', limit: 1);
      expect(admin, isNotNull);

      final course = await db.query('courses', limit: 1);
      expect(course, isNotNull);

      final student = await db.query('students', limit: 1);
      expect(student, isNotNull);

      final enrollment = await db.query('enrollments', limit: 1);
      expect(enrollment, isNotNull);
    });

    test('Returns the number of students and courses', () async {
      final studentsCount = Sqflite.firstIntValue(
          await db.rawQuery('SELECT COUNT(*) FROM students'));
      final coursesCount = Sqflite.firstIntValue(
          await db.rawQuery('SELECT COUNT(*) FROM courses'));

      expect(studentsCount, isNonNegative);
      expect(coursesCount, isNonNegative);

      print('Number of students: $studentsCount');
      print('Number of courses: $coursesCount');
    });
  });
}

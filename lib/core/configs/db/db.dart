import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:vr_challenge/core/configs/resources/resources.dart';

class DatabaseProvider {
  static final DatabaseProvider instance = DatabaseProvider._();

  static Database? _database;

  DatabaseProvider._();

  Future<Database> get database async {
    if (_database != null) {
      return _database!;
    }

    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    final path = await getDatabasesPath();
    return openDatabase(
      join(path, 'database.db'),
      version: 1,
      onCreate: createDatabase,
    );
  }

  Future<void> createDatabase(Database db, int version) async {
    await db.execute('''
        CREATE TABLE admin (
          id INTEGER PRIMARY KEY AUTOINCREMENT,
          name TEXT,
          email TEXT,
          password TEXT
        );
      ''');
    await db.execute('''
          CREATE TABLE course (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            name TEXT,
            description TEXT,
            syllabus TEXT
          )
          ''');
    await db.execute('''
          CREATE TABLE student (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            name TEXT,
            email TEXT,
            password TEXT
          )
          ''');

    await db.execute('''
          CREATE TABLE enrollment (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            studentCode INTEGER,
            courseCode INTEGER
          )
          ''');

    await db.insert(
      'admin',
      {
        'name': 'Administrador do VR',
        'email': 'adminvr123@gmail.com',
        'password': 'admin123',
      },
    );

    // Inserting
    for (var course in courses) {
      await db.insert('course', course);
    }

    for (var student in students) {
      await db.insert('student', student);
    }
  }
}

import 'package:vr_challenge/app/layers/domain/entities/student_entity.dart';

abstract class StudentRepository {
  Future<void> createNewStudent(StudentEntity studentEntity);
  Future<List<StudentEntity>> getAllStudents();
  Future<void> updateStudent(StudentEntity studentEntity);
  Future<void> deleteStudent(int studentCode);
}

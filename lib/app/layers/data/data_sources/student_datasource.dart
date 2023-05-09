import 'package:vr_challenge/app/layers/domain/entities/student_entity.dart';

abstract class StudentDataSource {
  Future<StudentEntity> createNewStudent(StudentEntity studentEntity);
  Future<List<StudentEntity>> getAllStudents();
  Future<void> updateStudent(StudentEntity studentEntity);
  Future<void> deleteStudent(int studentCode);
  Future<List<StudentEntity>> getStudentsByIds(List<int> studentCode);
}

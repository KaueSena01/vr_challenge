import 'package:vr_challenge/app/layers/data/data_sources/student_datasource.dart';
import 'package:vr_challenge/app/layers/domain/entities/student_entity.dart';
import 'package:vr_challenge/app/layers/domain/repositories/student_repository.dart';

class StudentRepositoryImpl implements StudentRepository {
  final StudentDataSource studentDataSource;

  StudentRepositoryImpl({required this.studentDataSource});

  @override
  Future<StudentEntity> createNewStudent(StudentEntity studentEntity) async {
    return await studentDataSource.createNewStudent(studentEntity);
  }

  @override
  Future<List<StudentEntity>> getAllStudents() async {
    return studentDataSource.getAllStudents();
  }

  @override
  Future<void> updateStudent(StudentEntity studentEntity) async {
    await studentDataSource.updateStudent(studentEntity);
  }

  @override
  Future<void> deleteStudent(int studentCode) async {
    await studentDataSource.deleteStudent(studentCode);
  }

  @override
  Future<List<StudentEntity>> getStudentsByIds(List<int> studentCode) async {
    return await studentDataSource.getStudentsByIds(studentCode);
  }
}

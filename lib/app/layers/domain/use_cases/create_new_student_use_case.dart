import 'package:vr_challenge/app/layers/domain/entities/student_entity.dart';
import 'package:vr_challenge/app/layers/domain/repositories/student_repository.dart';

class CreateNewStudentUseCase {
  final StudentRepository studentRepository;

  CreateNewStudentUseCase({required this.studentRepository});

  Future<StudentEntity> call(StudentEntity studentEntity) async {
    return await studentRepository.createNewStudent(studentEntity);
  }
}

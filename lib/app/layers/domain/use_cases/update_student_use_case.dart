import 'package:vr_challenge/app/layers/domain/entities/student_entity.dart';
import 'package:vr_challenge/app/layers/domain/repositories/student_repository.dart';

class UpdateStudentUseCase {
  final StudentRepository studentRepository;

  UpdateStudentUseCase({required this.studentRepository});

  Future<void> call(StudentEntity studentEntity) async {
    await studentRepository.updateStudent(studentEntity);
  }
}

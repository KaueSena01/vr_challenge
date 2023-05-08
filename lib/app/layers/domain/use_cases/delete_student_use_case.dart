import 'package:vr_challenge/app/layers/domain/repositories/student_repository.dart';

class DeleteStudentUseCase {
  final StudentRepository studentRepository;

  DeleteStudentUseCase({required this.studentRepository});

  Future<void> call(int studentCode) async {
    await studentRepository.deleteStudent(studentCode);
  }
}

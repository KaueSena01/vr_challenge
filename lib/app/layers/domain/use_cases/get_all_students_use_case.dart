import 'package:vr_challenge/app/layers/domain/entities/student_entity.dart';
import 'package:vr_challenge/app/layers/domain/repositories/student_repository.dart';

class GetAllStudentUseCase {
  final StudentRepository studentRepository;

  GetAllStudentUseCase({required this.studentRepository});

  Future<List<StudentEntity>> call() async {
    return await studentRepository.getAllStudents();
  }
}

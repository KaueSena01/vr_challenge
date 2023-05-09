import 'package:vr_challenge/app/layers/domain/entities/student_entity.dart';
import 'package:vr_challenge/app/layers/domain/repositories/student_repository.dart';

class GetStudentsByIdsUseCase {
  final StudentRepository studentRepository;

  GetStudentsByIdsUseCase({required this.studentRepository});

  Future<List<StudentEntity>> call(List<int> courseCode) async {
    return await studentRepository.getStudentsByIds(courseCode);
  }
}

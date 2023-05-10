import 'package:vr_challenge/app/layers/domain/repositories/enrollment_repository.dart';

class GetCoursesEnrolledByStudentsUseCase {
  final EnrollmentRepository enrollmentRepository;

  GetCoursesEnrolledByStudentsUseCase({required this.enrollmentRepository});

  Future<List<int>> call(int studentCode) async {
    return await enrollmentRepository.getCoursesEnrolledByStudent(studentCode);
  }
}

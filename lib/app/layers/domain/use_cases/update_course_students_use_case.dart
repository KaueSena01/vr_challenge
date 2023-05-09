import 'package:vr_challenge/app/layers/domain/repositories/enrollment_repository.dart';

class UpdateCourseStudentsUseCase {
  final EnrollmentRepository enrollmentRepository;

  UpdateCourseStudentsUseCase({required this.enrollmentRepository});

  Future<void> call(List<int> studentCode, int courseCode) async {
    await enrollmentRepository.updateCourseStudents(studentCode, courseCode);
  }
}

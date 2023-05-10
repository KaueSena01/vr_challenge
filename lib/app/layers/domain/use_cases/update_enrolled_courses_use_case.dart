import 'package:vr_challenge/app/layers/domain/repositories/enrollment_repository.dart';

class UpdateEnrolledCoursesUseCase {
  final EnrollmentRepository enrollmentRepository;

  UpdateEnrolledCoursesUseCase({required this.enrollmentRepository});

  Future<void> call(int studentCode, List<int> courseCodes) async {
    await enrollmentRepository.updateEnrolledCourses(studentCode, courseCodes);
  }
}

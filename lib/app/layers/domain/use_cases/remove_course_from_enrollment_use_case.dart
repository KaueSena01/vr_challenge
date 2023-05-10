import 'package:vr_challenge/app/layers/domain/repositories/enrollment_repository.dart';

class RemoveCourseFromEnrollmentUseCase {
  final EnrollmentRepository enrollmentRepository;

  RemoveCourseFromEnrollmentUseCase({required this.enrollmentRepository});

  Future<void> call(List<int> studentCode, int couseCode) async {
    await enrollmentRepository.removeCourseFromEnrollment(
        studentCode, couseCode);
  }
}

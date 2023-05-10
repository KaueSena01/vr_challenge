import 'package:vr_challenge/app/layers/domain/repositories/enrollment_repository.dart';

class RemoveEnrollmentUseCase {
  final EnrollmentRepository enrollmentRepository;

  RemoveEnrollmentUseCase({required this.enrollmentRepository});

  Future<void> call(int studentCode) async {
    await enrollmentRepository.removeEnrollment(studentCode);
  }
}

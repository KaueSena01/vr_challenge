import 'package:vr_challenge/app/layers/domain/repositories/enrollment_repository.dart';

class GetEnrolledCoursesCountUseCase {
  final EnrollmentRepository enrollmentRepository;

  GetEnrolledCoursesCountUseCase({required this.enrollmentRepository});

  Future<int> call(int courseCode) async {
    return await enrollmentRepository.getEnrolledCoursesCount(courseCode);
  }
}

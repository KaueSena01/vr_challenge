import 'package:vr_challenge/app/layers/domain/repositories/enrollment_repository.dart';

class GetEnrolledStudentsForCourseUseCase {
  final EnrollmentRepository enrollmentRepository;

  GetEnrolledStudentsForCourseUseCase({required this.enrollmentRepository});

  Future<List<int>> call(int courseCode) async {
    return await enrollmentRepository.getEnrolledStudentsForCourse(courseCode);
  }
}

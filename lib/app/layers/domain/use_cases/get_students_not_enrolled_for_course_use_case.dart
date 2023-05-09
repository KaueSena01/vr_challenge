import 'package:vr_challenge/app/layers/domain/repositories/enrollment_repository.dart';

class GetStudentsNotEnrolledForCourseUseCase {
  final EnrollmentRepository enrollmentRepository;

  GetStudentsNotEnrolledForCourseUseCase({required this.enrollmentRepository});

  Future<List<int>> call(int courseCode) async {
    return await enrollmentRepository
        .getStudentsNotEnrolledForCourse(courseCode);
  }
}

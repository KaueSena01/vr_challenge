import 'package:vr_challenge/app/layers/domain/repositories/enrollment_repository.dart';

class GetCoursesNotEnrolledByStudentsUseCase {
  final EnrollmentRepository enrollmentRepository;

  GetCoursesNotEnrolledByStudentsUseCase({required this.enrollmentRepository});

  Future<List<int>> call(int studentCode) async {
    return await enrollmentRepository
        .getCoursesNotEnrolledByStudent(studentCode);
  }
}

import 'package:vr_challenge/app/layers/domain/entities/enrollment_entity.dart';
import 'package:vr_challenge/app/layers/domain/repositories/enrollment_repository.dart';

class SaveStudentAndCourseUseCase {
  final EnrollmentRepository enrollmentRepository;

  SaveStudentAndCourseUseCase({required this.enrollmentRepository});

  Future<void> call(EnrollmentEntity enrollmentEntity) async {
    await enrollmentRepository.saveStudentAndCourses(enrollmentEntity);
  }
}

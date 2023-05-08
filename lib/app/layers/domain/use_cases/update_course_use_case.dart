import 'package:vr_challenge/app/layers/domain/entities/course_entity.dart';
import 'package:vr_challenge/app/layers/domain/repositories/course_repository.dart';

class UpdateCourseUseCase {
  final CourseRepository courseRepository;

  UpdateCourseUseCase({required this.courseRepository});

  Future<void> call(CourseEntity courseEntity) async {
    await courseRepository.updateCourse(courseEntity);
  }
}

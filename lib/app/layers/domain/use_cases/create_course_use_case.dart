import 'package:vr_challenge/app/layers/domain/entities/course_entity.dart';
import 'package:vr_challenge/app/layers/domain/repositories/course_repository.dart';

class CreateCourseUseCase {
  final CourseRepository courseRepository;

  CreateCourseUseCase({required this.courseRepository});

  Future<void> call(CourseEntity courseEntity) async {
    await courseRepository.createCourse(courseEntity);
  }
}

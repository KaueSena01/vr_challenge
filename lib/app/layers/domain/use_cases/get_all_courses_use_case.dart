import 'package:vr_challenge/app/layers/domain/entities/course_entity.dart';
import 'package:vr_challenge/app/layers/domain/repositories/course_repository.dart';

class GetAllCoursesUseCase {
  final CourseRepository courseRepository;

  GetAllCoursesUseCase({required this.courseRepository});

  Future<List<CourseEntity>> call() async {
    return await courseRepository.getAllCourses();
  }
}

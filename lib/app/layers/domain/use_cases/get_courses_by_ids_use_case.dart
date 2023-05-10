import 'package:vr_challenge/app/layers/domain/entities/course_entity.dart';
import 'package:vr_challenge/app/layers/domain/repositories/course_repository.dart';

class GetCoursesByIdsUseCase {
  final CourseRepository courseRepository;

  GetCoursesByIdsUseCase({required this.courseRepository});

  Future<List<CourseEntity>> call(List<int> courseCode) async {
    return await courseRepository.getCoursesByIds(courseCode);
  }
}

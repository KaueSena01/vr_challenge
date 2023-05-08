import 'package:vr_challenge/app/layers/domain/repositories/course_repository.dart';

class DeleteCourseUseCase {
  final CourseRepository courseRepository;

  DeleteCourseUseCase({required this.courseRepository});

  Future<void> call(int courseCode) async {
    await courseRepository.deleteCourse(courseCode);
  }
}

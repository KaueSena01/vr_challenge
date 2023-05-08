import 'package:vr_challenge/app/layers/domain/entities/course_entity.dart';

abstract class CourseRepository {
  Future<void> createCourse(CourseEntity courseEntity);
  Future<List<CourseEntity>> getAllCourses();
  Future<void> updateCourse(CourseEntity courseEntity);
  Future<void> deleteCourse(int courseCode);
}

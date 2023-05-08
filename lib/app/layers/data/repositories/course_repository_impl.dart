import 'package:vr_challenge/app/layers/data/data_sources/course_datasource.dart';
import 'package:vr_challenge/app/layers/domain/entities/course_entity.dart';
import 'package:vr_challenge/app/layers/domain/repositories/course_repository.dart';

class CourseRepositoryImpl implements CourseRepository {
  final CourseDataSource courseDataSource;

  CourseRepositoryImpl({required this.courseDataSource});

  @override
  Future<void> createCourse(CourseEntity courseEntity) async {
    await courseDataSource.createCourse(courseEntity);
  }

  @override
  Future<List<CourseEntity>> getAllCourses() async {
    return await courseDataSource.getAllCourses();
  }

  @override
  Future<void> updateCourse(CourseEntity courseEntity) async {
    await courseDataSource.updateCourse(courseEntity);
  }

  @override
  Future<void> deleteCourse(int courseCode) async {
    await courseDataSource.deleteCourse(courseCode);
  }
}

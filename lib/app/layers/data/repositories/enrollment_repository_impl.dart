import 'package:vr_challenge/app/layers/data/data_sources/enrollment_datasource.dart';
import 'package:vr_challenge/app/layers/domain/entities/enrollment_entity.dart';
import 'package:vr_challenge/app/layers/domain/repositories/enrollment_repository.dart';

class EnrollmentRepositoryImpl implements EnrollmentRepository {
  final EnrollmentDataSource enrollmentDataSource;

  EnrollmentRepositoryImpl({required this.enrollmentDataSource});

  @override
  Future<void> saveStudentAndCourses(EnrollmentEntity enrollmentEntity) async {
    await enrollmentDataSource.saveStudentAndCourses(enrollmentEntity);
  }

  @override
  Future<int> getEnrolledCoursesCount(int courseCode) async {
    return await enrollmentDataSource.getEnrolledCoursesCount(courseCode);
  }

  @override
  Future<List<int>> getStudentsNotEnrolledForCourse(int courseCode) async {
    return await enrollmentDataSource
        .getStudentsNotEnrolledForCourse(courseCode);
  }

  @override
  Future<List<int>> getEnrolledStudentsForCourse(int courseCode) async {
    return await enrollmentDataSource.getEnrolledStudentsForCourse(courseCode);
  }

  @override
  Future<void> updateCourseStudents(
      List<int> studentCode, int courseCode) async {
    await enrollmentDataSource.updateCourseStudents(studentCode, courseCode);
  }
}

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

  @override
  Future<void> removeCourseFromEnrollment(
      List<int> studentCode, int courseCode) async {
    await enrollmentDataSource.removeCourseFromEnrollment(
        studentCode, courseCode);
  }

  @override
  Future<List<int>> getCoursesEnrolledByStudent(int studentCode) async {
    return await enrollmentDataSource.getCoursesEnrolledByStudent(studentCode);
  }

  @override
  Future<List<int>> getCoursesNotEnrolledByStudent(int studentCode) async {
    return await enrollmentDataSource
        .getCoursesNotEnrolledByStudent(studentCode);
  }

  @override
  Future<void> updateEnrolledCourses(
      int studentCode, List<int> courseCodes) async {
    await enrollmentDataSource.updateEnrolledCourses(studentCode, courseCodes);
  }

  @override
  Future<void> removeEnrollment(int studentCode) async {
    await enrollmentDataSource.removeEnrollment(studentCode);
  }
}

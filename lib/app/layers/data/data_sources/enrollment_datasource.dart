import 'package:vr_challenge/app/layers/domain/entities/enrollment_entity.dart';

abstract class EnrollmentDataSource {
  Future<void> saveStudentAndCourses(EnrollmentEntity enrollmentEntity);
  Future<int> getEnrolledCoursesCount(int courseCode);
  Future<List<int>> getStudentsNotEnrolledForCourse(int courseCode);
  Future<List<int>> getEnrolledStudentsForCourse(int courseCode);
}

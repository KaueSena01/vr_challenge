import 'package:vr_challenge/app/layers/domain/entities/enrollment_entity.dart';

abstract class EnrollmentRepository {
  Future<void> saveStudentAndCourses(EnrollmentEntity enrollmentEntity);
  Future<int> getEnrolledCoursesCount(int courseCode);
  Future<List<int>> getStudentsNotEnrolledForCourse(int courseCode);
  Future<List<int>> getEnrolledStudentsForCourse(int courseCode);
  Future<void> updateCourseStudents(List<int> studentCode, int courseCode);
  Future<void> removeCourseFromEnrollment(
      List<int> studentCode, int courseCode);
  Future<List<int>> getCoursesEnrolledByStudent(int studentCode);
  Future<List<int>> getCoursesNotEnrolledByStudent(int studentCode);
  Future<void> updateEnrolledCourses(int studentCode, List<int> courseCodes);
  Future<void> removeEnrollment(int studentCode);
}

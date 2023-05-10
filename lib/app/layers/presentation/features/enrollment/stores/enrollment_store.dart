import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:vr_challenge/app/layers/domain/entities/enrollment_entity.dart';
import 'package:vr_challenge/app/layers/domain/use_cases/get_enrolled_students_for_course_use_case.dart';
import 'package:vr_challenge/app/layers/domain/use_cases/get_quantity_of_students_use_case.dart';
import 'package:vr_challenge/app/layers/domain/use_cases/get_students_not_enrolled_for_course_use_case.dart';
import 'package:vr_challenge/app/layers/domain/use_cases/save_student_and_course_use_case.dart';
import 'package:vr_challenge/app/layers/domain/use_cases/update_course_students_use_case.dart';
part 'enrollment_store.g.dart';

class EnrollmentStore = _EnrollmentStoreBase with _$EnrollmentStore;

abstract class _EnrollmentStoreBase with Store {
  final SaveStudentAndCourseUseCase _saveStudentAndCourseUseCase;
  final GetEnrolledCoursesCountUseCase _getEnrolledCoursesCountUseCase;
  final GetStudentsNotEnrolledForCourseUseCase
      _getStudentsNotEnrolledForCourseUseCase;
  final GetEnrolledStudentsForCourseUseCase
      _getEnrolledStudentsForCourseUseCase;
  final UpdateCourseStudentsUseCase _updateCourseStudentsUseCase;

  _EnrollmentStoreBase(
    this._saveStudentAndCourseUseCase,
    this._getEnrolledCoursesCountUseCase,
    this._getStudentsNotEnrolledForCourseUseCase,
    this._getEnrolledStudentsForCourseUseCase,
    this._updateCourseStudentsUseCase,
  );

  @observable
  bool loading = false;

  @observable
  int count = 0;

  @observable
  int enrollmentCount = 0;

  @observable
  List<int> studentsNotEnrolled = [];

  @observable
  List<int> studentsEnrolled = [];

  @action
  Future<void> saveStudentAndCourse(
    int studentCode,
    List<int> courseCode,
  ) async {
    loading = true;

    try {
      await _saveStudentAndCourseUseCase(
        EnrollmentEntity(
          studentCode: studentCode,
          courseCode: courseCode,
        ),
      );
    } catch (_) {
    } finally {
      loading = false;
    }
  }

  @action
  Future<void> getEnrolledCoursesCount(
    int studentCode,
  ) async {
    loading = true;

    try {
      count = await _getEnrolledCoursesCountUseCase(studentCode);
      enrollmentCount = count;
    } catch (_) {
    } finally {
      loading = false;
    }
  }

  @action
  Future<void> getStudentsNotEnrolledForCourse(
    int courseCode,
  ) async {
    loading = true;

    try {
      studentsNotEnrolled =
          await _getStudentsNotEnrolledForCourseUseCase(courseCode);
    } catch (_) {
    } finally {
      loading = false;
    }
  }

  @action
  Future<void> getStudentsEnrolledForCourse(
    int courseCode,
  ) async {
    loading = true;

    try {
      studentsEnrolled = await _getEnrolledStudentsForCourseUseCase(courseCode);
    } catch (_) {
    } finally {
      loading = false;
    }
  }

  @action
  void updateEnrollmentCount(int updateCount) {
    enrollmentCount = enrollmentCount + updateCount;
  }

  @action
  Future<void> updateCourseStudents(
      List<int> studentCode, int courseCode) async {
    loading = true;

    try {
      await _updateCourseStudentsUseCase(studentCode, courseCode);
      Modular.to.navigate('/home');
    } catch (_) {
    } finally {
      loading = false;
    }
  }
}

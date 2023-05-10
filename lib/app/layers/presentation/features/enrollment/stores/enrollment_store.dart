import 'package:asuka/snackbars/asuka_snack_bar.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:vr_challenge/app/layers/domain/entities/enrollment_entity.dart';
import 'package:vr_challenge/app/layers/domain/use_cases/get_courses_enrolled_by_student_use_case.dart';
import 'package:vr_challenge/app/layers/domain/use_cases/get_courses_not_enrolled_by_student_use_case.dart';
import 'package:vr_challenge/app/layers/domain/use_cases/get_enrolled_students_for_course_use_case.dart';
import 'package:vr_challenge/app/layers/domain/use_cases/get_quantity_of_students_use_case.dart';
import 'package:vr_challenge/app/layers/domain/use_cases/get_students_not_enrolled_for_course_use_case.dart';
import 'package:vr_challenge/app/layers/domain/use_cases/remove_course_from_enrollment_use_case.dart';
import 'package:vr_challenge/app/layers/domain/use_cases/remove_enrollment_use_case.dart';
import 'package:vr_challenge/app/layers/domain/use_cases/save_student_and_course_use_case.dart';
import 'package:vr_challenge/app/layers/domain/use_cases/update_course_students_use_case.dart';
import 'package:vr_challenge/app/layers/domain/use_cases/update_enrolled_courses_use_case.dart';
import 'package:vr_challenge/app/layers/presentation/features/enrollment/pages/course/stores/course_store.dart';
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
  final RemoveCourseFromEnrollmentUseCase _removeCourseFromEnrollmentUseCase;
  final GetCoursesEnrolledByStudentsUseCase
      _getCoursesEnrolledByStudentsUseCase;
  final GetCoursesNotEnrolledByStudentsUseCase
      _getCoursesNotEnrolledByStudentsUseCase;
  final UpdateEnrolledCoursesUseCase _updateEnrolledCoursesUseCase;
  final RemoveEnrollmentUseCase _removeEnrollmentUseCase;

  _EnrollmentStoreBase(
    this._saveStudentAndCourseUseCase,
    this._getEnrolledCoursesCountUseCase,
    this._getStudentsNotEnrolledForCourseUseCase,
    this._getEnrolledStudentsForCourseUseCase,
    this._updateCourseStudentsUseCase,
    this._removeCourseFromEnrollmentUseCase,
    this._getCoursesEnrolledByStudentsUseCase,
    this._getCoursesNotEnrolledByStudentsUseCase,
    this._updateEnrolledCoursesUseCase,
    this._removeEnrollmentUseCase,
  );

  CourseStore courseStore = Modular.get<CourseStore>();

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

  @observable
  List<int> enrollmentCourses = [];

  @observable
  List<int> coursesNotEnrolled = [];

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
    List<int> studentCode,
    int courseCode,
  ) async {
    loading = true;

    try {
      await _updateCourseStudentsUseCase(studentCode, courseCode);
      Modular.to.navigate('/home');
    } catch (_) {
    } finally {
      loading = false;
    }
  }

  @action
  Future<void> removeCourseFromEnrollment(int courseCode) async {
    loading = true;
    try {
      await getStudentsEnrolledForCourse(courseCode);
      await _removeCourseFromEnrollmentUseCase(studentsEnrolled, courseCode);
    } catch (_) {
      AsukaSnackbar.alert(
        "Ocorreu um erro ao remover o curso",
      ).show();
    } finally {
      loading = false;
    }
  }

  @action
  Future<void> getCoursesEnrolledByStudent(int studentCode) async {
    loading = true;
    try {
      enrollmentCourses = await _getCoursesEnrolledByStudentsUseCase(
        studentCode,
      );
      courseStore.getCoursesNotEnrolled = 0;
      courseStore.coursesEnrolled = [];
      await courseStore.getCoursesByIds(enrollmentCourses);
    } catch (_) {
    } finally {
      loading = false;
    }
  }

  @action
  Future<void> getCoursesNotEnrolledByStudent(int studentCode) async {
    loading = true;
    try {
      coursesNotEnrolled = await _getCoursesNotEnrolledByStudentsUseCase(
        studentCode,
      );
      courseStore.getCoursesNotEnrolled = 1;
      courseStore.coursesNotEnrolled = [];
      await courseStore.getCoursesByIds(coursesNotEnrolled);
    } catch (_) {
    } finally {
      loading = false;
    }
  }

  @action
  Future<void> updateEnrolledCourses(int studentCode) async {
    loading = true;
    try {
      await _updateEnrolledCoursesUseCase(
        studentCode,
        courseStore.selectedCourses,
      );
    } catch (_) {
    } finally {
      loading = false;
    }
  }

  @action
  Future<void> removeEnrollment(int studentCode) async {
    loading = true;
    try {
      await _removeEnrollmentUseCase(studentCode);
    } catch (_) {
    } finally {
      loading = false;
    }
  }
}

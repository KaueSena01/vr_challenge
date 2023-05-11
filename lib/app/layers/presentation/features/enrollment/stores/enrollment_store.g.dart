// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'enrollment_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$EnrollmentStore on _EnrollmentStoreBase, Store {
  late final _$loadingAtom =
      Atom(name: '_EnrollmentStoreBase.loading', context: context);

  @override
  bool get loading {
    _$loadingAtom.reportRead();
    return super.loading;
  }

  @override
  set loading(bool value) {
    _$loadingAtom.reportWrite(value, super.loading, () {
      super.loading = value;
    });
  }

  late final _$countAtom =
      Atom(name: '_EnrollmentStoreBase.count', context: context);

  @override
  int get count {
    _$countAtom.reportRead();
    return super.count;
  }

  @override
  set count(int value) {
    _$countAtom.reportWrite(value, super.count, () {
      super.count = value;
    });
  }

  late final _$enrollmentCountAtom =
      Atom(name: '_EnrollmentStoreBase.enrollmentCount', context: context);

  @override
  int get enrollmentCount {
    _$enrollmentCountAtom.reportRead();
    return super.enrollmentCount;
  }

  @override
  set enrollmentCount(int value) {
    _$enrollmentCountAtom.reportWrite(value, super.enrollmentCount, () {
      super.enrollmentCount = value;
    });
  }

  late final _$studentsEnrolledAtom =
      Atom(name: '_EnrollmentStoreBase.studentsEnrolled', context: context);

  @override
  List<int> get studentsEnrolled {
    _$studentsEnrolledAtom.reportRead();
    return super.studentsEnrolled;
  }

  @override
  set studentsEnrolled(List<int> value) {
    _$studentsEnrolledAtom.reportWrite(value, super.studentsEnrolled, () {
      super.studentsEnrolled = value;
    });
  }

  late final _$studentsNotEnrolledAtom =
      Atom(name: '_EnrollmentStoreBase.studentsNotEnrolled', context: context);

  @override
  List<int> get studentsNotEnrolled {
    _$studentsNotEnrolledAtom.reportRead();
    return super.studentsNotEnrolled;
  }

  @override
  set studentsNotEnrolled(List<int> value) {
    _$studentsNotEnrolledAtom.reportWrite(value, super.studentsNotEnrolled, () {
      super.studentsNotEnrolled = value;
    });
  }

  late final _$enrollmentCoursesAtom =
      Atom(name: '_EnrollmentStoreBase.enrollmentCourses', context: context);

  @override
  List<int> get enrollmentCourses {
    _$enrollmentCoursesAtom.reportRead();
    return super.enrollmentCourses;
  }

  @override
  set enrollmentCourses(List<int> value) {
    _$enrollmentCoursesAtom.reportWrite(value, super.enrollmentCourses, () {
      super.enrollmentCourses = value;
    });
  }

  late final _$coursesNotEnrolledAtom =
      Atom(name: '_EnrollmentStoreBase.coursesNotEnrolled', context: context);

  @override
  List<int> get coursesNotEnrolled {
    _$coursesNotEnrolledAtom.reportRead();
    return super.coursesNotEnrolled;
  }

  @override
  set coursesNotEnrolled(List<int> value) {
    _$coursesNotEnrolledAtom.reportWrite(value, super.coursesNotEnrolled, () {
      super.coursesNotEnrolled = value;
    });
  }

  late final _$saveStudentAndCourseAsyncAction = AsyncAction(
      '_EnrollmentStoreBase.saveStudentAndCourse',
      context: context);

  @override
  Future<void> saveStudentAndCourse(int studentCode, List<int> courseCode) {
    return _$saveStudentAndCourseAsyncAction
        .run(() => super.saveStudentAndCourse(studentCode, courseCode));
  }

  late final _$getEnrolledCoursesCountAsyncAction = AsyncAction(
      '_EnrollmentStoreBase.getEnrolledCoursesCount',
      context: context);

  @override
  Future<void> getEnrolledCoursesCount(int studentCode) {
    return _$getEnrolledCoursesCountAsyncAction
        .run(() => super.getEnrolledCoursesCount(studentCode));
  }

  late final _$getStudentsNotEnrolledForCourseAsyncAction = AsyncAction(
      '_EnrollmentStoreBase.getStudentsNotEnrolledForCourse',
      context: context);

  @override
  Future<void> getStudentsNotEnrolledForCourse(int courseCode) {
    return _$getStudentsNotEnrolledForCourseAsyncAction
        .run(() => super.getStudentsNotEnrolledForCourse(courseCode));
  }

  late final _$getStudentsEnrolledForCourseAsyncAction = AsyncAction(
      '_EnrollmentStoreBase.getStudentsEnrolledForCourse',
      context: context);

  @override
  Future<void> getStudentsEnrolledForCourse(int courseCode) {
    return _$getStudentsEnrolledForCourseAsyncAction
        .run(() => super.getStudentsEnrolledForCourse(courseCode));
  }

  late final _$updateCourseStudentsAsyncAction = AsyncAction(
      '_EnrollmentStoreBase.updateCourseStudents',
      context: context);

  @override
  Future<void> updateCourseStudents(List<int> studentCode, int courseCode) {
    return _$updateCourseStudentsAsyncAction
        .run(() => super.updateCourseStudents(studentCode, courseCode));
  }

  late final _$removeCourseFromEnrollmentAsyncAction = AsyncAction(
      '_EnrollmentStoreBase.removeCourseFromEnrollment',
      context: context);

  @override
  Future<void> removeCourseFromEnrollment(int courseCode) {
    return _$removeCourseFromEnrollmentAsyncAction
        .run(() => super.removeCourseFromEnrollment(courseCode));
  }

  late final _$getCoursesEnrolledByStudentAsyncAction = AsyncAction(
      '_EnrollmentStoreBase.getCoursesEnrolledByStudent',
      context: context);

  @override
  Future<void> getCoursesEnrolledByStudent(int studentCode) {
    return _$getCoursesEnrolledByStudentAsyncAction
        .run(() => super.getCoursesEnrolledByStudent(studentCode));
  }

  late final _$getCoursesNotEnrolledByStudentAsyncAction = AsyncAction(
      '_EnrollmentStoreBase.getCoursesNotEnrolledByStudent',
      context: context);

  @override
  Future<void> getCoursesNotEnrolledByStudent(int studentCode) {
    return _$getCoursesNotEnrolledByStudentAsyncAction
        .run(() => super.getCoursesNotEnrolledByStudent(studentCode));
  }

  late final _$updateEnrolledCoursesAsyncAction = AsyncAction(
      '_EnrollmentStoreBase.updateEnrolledCourses',
      context: context);

  @override
  Future<void> updateEnrolledCourses(int studentCode) {
    return _$updateEnrolledCoursesAsyncAction
        .run(() => super.updateEnrolledCourses(studentCode));
  }

  late final _$removeEnrollmentAsyncAction =
      AsyncAction('_EnrollmentStoreBase.removeEnrollment', context: context);

  @override
  Future<void> removeEnrollment(int studentCode) {
    return _$removeEnrollmentAsyncAction
        .run(() => super.removeEnrollment(studentCode));
  }

  late final _$_EnrollmentStoreBaseActionController =
      ActionController(name: '_EnrollmentStoreBase', context: context);

  @override
  void updateEnrollmentCount(int updateCount) {
    final _$actionInfo = _$_EnrollmentStoreBaseActionController.startAction(
        name: '_EnrollmentStoreBase.updateEnrollmentCount');
    try {
      return super.updateEnrollmentCount(updateCount);
    } finally {
      _$_EnrollmentStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
loading: ${loading},
count: ${count},
enrollmentCount: ${enrollmentCount},
studentsEnrolled: ${studentsEnrolled},
studentsNotEnrolled: ${studentsNotEnrolled},
enrollmentCourses: ${enrollmentCourses},
coursesNotEnrolled: ${coursesNotEnrolled}
    ''';
  }
}

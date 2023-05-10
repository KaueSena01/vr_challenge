// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'course_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$CourseStore on _CourseStoreBase, Store {
  Computed<List<CourseEntity>>? _$filteredCoursesComputed;

  @override
  List<CourseEntity> get filteredCourses => (_$filteredCoursesComputed ??=
          Computed<List<CourseEntity>>(() => super.filteredCourses,
              name: '_CourseStoreBase.filteredCourses'))
      .value;

  late final _$loadingAtom =
      Atom(name: '_CourseStoreBase.loading', context: context);

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

  late final _$coursesListAtom =
      Atom(name: '_CourseStoreBase.coursesList', context: context);

  @override
  List<CourseEntity> get coursesList {
    _$coursesListAtom.reportRead();
    return super.coursesList;
  }

  @override
  set coursesList(List<CourseEntity> value) {
    _$coursesListAtom.reportWrite(value, super.coursesList, () {
      super.coursesList = value;
    });
  }

  late final _$coursesEnrolledAtom =
      Atom(name: '_CourseStoreBase.coursesEnrolled', context: context);

  @override
  List<CourseEntity> get coursesEnrolled {
    _$coursesEnrolledAtom.reportRead();
    return super.coursesEnrolled;
  }

  @override
  set coursesEnrolled(List<CourseEntity> value) {
    _$coursesEnrolledAtom.reportWrite(value, super.coursesEnrolled, () {
      super.coursesEnrolled = value;
    });
  }

  late final _$coursesNotEnrolledAtom =
      Atom(name: '_CourseStoreBase.coursesNotEnrolled', context: context);

  @override
  List<CourseEntity> get coursesNotEnrolled {
    _$coursesNotEnrolledAtom.reportRead();
    return super.coursesNotEnrolled;
  }

  @override
  set coursesNotEnrolled(List<CourseEntity> value) {
    _$coursesNotEnrolledAtom.reportWrite(value, super.coursesNotEnrolled, () {
      super.coursesNotEnrolled = value;
    });
  }

  late final _$getCoursesNotEnrolledAtom =
      Atom(name: '_CourseStoreBase.getCoursesNotEnrolled', context: context);

  @override
  int get getCoursesNotEnrolled {
    _$getCoursesNotEnrolledAtom.reportRead();
    return super.getCoursesNotEnrolled;
  }

  @override
  set getCoursesNotEnrolled(int value) {
    _$getCoursesNotEnrolledAtom.reportWrite(value, super.getCoursesNotEnrolled,
        () {
      super.getCoursesNotEnrolled = value;
    });
  }

  late final _$searchFilterAtom =
      Atom(name: '_CourseStoreBase.searchFilter', context: context);

  @override
  String get searchFilter {
    _$searchFilterAtom.reportRead();
    return super.searchFilter;
  }

  @override
  set searchFilter(String value) {
    _$searchFilterAtom.reportWrite(value, super.searchFilter, () {
      super.searchFilter = value;
    });
  }

  late final _$selectedCoursesAtom =
      Atom(name: '_CourseStoreBase.selectedCourses', context: context);

  @override
  List<int> get selectedCourses {
    _$selectedCoursesAtom.reportRead();
    return super.selectedCourses;
  }

  @override
  set selectedCourses(List<int> value) {
    _$selectedCoursesAtom.reportWrite(value, super.selectedCourses, () {
      super.selectedCourses = value;
    });
  }

  late final _$createCourseAsyncAction =
      AsyncAction('_CourseStoreBase.createCourse', context: context);

  @override
  Future<void> createCourse(String name, String description, String syllabus) {
    return _$createCourseAsyncAction
        .run(() => super.createCourse(name, description, syllabus));
  }

  late final _$getAllCoursesAsyncAction =
      AsyncAction('_CourseStoreBase.getAllCourses', context: context);

  @override
  Future<void> getAllCourses() {
    return _$getAllCoursesAsyncAction.run(() => super.getAllCourses());
  }

  late final _$getCoursesByIdsAsyncAction =
      AsyncAction('_CourseStoreBase.getCoursesByIds', context: context);

  @override
  Future<void> getCoursesByIds(List<int> courseCode) {
    return _$getCoursesByIdsAsyncAction
        .run(() => super.getCoursesByIds(courseCode));
  }

  late final _$updateCourseAsyncAction =
      AsyncAction('_CourseStoreBase.updateCourse', context: context);

  @override
  Future<void> updateCourse(
      int id, String name, String description, String syllabus) {
    return _$updateCourseAsyncAction
        .run(() => super.updateCourse(id, name, description, syllabus));
  }

  late final _$deleteCourseAsyncAction =
      AsyncAction('_CourseStoreBase.deleteCourse', context: context);

  @override
  Future<void> deleteCourse(int id) {
    return _$deleteCourseAsyncAction.run(() => super.deleteCourse(id));
  }

  late final _$_CourseStoreBaseActionController =
      ActionController(name: '_CourseStoreBase', context: context);

  @override
  void searchCourses(String search) {
    final _$actionInfo = _$_CourseStoreBaseActionController.startAction(
        name: '_CourseStoreBase.searchCourses');
    try {
      return super.searchCourses(search);
    } finally {
      _$_CourseStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  List<int> handleCourseSelection(int courseId) {
    final _$actionInfo = _$_CourseStoreBaseActionController.startAction(
        name: '_CourseStoreBase.handleCourseSelection');
    try {
      return super.handleCourseSelection(courseId);
    } finally {
      _$_CourseStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void resetCourses() {
    final _$actionInfo = _$_CourseStoreBaseActionController.startAction(
        name: '_CourseStoreBase.resetCourses');
    try {
      return super.resetCourses();
    } finally {
      _$_CourseStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
loading: ${loading},
coursesList: ${coursesList},
coursesEnrolled: ${coursesEnrolled},
coursesNotEnrolled: ${coursesNotEnrolled},
getCoursesNotEnrolled: ${getCoursesNotEnrolled},
searchFilter: ${searchFilter},
selectedCourses: ${selectedCourses},
filteredCourses: ${filteredCourses}
    ''';
  }
}

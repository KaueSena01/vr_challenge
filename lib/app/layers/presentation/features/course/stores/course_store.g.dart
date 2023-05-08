// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'course_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$CourseStore on _CourseStoreBase, Store {
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

  late final _$createCourseAsyncAction =
      AsyncAction('_CourseStoreBase.createCourse', context: context);

  @override
  Future<void> createCourse(String title, String description, String syllabus) {
    return _$createCourseAsyncAction
        .run(() => super.createCourse(title, description, syllabus));
  }

  late final _$getAllCoursesAsyncAction =
      AsyncAction('_CourseStoreBase.getAllCourses', context: context);

  @override
  Future<void> getAllCourses() {
    return _$getAllCoursesAsyncAction.run(() => super.getAllCourses());
  }

  late final _$updateCourseAsyncAction =
      AsyncAction('_CourseStoreBase.updateCourse', context: context);

  @override
  Future<void> updateCourse(
      int id, String title, String description, String syllabus) {
    return _$updateCourseAsyncAction
        .run(() => super.updateCourse(id, title, description, syllabus));
  }

  late final _$deleteCourseAsyncAction =
      AsyncAction('_CourseStoreBase.deleteCourse', context: context);

  @override
  Future<void> deleteCourse(int id) {
    return _$deleteCourseAsyncAction.run(() => super.deleteCourse(id));
  }

  @override
  String toString() {
    return '''
loading: ${loading},
coursesList: ${coursesList}
    ''';
  }
}

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'student_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$StudentStore on _StudentStoreBase, Store {
  Computed<List<StudentEntity>>? _$filteredStudentsComputed;

  @override
  List<StudentEntity> get filteredStudents => (_$filteredStudentsComputed ??=
          Computed<List<StudentEntity>>(() => super.filteredStudents,
              name: '_StudentStoreBase.filteredStudents'))
      .value;
  Computed<List<StudentEntity>>? _$filteredStudentsNoEnrollmentComputed;

  @override
  List<StudentEntity> get filteredStudentsNoEnrollment =>
      (_$filteredStudentsNoEnrollmentComputed ??= Computed<List<StudentEntity>>(
              () => super.filteredStudentsNoEnrollment,
              name: '_StudentStoreBase.filteredStudentsNoEnrollment'))
          .value;

  late final _$loadingAtom =
      Atom(name: '_StudentStoreBase.loading', context: context);

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

  late final _$studentsListAtom =
      Atom(name: '_StudentStoreBase.studentsList', context: context);

  @override
  List<StudentEntity> get studentsList {
    _$studentsListAtom.reportRead();
    return super.studentsList;
  }

  @override
  set studentsList(List<StudentEntity> value) {
    _$studentsListAtom.reportWrite(value, super.studentsList, () {
      super.studentsList = value;
    });
  }

  late final _$studentsListNoEnrollmentAtom = Atom(
      name: '_StudentStoreBase.studentsListNoEnrollment', context: context);

  @override
  List<StudentEntity> get studentsListNoEnrollment {
    _$studentsListNoEnrollmentAtom.reportRead();
    return super.studentsListNoEnrollment;
  }

  @override
  set studentsListNoEnrollment(List<StudentEntity> value) {
    _$studentsListNoEnrollmentAtom
        .reportWrite(value, super.studentsListNoEnrollment, () {
      super.studentsListNoEnrollment = value;
    });
  }

  late final _$selectedStudentsAtom =
      Atom(name: '_StudentStoreBase.selectedStudents', context: context);

  @override
  List<int> get selectedStudents {
    _$selectedStudentsAtom.reportRead();
    return super.selectedStudents;
  }

  @override
  set selectedStudents(List<int> value) {
    _$selectedStudentsAtom.reportWrite(value, super.selectedStudents, () {
      super.selectedStudents = value;
    });
  }

  late final _$searchFilterAtom =
      Atom(name: '_StudentStoreBase.searchFilter', context: context);

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

  late final _$createNewStudentAsyncAction =
      AsyncAction('_StudentStoreBase.createNewStudent', context: context);

  @override
  Future<void> createNewStudent(
      String name, String email, String password, List<int> courseCode) {
    return _$createNewStudentAsyncAction
        .run(() => super.createNewStudent(name, email, password, courseCode));
  }

  late final _$getAllStudentsAsyncAction =
      AsyncAction('_StudentStoreBase.getAllStudents', context: context);

  @override
  Future<void> getAllStudents() {
    return _$getAllStudentsAsyncAction.run(() => super.getAllStudents());
  }

  late final _$getAllStudentsByIdsAsyncAction =
      AsyncAction('_StudentStoreBase.getAllStudentsByIds', context: context);

  @override
  Future<void> getAllStudentsByIds() {
    return _$getAllStudentsByIdsAsyncAction
        .run(() => super.getAllStudentsByIds());
  }

  late final _$updateStudentAsyncAction =
      AsyncAction('_StudentStoreBase.updateStudent', context: context);

  @override
  Future<void> updateStudent(
      int id, String name, String email, String password) {
    return _$updateStudentAsyncAction
        .run(() => super.updateStudent(id, name, email, password));
  }

  late final _$deleteStudentAsyncAction =
      AsyncAction('_StudentStoreBase.deleteStudent', context: context);

  @override
  Future<void> deleteStudent(int id) {
    return _$deleteStudentAsyncAction.run(() => super.deleteStudent(id));
  }

  late final _$_StudentStoreBaseActionController =
      ActionController(name: '_StudentStoreBase', context: context);

  @override
  void searchStudents(String search) {
    final _$actionInfo = _$_StudentStoreBaseActionController.startAction(
        name: '_StudentStoreBase.searchStudents');
    try {
      return super.searchStudents(search);
    } finally {
      _$_StudentStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  List<int> handleStudentSelection(int studentCode) {
    final _$actionInfo = _$_StudentStoreBaseActionController.startAction(
        name: '_StudentStoreBase.handleStudentSelection');
    try {
      return super.handleStudentSelection(studentCode);
    } finally {
      _$_StudentStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
loading: ${loading},
studentsList: ${studentsList},
studentsListNoEnrollment: ${studentsListNoEnrollment},
selectedStudents: ${selectedStudents},
searchFilter: ${searchFilter},
filteredStudents: ${filteredStudents},
filteredStudentsNoEnrollment: ${filteredStudentsNoEnrollment}
    ''';
  }
}

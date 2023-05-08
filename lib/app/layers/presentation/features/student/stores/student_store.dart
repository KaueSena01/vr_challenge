import 'package:asuka/snackbars/asuka_snack_bar.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:vr_challenge/app/layers/domain/entities/student_entity.dart';
import 'package:vr_challenge/app/layers/domain/use_cases/create_new_student_use_case.dart';
import 'package:vr_challenge/app/layers/domain/use_cases/delete_student_use_case.dart';
import 'package:vr_challenge/app/layers/domain/use_cases/get_all_students_use_case.dart';
import 'package:vr_challenge/app/layers/domain/use_cases/update_student_use_case.dart';
part 'student_store.g.dart';

class StudentStore = _StudentStoreBase with _$StudentStore;

abstract class _StudentStoreBase with Store {
  final CreateNewStudentUseCase _createNewStudent;
  final GetAllStudentUseCase _getAllStudentUseCase;
  final UpdateStudentUseCase _updateStudentUseCase;
  final DeleteStudentUseCase _deleteStudentUseCase;

  _StudentStoreBase(
    this._createNewStudent,
    this._getAllStudentUseCase,
    this._updateStudentUseCase,
    this._deleteStudentUseCase,
  );

  @observable
  bool loading = false;

  @observable
  List<StudentEntity> studentsList = [];

  @action
  Future<void> createNewStudent(
    String name,
    String email,
    String password,
  ) async {
    loading = true;

    try {
      await _createNewStudent(
        StudentEntity(
          name: name,
          email: email,
          password: password,
        ),
      );
      Modular.to.pop();
      AsukaSnackbar.success(
        "O aluno(a) $name foi adicionado a plataforma",
      ).show();
    } catch (_) {
      AsukaSnackbar.alert(
        "Ocorreu um erro, verifique o nome do curso",
      ).show();
    } finally {
      loading = false;
    }
  }

  @action
  Future<void> getAllStudents() async {
    loading = true;

    try {
      final students = await _getAllStudentUseCase();
      studentsList = students;
      print(studentsList);
    } catch (_) {
      AsukaSnackbar.alert(
        "Ocorreu um erro ao buscar os alunos",
      ).show();
    } finally {
      loading = false;
    }
  }

  @action
  Future<void> updateStudent(
    int id,
    String name,
    String email,
    String password,
  ) async {
    loading = true;

    try {
      await _updateStudentUseCase(
        StudentEntity(
          id: id,
          name: name,
          email: email,
          password: password,
        ),
      );
      Modular.to.navigate('/home');
    } catch (_) {
      AsukaSnackbar.alert(
        "Ocorreu um erro, verifique o nome do aluno(a)",
      ).show();
    } finally {
      loading = false;
    }
  }

  @action
  Future<void> deleteCourse(int id) async {
    loading = true;

    try {
      await _deleteStudentUseCase.call(id);
      Modular.to.navigate('students');
      AsukaSnackbar.alert(
        "O aluno(a) foi removido",
      ).show();
    } catch (_) {
      AsukaSnackbar.alert(
        "Ocorreu um erro, tente novamente mais tarde",
      ).show();
    } finally {
      loading = false;
    }
  }
}

import 'package:asuka/snackbars/asuka_snack_bar.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:vr_challenge/app/layers/domain/entities/course_entity.dart';
import 'package:vr_challenge/app/layers/domain/use_cases/create_course_use_case.dart';
import 'package:vr_challenge/app/layers/domain/use_cases/delete_course_use_case.dart';
import 'package:vr_challenge/app/layers/domain/use_cases/get_all_courses_use_case.dart';
import 'package:vr_challenge/app/layers/domain/use_cases/update_course_use_case.dart';
part 'course_store.g.dart';

class CourseStore = _CourseStoreBase with _$CourseStore;

abstract class _CourseStoreBase with Store {
  final CreateCourseUseCase _createCourseUseCase;
  final GetAllCoursesUseCase _getAllCoursesUseCase;
  final UpdateCourseUseCase _updateCourseUseCase;
  final DeleteCourseUseCase _deleteCourseUseCase;

  _CourseStoreBase(
    this._createCourseUseCase,
    this._getAllCoursesUseCase,
    this._updateCourseUseCase,
    this._deleteCourseUseCase,
  );

  @observable
  bool loading = false;

  @observable
  List<CourseEntity> coursesList = [];

  @observable
  String searchFilter = '';

  @observable
  List<int> selectedCourses = [];

  @computed
  List<CourseEntity> get filteredCourses => coursesList
      .where((course) =>
          course.name.toLowerCase().contains(searchFilter.toLowerCase()))
      .toList();

  @action
  List<int> handleCourseSelection(int courseId) {
    loading = true;
    if (selectedCourses.contains(courseId)) {
      selectedCourses.remove(courseId);
    } else if (selectedCourses.length == 3) {
      AsukaSnackbar.warning(
        "Um aluno não pode estar matriculado em mais de 3 cursos",
      ).show();
    } else if (selectedCourses.length < 3) {
      selectedCourses.add(courseId);
    }
    loading = false;
    return selectedCourses;
  }

  @action
  void searchCourses(String search) {
    searchFilter = search.toLowerCase();
  }

  @action
  Future<void> createCourse(
    String name,
    String description,
    String syllabus,
  ) async {
    loading = true;

    try {
      await _createCourseUseCase(
        CourseEntity(
          name: name,
          description: description,
          syllabus: syllabus,
        ),
      );
      Modular.to.pop();
      AsukaSnackbar.success(
        "O curso de $name foi adicionado com sucesso",
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
  Future<void> getAllCourses() async {
    loading = true;

    try {
      final courses = await _getAllCoursesUseCase();
      coursesList = courses;
    } catch (_) {
      AsukaSnackbar.alert(
        "Ocorreu um erro, verifique o nome do curso",
      ).show();
    } finally {
      loading = false;
    }
  }

  @action
  Future<void> updateCourse(
    int id,
    String name,
    String description,
    String syllabus,
  ) async {
    loading = true;

    try {
      await _updateCourseUseCase(
        CourseEntity(
          id: id,
          name: name,
          description: description,
          syllabus: syllabus,
        ),
      );
      Modular.to.pop();
    } catch (_) {
      AsukaSnackbar.alert(
        "Ocorreu um erro, verifique o nome do curso",
      ).show();
    } finally {
      loading = false;
    }
  }

  @action
  Future<void> deleteCourse(int id) async {
    loading = true;

    try {
      await _deleteCourseUseCase.call(id);
      Modular.to.pop();
      AsukaSnackbar.alert(
        "O curso foi removido",
      ).show();
    } catch (_) {
      AsukaSnackbar.alert(
        "Ocorreu um erro, verifique o nome do curso",
      ).show();
    } finally {
      loading = false;
    }
  }
}

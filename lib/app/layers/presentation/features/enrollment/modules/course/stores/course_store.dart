import 'package:mobx/mobx.dart';
import 'package:asuka/snackbars/asuka_snack_bar.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:vr_challenge/app/layers/domain/entities/course_entity.dart';
import 'package:vr_challenge/app/layers/domain/use_cases/create_course_use_case.dart';
import 'package:vr_challenge/app/layers/domain/use_cases/delete_course_use_case.dart';
import 'package:vr_challenge/app/layers/domain/use_cases/get_all_courses_use_case.dart';
import 'package:vr_challenge/app/layers/domain/use_cases/get_courses_by_ids_use_case.dart';
import 'package:vr_challenge/app/layers/domain/use_cases/update_course_use_case.dart';
import 'package:vr_challenge/core/utils/string_extension.dart';
part 'course_store.g.dart';

class CourseStore = _CourseStoreBase with _$CourseStore;

abstract class _CourseStoreBase with Store {
  final CreateCourseUseCase _createCourseUseCase;
  final GetAllCoursesUseCase _getAllCoursesUseCase;
  final GetCoursesByIdsUseCase _getCoursesByIdsUseCase;
  final UpdateCourseUseCase _updateCourseUseCase;
  final DeleteCourseUseCase _deleteCourseUseCase;

  _CourseStoreBase(
    this._createCourseUseCase,
    this._getAllCoursesUseCase,
    this._getCoursesByIdsUseCase,
    this._updateCourseUseCase,
    this._deleteCourseUseCase,
  );

  @observable
  bool loading = false;

  @observable
  List<CourseEntity> coursesList = [];

  @observable
  List<CourseEntity> coursesEnrolled = [];

  @observable
  List<CourseEntity> coursesNotEnrolled = [];

  @observable
  int getCoursesNotEnrolled = 0;

  @observable
  String searchFilter = '';

  @observable
  List<int> selectedCourses = [];

  @computed
  List<CourseEntity> get filteredCourses {
    final filtered = coursesList.where(
      (course) {
        final courseName = course.name.toLowerCase().removeDiacritics();
        final searchFilterLowercase =
            searchFilter.toLowerCase().removeDiacritics();
        final searchWords = searchFilterLowercase
            .split(RegExp(r'\s+'))
            .where((s) => s.length >= 3);
        final nameWords =
            courseName.split(RegExp(r'\s+')).where((s) => s.length >= 3);
        return searchWords.every(
          (searchWord) {
            return courseName.contains(searchWord) ||
                nameWords.any((nameWord) => nameWord.contains(searchWord));
          },
        );
      },
    );
    return filtered.toList();
  }

  @action
  void searchCourses(String search) {
    searchFilter = search;
  }

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
  void resetCourses() {
    searchFilter = '';
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
      Modular.to.navigate('/home/');
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
      coursesList = await _getAllCoursesUseCase();
    } catch (_) {
      AsukaSnackbar.alert(
        "Ocorreu um erro, verifique o nome do curso",
      ).show();
    } finally {
      loading = false;
    }
  }

  @action
  Future<void> getCoursesByIds(List<int> courseCode) async {
    loading = true;

    try {
      if (getCoursesNotEnrolled == 0 && courseCode.isNotEmpty) {
        selectedCourses = [];
        coursesEnrolled = await _getCoursesByIdsUseCase(courseCode);
        selectedCourses = coursesEnrolled.map((course) => course.id!).toList();
      } else if (coursesEnrolled.isEmpty) {
        selectedCourses = [];
      }
      coursesNotEnrolled = await _getCoursesByIdsUseCase(courseCode);
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
      Modular.to.navigate('/home');
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

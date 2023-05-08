import 'package:flutter_modular/flutter_modular.dart';
import 'package:vr_challenge/app/layers/data/data_sources/local/course_datasource_impl.dart';
import 'package:vr_challenge/app/layers/data/repositories/course_repository_impl.dart';
import 'package:vr_challenge/app/layers/domain/use_cases/create_course_use_case.dart';
import 'package:vr_challenge/app/layers/domain/use_cases/delete_course_use_case.dart';
import 'package:vr_challenge/app/layers/domain/use_cases/get_all_courses_use_case.dart';
import 'package:vr_challenge/app/layers/domain/use_cases/update_course_use_case.dart';
import 'package:vr_challenge/app/layers/presentation/features/course/pages/course_page.dart';
import 'package:vr_challenge/app/layers/presentation/features/course/pages/create_course_page.dart';
import 'package:vr_challenge/app/layers/presentation/features/course/pages/update_course_page.dart';
import 'package:vr_challenge/app/layers/presentation/features/course/stores/course_store.dart';

class CourseModule extends Module {
  @override
  final List<Bind> binds = [
    Bind((i) => CreateCourseUseCase(courseRepository: i.get())),
    Bind((i) => GetAllCoursesUseCase(courseRepository: i.get())),
    Bind((i) => UpdateCourseUseCase(courseRepository: i.get())),
    Bind((i) => DeleteCourseUseCase(courseRepository: i.get())),
    Bind((i) => CourseRepositoryImpl(courseDataSource: i.get())),
    Bind((i) => CourseDataSourceImpl()),
    Bind((i) => CourseStore(i.get(), i.get(), i.get(), i.get())),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(
      '/',
      child: (context, agrs) => CreateCoursePage(),
    ),
    ChildRoute(
      '/course',
      child: (context, agrs) => CoursePage(courseEntity: agrs.data),
    ),
    ChildRoute(
      '/update',
      child: (context, agrs) => UpdateCoursePage(courseEntity: agrs.data),
    ),
  ];
}

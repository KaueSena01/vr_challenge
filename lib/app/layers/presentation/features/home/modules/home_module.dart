import 'package:flutter_modular/flutter_modular.dart';
import 'package:vr_challenge/app/layers/data/data_sources/local/course_datasource_impl.dart';
import 'package:vr_challenge/app/layers/data/repositories/course_repository_impl.dart';
import 'package:vr_challenge/app/layers/domain/use_cases/create_course_use_case.dart';
import 'package:vr_challenge/app/layers/domain/use_cases/delete_course_use_case.dart';
import 'package:vr_challenge/app/layers/domain/use_cases/get_all_courses_use_case.dart';
import 'package:vr_challenge/app/layers/domain/use_cases/update_course_use_case.dart';
import 'package:vr_challenge/app/layers/presentation/features/enrollment/pages/course/module/course_module.dart';
import 'package:vr_challenge/app/layers/presentation/features/enrollment/pages/course/stores/course_store.dart';
import 'package:vr_challenge/app/layers/presentation/features/home/pages/home_page.dart';
import 'package:vr_challenge/app/layers/presentation/features/home/stores/home_store.dart';

class HomeModule extends Module {
  @override
  final List<Bind> binds = [
    Bind((i) => HomeStore()),
    Bind((i) => CreateCourseUseCase(courseRepository: i.get())),
    Bind((i) => CourseRepositoryImpl(courseDataSource: i.get())),
    Bind((i) => CourseDataSourceImpl()),
    Bind.lazySingleton((i) => CourseStore(i.get(), i.get(), i.get(), i.get())),
    Bind.lazySingleton((i) => GetAllCoursesUseCase(courseRepository: i.get())),
    Bind.lazySingleton((i) => UpdateCourseUseCase(courseRepository: i.get())),
    Bind.lazySingleton((i) => DeleteCourseUseCase(courseRepository: i.get())),
    Bind.lazySingleton((i) => CourseRepositoryImpl(courseDataSource: i.get())),
    Bind.lazySingleton((i) => CourseDataSourceImpl()),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(
      '/',
      child: (context, agrs) => HomePage(adminEntity: agrs.data),
    ),
    ModuleRoute(
      '/course',
      module: CourseModule(),
    ),
  ];
}

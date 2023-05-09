import 'package:flutter_modular/flutter_modular.dart';
import 'package:vr_challenge/app/layers/presentation/features/enrollment/pages/course/pages/course_page.dart';
import 'package:vr_challenge/app/layers/presentation/features/enrollment/pages/course/pages/courses_page.dart';
import 'package:vr_challenge/app/layers/presentation/features/enrollment/pages/course/pages/create_course_page.dart';
import 'package:vr_challenge/app/layers/presentation/features/enrollment/pages/course/pages/update_course_page.dart';

class CourseModule extends Module {
  @override
  final List<Bind> binds = [];

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
    ChildRoute(
      '/courses',
      child: (context, agrs) => const CoursesPage(),
    ),
  ];
}

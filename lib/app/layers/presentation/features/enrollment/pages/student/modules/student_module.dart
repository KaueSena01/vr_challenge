import 'package:flutter_modular/flutter_modular.dart';
import 'package:vr_challenge/app/layers/presentation/features/enrollment/pages/student/pages/enrollment_page.dart';
import 'package:vr_challenge/app/layers/presentation/features/enrollment/pages/student/pages/students_page.dart';
import 'package:vr_challenge/app/layers/presentation/features/enrollment/pages/student/pages/update_student_page.dart';

import '../pages/create_new_student_page.dart';

class StudentModule extends Module {
  @override
  final List<Bind> binds = [];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(
      '/',
      child: (context, agrs) => const CreateNewStudent(),
    ),
    ChildRoute(
      '/students',
      child: (context, agrs) => const StudentsPage(),
    ),
    ChildRoute(
      '/update',
      child: (context, agrs) => UpdateStudentPage(studentEntity: agrs.data),
    ),
    ChildRoute(
      '/enrollment',
      child: (context, agrs) => EnrollmentPage(courseEntity: agrs.data),
    ),
  ];
}

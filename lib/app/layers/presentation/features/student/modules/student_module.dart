import 'package:flutter_modular/flutter_modular.dart';
import 'package:vr_challenge/app/layers/data/data_sources/local/course_datasource_impl.dart';
import 'package:vr_challenge/app/layers/data/data_sources/local/student_datasource_impl.dart';
import 'package:vr_challenge/app/layers/data/repositories/course_repository_impl.dart';
import 'package:vr_challenge/app/layers/data/repositories/student_repository_impl.dart';
import 'package:vr_challenge/app/layers/domain/use_cases/create_new_student_use_case.dart';
import 'package:vr_challenge/app/layers/domain/use_cases/delete_course_use_case.dart';
import 'package:vr_challenge/app/layers/domain/use_cases/delete_student_use_case.dart';
import 'package:vr_challenge/app/layers/domain/use_cases/get_all_courses_use_case.dart';
import 'package:vr_challenge/app/layers/domain/use_cases/get_all_students_use_case.dart';
import 'package:vr_challenge/app/layers/domain/use_cases/update_course_use_case.dart';
import 'package:vr_challenge/app/layers/domain/use_cases/update_student_use_case.dart';
import 'package:vr_challenge/app/layers/presentation/features/course/stores/course_store.dart';
import 'package:vr_challenge/app/layers/presentation/features/student/pages/create_new_student.dart';
import 'package:vr_challenge/app/layers/presentation/features/student/pages/students_page.dart';
import 'package:vr_challenge/app/layers/presentation/features/student/pages/update_student_page.dart';
import 'package:vr_challenge/app/layers/presentation/features/student/stores/student_store.dart';

class StudentModule extends Module {
  @override
  final List<Bind> binds = [
    Bind((i) => CreateNewStudentUseCase(studentRepository: i.get())),
    Bind((i) => GetAllStudentUseCase(studentRepository: i.get())),
    Bind((i) => UpdateStudentUseCase(studentRepository: i.get())),
    Bind((i) => DeleteStudentUseCase(studentRepository: i.get())),
    Bind((i) => StudentRepositoryImpl(studentDataSource: i.get())),
    Bind((i) => StudentDataSourceImpl()),
    Bind((i) => StudentStore(i.get(), i.get(), i.get(), i.get())),
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
  ];
}

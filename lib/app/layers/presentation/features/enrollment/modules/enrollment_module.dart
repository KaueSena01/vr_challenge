import 'package:flutter_modular/flutter_modular.dart';
import 'package:vr_challenge/app/layers/data/data_sources/local/course_datasource_impl.dart';
import 'package:vr_challenge/app/layers/data/data_sources/local/enrollment_datasource_impl.dart';
import 'package:vr_challenge/app/layers/data/data_sources/local/student_datasource_impl.dart';
import 'package:vr_challenge/app/layers/data/repositories/course_repository_impl.dart';
import 'package:vr_challenge/app/layers/data/repositories/enrollment_repository_impl.dart';
import 'package:vr_challenge/app/layers/data/repositories/student_repository_impl.dart';
import 'package:vr_challenge/app/layers/domain/use_cases/create_course_use_case.dart';
import 'package:vr_challenge/app/layers/domain/use_cases/create_new_student_use_case.dart';
import 'package:vr_challenge/app/layers/domain/use_cases/delete_course_use_case.dart';
import 'package:vr_challenge/app/layers/domain/use_cases/delete_student_use_case.dart';
import 'package:vr_challenge/app/layers/domain/use_cases/get_all_courses_use_case.dart';
import 'package:vr_challenge/app/layers/domain/use_cases/get_all_students_use_case.dart';
import 'package:vr_challenge/app/layers/domain/use_cases/get_enrolled_students_for_course_use_case.dart';
import 'package:vr_challenge/app/layers/domain/use_cases/get_quantity_of_students_use_case.dart';
import 'package:vr_challenge/app/layers/domain/use_cases/get_students_by_ids_use_case.dart';
import 'package:vr_challenge/app/layers/domain/use_cases/get_students_not_enrolled_for_course_use_case.dart';
import 'package:vr_challenge/app/layers/domain/use_cases/save_student_and_course_use_case.dart';
import 'package:vr_challenge/app/layers/domain/use_cases/update_course_use_case.dart';
import 'package:vr_challenge/app/layers/domain/use_cases/update_student_use_case.dart';
import 'package:vr_challenge/app/layers/presentation/features/enrollment/pages/course/module/course_module.dart';
import 'package:vr_challenge/app/layers/presentation/features/enrollment/pages/course/stores/course_store.dart';
import 'package:vr_challenge/app/layers/presentation/features/enrollment/pages/student/modules/student_module.dart';
import 'package:vr_challenge/app/layers/presentation/features/enrollment/pages/student/stores/student_store.dart';
import 'package:vr_challenge/app/layers/presentation/features/enrollment/stores/enrollment_store.dart';

class EnrollmentModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => CreateCourseUseCase(courseRepository: i.get())),
    Bind.lazySingleton(
        (i) => CreateNewStudentUseCase(studentRepository: i.get())),
    Bind.lazySingleton((i) => GetAllStudentUseCase(studentRepository: i.get())),
    Bind.lazySingleton(
        (i) => GetStudentsByIdsUseCase(studentRepository: i.get())),
    Bind.lazySingleton((i) => UpdateStudentUseCase(studentRepository: i.get())),
    Bind.lazySingleton((i) => DeleteStudentUseCase(studentRepository: i.get())),
    Bind.lazySingleton(
        (i) => StudentRepositoryImpl(studentDataSource: i.get())),
    Bind.lazySingleton((i) => StudentDataSourceImpl()),
    Bind.lazySingleton(
        (i) => StudentStore(i.get(), i.get(), i.get(), i.get(), i.get())),
    Bind.lazySingleton((i) => CourseStore(i.get(), i.get(), i.get(), i.get())),
    Bind.lazySingleton((i) => GetAllCoursesUseCase(courseRepository: i.get())),
    Bind.lazySingleton((i) => UpdateCourseUseCase(courseRepository: i.get())),
    Bind.lazySingleton((i) => DeleteCourseUseCase(courseRepository: i.get())),
    Bind.lazySingleton((i) => CourseRepositoryImpl(courseDataSource: i.get())),
    Bind.lazySingleton((i) => CourseDataSourceImpl()),

    //
    Bind.lazySingleton((i) => EnrollmentDataSourceImpl()),
    Bind.lazySingleton(
        (i) => EnrollmentRepositoryImpl(enrollmentDataSource: i.get())),
    Bind.lazySingleton(
        (i) => SaveStudentAndCourseUseCase(enrollmentRepository: i.get())),
    Bind.lazySingleton((i) =>
        GetStudentsNotEnrolledForCourseUseCase(enrollmentRepository: i.get())),
    Bind.lazySingleton(
        (i) => GetEnrolledCoursesCountUseCase(enrollmentRepository: i.get())),
    Bind.lazySingleton((i) =>
        GetEnrolledStudentsForCourseUseCase(enrollmentRepository: i.get())),
    Bind.lazySingleton(
        (i) => EnrollmentStore(i.get(), i.get(), i.get(), i.get())),
  ];

  @override
  final List<ModularRoute> routes = [
    ModuleRoute(
      '/course',
      module: CourseModule(),
    ),
    ModuleRoute(
      '/student',
      module: StudentModule(),
    ),
  ];
}

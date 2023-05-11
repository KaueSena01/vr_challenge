import 'package:flutter_modular/flutter_modular.dart';
import 'package:vr_challenge/app/layers/data/data_sources/local/course_datasource_impl.dart';
import 'package:vr_challenge/app/layers/data/data_sources/local/enrollment_datasource_impl.dart';
import 'package:vr_challenge/app/layers/data/data_sources/local/student_datasource_impl.dart';
import 'package:vr_challenge/app/layers/data/repositories/course_repository_impl.dart';
import 'package:vr_challenge/app/layers/data/repositories/enrollment_repository_impl.dart';
import 'package:vr_challenge/app/layers/data/repositories/student_repository_impl.dart';
import 'package:vr_challenge/app/layers/domain/use_cases/create_new_student_use_case.dart';
import 'package:vr_challenge/app/layers/domain/use_cases/delete_course_use_case.dart';
import 'package:vr_challenge/app/layers/domain/use_cases/delete_student_use_case.dart';
import 'package:vr_challenge/app/layers/domain/use_cases/get_all_courses_use_case.dart';
import 'package:vr_challenge/app/layers/domain/use_cases/get_all_students_use_case.dart';
import 'package:vr_challenge/app/layers/domain/use_cases/get_courses_by_ids_use_case.dart';
import 'package:vr_challenge/app/layers/domain/use_cases/get_courses_enrolled_by_student_use_case.dart';
import 'package:vr_challenge/app/layers/domain/use_cases/get_courses_not_enrolled_by_student_use_case.dart';
import 'package:vr_challenge/app/layers/domain/use_cases/get_enrolled_students_for_course_use_case.dart';
import 'package:vr_challenge/app/layers/domain/use_cases/get_quantity_of_students_use_case.dart';
import 'package:vr_challenge/app/layers/domain/use_cases/get_students_by_ids_use_case.dart';
import 'package:vr_challenge/app/layers/domain/use_cases/get_students_not_enrolled_for_course_use_case.dart';
import 'package:vr_challenge/app/layers/domain/use_cases/remove_course_from_enrollment_use_case.dart';
import 'package:vr_challenge/app/layers/domain/use_cases/remove_enrollment_use_case.dart';
import 'package:vr_challenge/app/layers/domain/use_cases/save_student_and_course_use_case.dart';
import 'package:vr_challenge/app/layers/domain/use_cases/update_course_students_use_case.dart';
import 'package:vr_challenge/app/layers/domain/use_cases/update_course_use_case.dart';
import 'package:vr_challenge/app/layers/domain/use_cases/update_enrolled_courses_use_case.dart';
import 'package:vr_challenge/app/layers/domain/use_cases/update_student_use_case.dart';
import 'package:vr_challenge/app/layers/presentation/features/enrollment/modules/course/module/course_module.dart';
import 'package:vr_challenge/app/layers/presentation/features/enrollment/modules/course/stores/course_store.dart';
import 'package:vr_challenge/app/layers/presentation/features/enrollment/modules/student/modules/student_module.dart';
import 'package:vr_challenge/app/layers/presentation/features/enrollment/modules/student/stores/student_store.dart';
import 'package:vr_challenge/app/layers/presentation/features/enrollment/stores/enrollment_store.dart';
import 'package:vr_challenge/core/configs/db/db.dart';

class EnrollmentModule extends Module {
  @override
  final List<Bind> binds = _getBinds();

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

  static List<Bind> _getBinds() {
    return [
      Bind.singleton((i) => DatabaseProvider.instance),
      ..._getCourseBinds(),
      ..._getStudentBinds(),
      ..._getEnrollmentBinds(),
    ];
  }

  static List<Bind> _getCourseBinds() {
    return [
      Bind.lazySingleton(
          (i) => CourseDataSourceImpl(i.get<DatabaseProvider>())),
      Bind.lazySingleton(
          (i) => CourseRepositoryImpl(courseDataSource: i.get())),
      Bind.lazySingleton(
          (i) => GetAllCoursesUseCase(courseRepository: i.get())),
      Bind.lazySingleton(
          (i) => GetCoursesByIdsUseCase(courseRepository: i.get())),
      Bind.lazySingleton((i) => UpdateCourseUseCase(courseRepository: i.get())),
      Bind.lazySingleton((i) => DeleteCourseUseCase(courseRepository: i.get())),
      Bind.lazySingleton(
          (i) => CourseStore(i.get(), i.get(), i.get(), i.get(), i.get())),
    ];
  }

  static List<Bind> _getStudentBinds() {
    return [
      Bind.lazySingleton(
          (i) => StudentDataSourceImpl(i.get<DatabaseProvider>())),
      Bind.lazySingleton(
          (i) => StudentRepositoryImpl(studentDataSource: i.get())),
      Bind.lazySingleton(
          (i) => CreateNewStudentUseCase(studentRepository: i.get())),
      Bind.lazySingleton(
          (i) => GetAllStudentUseCase(studentRepository: i.get())),
      Bind.lazySingleton(
          (i) => GetStudentsByIdsUseCase(studentRepository: i.get())),
      Bind.lazySingleton(
          (i) => UpdateStudentUseCase(studentRepository: i.get())),
      Bind.lazySingleton(
          (i) => DeleteStudentUseCase(studentRepository: i.get())),
      Bind.lazySingleton(
          (i) => StudentStore(i.get(), i.get(), i.get(), i.get(), i.get())),
    ];
  }

  static List<Bind> _getEnrollmentBinds() {
    return [
      Bind.lazySingleton(
          (i) => EnrollmentDataSourceImpl(i.get<DatabaseProvider>())),
      Bind.lazySingleton(
          (i) => EnrollmentRepositoryImpl(enrollmentDataSource: i.get())),
      Bind.lazySingleton(
          (i) => SaveStudentAndCourseUseCase(enrollmentRepository: i.get())),
      Bind.lazySingleton((i) =>
          GetCoursesEnrolledByStudentsUseCase(enrollmentRepository: i.get())),
      Bind.lazySingleton((i) => GetCoursesNotEnrolledByStudentsUseCase(
          enrollmentRepository: i.get())),
      Bind.lazySingleton((i) => GetStudentsNotEnrolledForCourseUseCase(
          enrollmentRepository: i.get())),
      Bind.lazySingleton(
          (i) => UpdateEnrolledCoursesUseCase(enrollmentRepository: i.get())),
      Bind.lazySingleton(
          (i) => RemoveEnrollmentUseCase(enrollmentRepository: i.get())),
      Bind.lazySingleton(
          (i) => UpdateCourseStudentsUseCase(enrollmentRepository: i.get())),
      Bind.lazySingleton(
          (i) => GetEnrolledCoursesCountUseCase(enrollmentRepository: i.get())),
      Bind.lazySingleton((i) =>
          RemoveCourseFromEnrollmentUseCase(enrollmentRepository: i.get())),
      Bind.lazySingleton((i) =>
          GetEnrolledStudentsForCourseUseCase(enrollmentRepository: i.get())),
      Bind.lazySingleton((i) => EnrollmentStore(i.get(), i.get(), i.get(),
          i.get(), i.get(), i.get(), i.get(), i.get(), i.get(), i.get())),
    ];
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:vr_challenge/app/layers/domain/entities/course_entity.dart';
import 'package:vr_challenge/app/layers/presentation/features/enrollment/modules/student/pages/widgets/student_list.dart';
import 'package:vr_challenge/app/layers/presentation/features/enrollment/modules/student/stores/student_store.dart';
import 'package:vr_challenge/app/layers/presentation/features/enrollment/stores/enrollment_store.dart';
import 'package:vr_challenge/app/layers/presentation/widgets/custom_app_bar.dart';
import 'package:vr_challenge/app/layers/presentation/widgets/custom_elevated_button.dart';
import 'package:vr_challenge/app/layers/presentation/widgets/custom_space.dart';
import 'package:vr_challenge/app/layers/presentation/widgets/custom_subtitle.dart';
import 'package:vr_challenge/app/layers/presentation/widgets/custom_text_field.dart';
import 'package:vr_challenge/app/layers/presentation/widgets/custom_title.dart';
import 'package:vr_challenge/core/constants/theme/app_colors.dart';
import 'package:vr_challenge/core/constants/theme/app_sizes.dart';
import 'package:vr_challenge/core/constants/theme/app_text_styles.dart';

class EnrollmentPage extends StatefulWidget {
  const EnrollmentPage({
    super.key,
    required this.courseEntity,
  });

  final CourseEntity courseEntity;

  @override
  State<EnrollmentPage> createState() => _EnrollmentPageState();
}

class _EnrollmentPageState extends State<EnrollmentPage> {
  final _formKey = GlobalKey<FormState>();
  final _searchController = TextEditingController();

  final StudentStore _studentStore = Modular.get<StudentStore>();
  final EnrollmentStore _enrollmentStore = Modular.get<EnrollmentStore>();
  // final CourseStore _courseStore = Modular.get<CourseStore>();

  @override
  void initState() {
    super.initState();
    _getStudentsNotEnrolled().then(
      (value) => _studentStore.getAllStudentsByIds(),
    );
    _searchController.addListener(_onSearchChanged);
  }

  Future<void> _getStudentsNotEnrolled() async {
    await _enrollmentStore
        .getStudentsNotEnrolledForCourse(widget.courseEntity.id!);
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  void _onSearchChanged() {
    _studentStore.searchStudents(_searchController.text);
  }

  void handleStudentSelection(int studentId) {
    _studentStore.handleStudentSelection(studentId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const CustomAppBar(),
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: AppSizes.size15),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        title("Alunos"),
                        subtitle(
                          "Matricule alunos no curso de ${widget.courseEntity.name}",
                        ),
                        CustomTextField(
                          margin: EdgeInsets.only(
                            top: AppSizes.size35,
                            bottom: AppSizes.size45,
                          ),
                          hintText: "Pesquisar por...",
                          inputTextColor: AppColors.courseLabelColor,
                          prefixIcon: Icon(Icons.search, size: AppSizes.size25),
                          fillColor: AppColors.cardColor,
                          controller: _searchController,
                        ),
                        Observer(
                          builder: (context) {
                            if (_studentStore.loading) {
                              return const Center(
                                child: CircularProgressIndicator(),
                              );
                            } else {
                              return Column(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                  Text(
                                    "Quantidade",
                                    style: AppTextStyles.textTheme.labelSmall!
                                        .apply(
                                      color: AppColors.tertiaryColor,
                                    ),
                                  ),
                                  CustomSpace(height: AppSizes.size05),
                                  Text(
                                    "${_enrollmentStore.enrollmentCount}/10",
                                    style: AppTextStyles.textTheme.labelSmall!
                                        .apply(
                                      color: AppColors.subtitileColor,
                                    ),
                                  ),
                                  CustomSpace(height: AppSizes.size35),
                                  StudentsList(
                                    studentEntity: _studentStore
                                        .filteredStudentsNoEnrollment,
                                    onStudentSelected: (studentId) =>
                                        handleStudentSelection(studentId),
                                    selectedStudents:
                                        _studentStore.selectedStudents,
                                  ),
                                ],
                              );
                            }
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            CustomElevatedButton(
              margin: EdgeInsets.symmetric(
                horizontal: AppSizes.size15,
                vertical: AppSizes.size20,
              ),
              label: "Salvar",
              onPressed: () async {
                FocusScope.of(context).unfocus();

                _enrollmentStore.updateCourseStudents(
                  _studentStore.selectedStudents,
                  widget.courseEntity.id!,
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

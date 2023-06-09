import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:vr_challenge/app/layers/domain/entities/student_entity.dart';
import 'package:vr_challenge/app/layers/presentation/features/enrollment/modules/course/pages/widgets/courses_list.dart';
import 'package:vr_challenge/app/layers/presentation/features/enrollment/modules/course/stores/course_store.dart';
import 'package:vr_challenge/app/layers/presentation/features/enrollment/modules/student/stores/student_store.dart';
import 'package:vr_challenge/app/layers/presentation/features/enrollment/stores/enrollment_store.dart';
import 'package:vr_challenge/app/layers/presentation/widgets/custom_alert.dart';
import 'package:vr_challenge/app/layers/presentation/widgets/custom_app_bar.dart';
import 'package:vr_challenge/app/layers/presentation/widgets/custom_elevated_button.dart';
import 'package:vr_challenge/app/layers/presentation/widgets/custom_space.dart';
import 'package:vr_challenge/app/layers/presentation/widgets/custom_subtitle.dart';
import 'package:vr_challenge/app/layers/presentation/widgets/custom_text_field.dart';
import 'package:vr_challenge/app/layers/presentation/widgets/custom_title.dart';
import 'package:vr_challenge/core/theme/app_colors.dart';
import 'package:vr_challenge/core/theme/app_sizes.dart';
import 'package:vr_challenge/core/theme/app_text_styles.dart';
import 'package:vr_challenge/core/validators/input_validator.dart';

class UpdateStudentPage extends StatefulWidget {
  const UpdateStudentPage({
    super.key,
    required this.studentEntity,
  });

  final StudentEntity studentEntity;

  @override
  State<UpdateStudentPage> createState() => _UpdateStudentPageState();
}

class _UpdateStudentPageState extends State<UpdateStudentPage> {
  final _formKey = GlobalKey<FormState>();

  final CourseStore _courseStore = Modular.get<CourseStore>();
  final StudentStore _studentStore = Modular.get<StudentStore>();
  final EnrollmentStore _enrollmentStore = Modular.get<EnrollmentStore>();

  List<int> selectedCourses = [];

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _courseStore.getAllCourses();
    _enrollmentStore.getCoursesEnrolledByStudent(widget.studentEntity.id!);
    _enrollmentStore.getCoursesNotEnrolledByStudent(widget.studentEntity.id!);
    _nameController.text = widget.studentEntity.name;
    _emailController.text = widget.studentEntity.email;
  }

  void handleCourseSelection(int courseId) {
    _courseStore.handleCourseSelection(courseId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomAppBar(
              label: "Excluir aluno",
              labelColor: AppColors.dangerColor,
              onTap: () => customAlert(
                context: context,
                code: widget.studentEntity.id!,
                isCourse: false,
                title: "Deletar aluno",
                body:
                    "Deseja realmente cancelar a matricula de ${widget.studentEntity.name}?",
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: AppSizes.size15),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        title("Editar"),
                        subtitle(
                          "Lembre-se de avisar ao aluno seu novo usuário de acesso.",
                        ),
                        CustomTextField(
                          margin: EdgeInsets.only(
                            top: AppSizes.size60,
                            bottom: AppSizes.size15,
                          ),
                          isInputForm: true,
                          inputTextColor: AppColors.courseLabelColor,
                          labelText: "Nome do aluno(a)",
                          labelTextColor: AppColors.courseLabelColor,
                          hintText: "Digite o nome do aluno",
                          hintTextColor: AppColors.courseLabelColor,
                          textInputType: TextInputType.name,
                          controller: _nameController,
                          validator: nameValidator,
                        ),
                        CustomTextField(
                          margin: EdgeInsets.only(
                            top: AppSizes.size15,
                            bottom: AppSizes.size45,
                          ),
                          isInputForm: true,
                          maxLines: 2,
                          inputTextColor: AppColors.courseLabelColor,
                          labelText: "E-mail",
                          labelTextColor: AppColors.courseLabelColor,
                          hintText: "Digite o e-mail do aluno",
                          hintTextColor: AppColors.courseLabelColor,
                          textInputType: TextInputType.emailAddress,
                          controller: _emailController,
                          validator: emailValidator,
                        ),
                        Observer(
                          builder: (context) {
                            if (_courseStore.loading) {
                              return const Center(
                                child: CircularProgressIndicator(),
                              );
                            } else {
                              return Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Meus cursos",
                                    style: AppTextStyles.textTheme.labelMedium!
                                        .apply(
                                      color: AppColors.primaryColor,
                                    ),
                                  ),
                                  CustomSpace(height: AppSizes.size15),
                                  CoursesList(
                                    courseEntity: _courseStore.coursesEnrolled,
                                    onCourseSelected: (courseId) =>
                                        handleCourseSelection(courseId),
                                    selectedCourses:
                                        _courseStore.selectedCourses,
                                  ),
                                  CustomSpace(height: AppSizes.size25),
                                  Text(
                                    "Cursos disponíveis",
                                    style: AppTextStyles.textTheme.labelMedium!
                                        .apply(
                                      color: AppColors.primaryColor,
                                    ),
                                  ),
                                  CustomSpace(height: AppSizes.size15),
                                  CoursesList(
                                    courseEntity:
                                        _courseStore.coursesNotEnrolled,
                                    onCourseSelected: (courseId) =>
                                        handleCourseSelection(courseId),
                                    selectedCourses:
                                        _courseStore.selectedCourses,
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

                if (_formKey.currentState!.validate()) {
                  await _studentStore.updateStudent(
                    widget.studentEntity.id!,
                    _nameController.text,
                    _emailController.text,
                    widget.studentEntity.password,
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}

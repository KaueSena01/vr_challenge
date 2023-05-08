import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:vr_challenge/app/layers/presentation/features/course/pages/widgets/courses_list.dart';
import 'package:vr_challenge/app/layers/presentation/features/course/stores/course_store.dart';
import 'package:vr_challenge/app/layers/presentation/features/student/stores/student_store.dart';
import 'package:vr_challenge/app/layers/presentation/widgets/custom_app_bar.dart';
import 'package:vr_challenge/app/layers/presentation/widgets/custom_elevated_button.dart';
import 'package:vr_challenge/app/layers/presentation/widgets/custom_space.dart';
import 'package:vr_challenge/app/layers/presentation/widgets/custom_subtitle.dart';
import 'package:vr_challenge/app/layers/presentation/widgets/custom_text_field.dart';
import 'package:vr_challenge/app/layers/presentation/widgets/custom_title.dart';
import 'package:vr_challenge/core/constants/theme/app_colors.dart';
import 'package:vr_challenge/core/constants/theme/app_sizes.dart';
import 'package:vr_challenge/core/constants/theme/app_text_styles.dart';
import 'package:vr_challenge/core/validators/input_validator.dart';

class CreateNewStudent extends StatefulWidget {
  const CreateNewStudent({super.key});

  @override
  State<CreateNewStudent> createState() => _CreateNewStudentState();
}

class _CreateNewStudentState extends State<CreateNewStudent> {
  final _formKey = GlobalKey<FormState>();

  final CourseStore _courseStore = Modular.get<CourseStore>();
  final StudentStore _studentStore = Modular.get<StudentStore>();
  List<int> selectedCourses = [];

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _courseStore.getAllCourses();
  }

  void handleCourseSelection(int courseId) {
    _courseStore.handleCourseSelection(courseId);
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
                        title("Novo aluno"),
                        subtitle(
                          "Antes de adicionar um aluno na plataforma, verifique se o aluno já foi adicionado anteriormente.",
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
                            bottom: AppSizes.size15,
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
                        CustomTextField(
                          margin: EdgeInsets.only(
                            top: AppSizes.size15,
                            bottom: AppSizes.size40,
                          ),
                          isInputForm: true,
                          maxLines: 10,
                          inputTextColor: AppColors.courseLabelColor,
                          labelText: "Senha",
                          labelTextColor: AppColors.courseLabelColor,
                          hintText: "Digite a senha de acesso do aluno",
                          hintTextColor: AppColors.courseLabelColor,
                          textInputType: TextInputType.visiblePassword,
                          controller: _passwordController,
                          validator: passwordValidator,
                        ),
                        Text(
                          "Cursos",
                          style: AppTextStyles.textTheme.labelMedium!.apply(
                            color: AppColors.tertiaryColor,
                          ),
                        ),
                        CustomSpace(height: AppSizes.size15),
                        Observer(
                          builder: (context) {
                            if (_courseStore.loading) {
                              return const Center(
                                child: CircularProgressIndicator(),
                              );
                            } else {
                              return CoursesList(
                                courseEntity: _courseStore.coursesList,
                                onCourseSelected: (courseId) =>
                                    handleCourseSelection(courseId),
                                selectedCourses: _courseStore.selectedCourses,
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
                  await _studentStore.createNewStudent(
                    _nameController.text,
                    _emailController.text,
                    _passwordController.text,
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

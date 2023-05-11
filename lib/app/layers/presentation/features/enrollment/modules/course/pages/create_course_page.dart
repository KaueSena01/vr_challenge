import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:vr_challenge/app/layers/presentation/features/enrollment/modules/course/stores/course_store.dart';
import 'package:vr_challenge/app/layers/presentation/widgets/custom_app_bar.dart';
import 'package:vr_challenge/app/layers/presentation/widgets/custom_elevated_button.dart';
import 'package:vr_challenge/app/layers/presentation/widgets/custom_subtitle.dart';
import 'package:vr_challenge/app/layers/presentation/widgets/custom_text_field.dart';
import 'package:vr_challenge/app/layers/presentation/widgets/custom_title.dart';
import 'package:vr_challenge/core/theme/app_colors.dart';
import 'package:vr_challenge/core/theme/app_sizes.dart';
import 'package:vr_challenge/core/validators/input_validator.dart';

class CreateCoursePage extends StatelessWidget {
  CreateCoursePage({super.key});

  final _formKey = GlobalKey<FormState>();

  final CourseStore courseStore = Modular.get<CourseStore>();

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _syllabusController = TextEditingController();

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
                        title("Novo curso"),
                        subtitle(
                          "Antes de adicionar um curso na plataforma, verifique se o curso já foi adicionado anteriormente. ",
                        ),
                        CustomTextField(
                          margin: EdgeInsets.only(
                            top: AppSizes.size60,
                            bottom: AppSizes.size15,
                          ),
                          isInputForm: true,
                          inputTextColor: AppColors.courseLabelColor,
                          labelText: "Nome do curso",
                          labelTextColor: AppColors.courseLabelColor,
                          hintText: "Digite o nome do curso",
                          hintTextColor: AppColors.courseLabelColor,
                          controller: _nameController,
                          validator: courseNameValidator,
                        ),
                        CustomTextField(
                          margin: EdgeInsets.only(
                            top: AppSizes.size15,
                            bottom: AppSizes.size15,
                          ),
                          isInputForm: true,
                          maxLines: 2,
                          inputTextColor: AppColors.courseLabelColor,
                          labelText: "Descrição",
                          labelTextColor: AppColors.courseLabelColor,
                          hintText: "Digite a descrição do curso",
                          hintTextColor: AppColors.courseLabelColor,
                          controller: _descriptionController,
                          validator: courseDescriptionValidator,
                        ),
                        CustomTextField(
                          margin: EdgeInsets.only(
                            top: AppSizes.size15,
                            bottom: AppSizes.size15,
                          ),
                          isInputForm: true,
                          maxLines: 10,
                          inputTextColor: AppColors.courseLabelColor,
                          labelText: "Ementa",
                          labelTextColor: AppColors.courseLabelColor,
                          hintText: "Digite a ementa do curso",
                          hintTextColor: AppColors.courseLabelColor,
                          controller: _syllabusController,
                          validator: courseSyllabusValidator,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Observer(
              builder: (_) => courseStore.loading
                  ? const Center(
                      child: CircularProgressIndicator(),
                    )
                  : CustomElevatedButton(
                      margin: EdgeInsets.symmetric(
                        horizontal: AppSizes.size15,
                        vertical: AppSizes.size20,
                      ),
                      label: "Criar curso",
                      onPressed: () async {
                        FocusScope.of(context).unfocus();

                        if (_formKey.currentState!.validate()) {
                          await courseStore.createCourse(
                            _nameController.text,
                            _descriptionController.text,
                            _syllabusController.text,
                          );
                        }
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }
}

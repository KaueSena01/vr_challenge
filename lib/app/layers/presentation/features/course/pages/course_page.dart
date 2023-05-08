import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:vr_challenge/app/layers/domain/entities/course_entity.dart';
import 'package:vr_challenge/app/layers/presentation/features/course/pages/widgets/course_alert.dart';
import 'package:vr_challenge/app/layers/presentation/features/course/stores/course_store.dart';
import 'package:vr_challenge/app/layers/presentation/widgets/custom_app_bar.dart';
import 'package:vr_challenge/app/layers/presentation/widgets/custom_elevated_button.dart';
import 'package:vr_challenge/app/layers/presentation/widgets/custom_outlined_button.dart';
import 'package:vr_challenge/app/layers/presentation/widgets/custom_space.dart';
import 'package:vr_challenge/app/layers/presentation/widgets/custom_title.dart';
import 'package:vr_challenge/core/constants/theme/app_colors.dart';
import 'package:vr_challenge/core/constants/theme/app_sizes.dart';
import 'package:vr_challenge/core/constants/theme/app_text_styles.dart';

class CoursePage extends StatelessWidget {
  CoursePage({
    super.key,
    required this.courseEntity,
  });

  final CourseEntity courseEntity;
  final CourseStore courseStore = Modular.get<CourseStore>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomAppBar(
              label: "Editar curso",
              onTap: () =>
                  Modular.to.pushNamed('update', arguments: courseEntity),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: AppSizes.size15),
                  child: Form(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        title(courseEntity.name),
                        CustomSpace(height: AppSizes.size60),
                        Text(
                          "Descrição",
                          style: AppTextStyles.textTheme.labelSmall!.apply(
                            color: AppColors.tertiaryColor,
                          ),
                        ),
                        CustomSpace(height: AppSizes.size05),
                        Text(
                          courseEntity.description,
                          style: AppTextStyles.textTheme.labelSmall!.apply(
                            color: AppColors.subtitileColor,
                          ),
                        ),
                        CustomSpace(height: AppSizes.size35),
                        Text(
                          "Ementa",
                          style: AppTextStyles.textTheme.labelSmall!.apply(
                            color: AppColors.tertiaryColor,
                          ),
                        ),
                        CustomSpace(height: AppSizes.size05),
                        Text(
                          courseEntity.syllabus,
                          style: AppTextStyles.textTheme.labelSmall!.apply(
                            color: AppColors.subtitileColor,
                          ),
                        ),
                        // Quantidade
                      ],
                    ),
                  ),
                ),
              ),
            ),
            CustomElevatedButton(
              margin: EdgeInsets.fromLTRB(
                AppSizes.size15,
                AppSizes.size15,
                AppSizes.size15,
                AppSizes.size05,
              ),
              label: "Matricular alunos",
              onPressed: () {},
            ),
            CustomOutlinedButton(
              margin: EdgeInsets.all(AppSizes.size15),
              label: "Remover curso",
              labelColor: AppColors.dangerColor,
              borderColor: AppColors.dangerColor,
              onPressed: () => courseAlert(
                context,
                courseEntity.name,
                courseStore.deleteCourse(
                  courseEntity.id!,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

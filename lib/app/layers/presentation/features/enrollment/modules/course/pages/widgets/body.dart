import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:vr_challenge/app/layers/domain/entities/course_entity.dart';
import 'package:vr_challenge/app/layers/presentation/features/enrollment/stores/enrollment_store.dart';
import 'package:vr_challenge/app/layers/presentation/widgets/custom_space.dart';
import 'package:vr_challenge/core/constants/theme/app_colors.dart';
import 'package:vr_challenge/core/constants/theme/app_sizes.dart';
import 'package:vr_challenge/core/constants/theme/app_text_styles.dart';

class Body extends StatelessWidget {
  const Body({
    super.key,
    required this.courseEntity,
    required this.enrollmentStore,
  });

  final CourseEntity courseEntity;
  final EnrollmentStore enrollmentStore;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
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
        CustomSpace(height: AppSizes.size35),
        Observer(
          builder: (context) {
            if (enrollmentStore.loading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Estado",
                    style: AppTextStyles.textTheme.labelSmall!.apply(
                      color: AppColors.tertiaryColor,
                    ),
                  ),
                  CustomSpace(height: AppSizes.size05),
                  Text(
                    enrollmentStore.count == 10
                        ? "Turma fechada"
                        : "Turma aberta",
                    style: AppTextStyles.textTheme.labelSmall!.apply(
                      color: enrollmentStore.count == 10
                          ? AppColors.dangerColor
                          : AppColors.subtitileColor,
                    ),
                  ),
                  CustomSpace(height: AppSizes.size35),
                  Text(
                    "Quantidade",
                    style: AppTextStyles.textTheme.labelSmall!.apply(
                      color: AppColors.tertiaryColor,
                    ),
                  ),
                  CustomSpace(height: AppSizes.size05),
                  Text(
                    "${enrollmentStore.count}/10",
                    style: AppTextStyles.textTheme.labelSmall!.apply(
                      color: AppColors.subtitileColor,
                    ),
                  ),
                ],
              );
            }
          },
        ),
      ],
    );
  }
}

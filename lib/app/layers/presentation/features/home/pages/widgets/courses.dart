import 'package:flutter/material.dart';
import 'package:vr_challenge/app/layers/presentation/widgets/custom_space.dart';
import 'package:vr_challenge/core/constants/theme/app_colors.dart';
import 'package:vr_challenge/core/constants/theme/app_sizes.dart';
import 'package:vr_challenge/core/constants/theme/app_text_styles.dart';

class Courses extends StatelessWidget {
  const Courses({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: AppSizes.size25,
        horizontal: AppSizes.size15,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Cursos",
                style: AppTextStyles.textTheme.labelMedium!.apply(
                  color: AppColors.darkColor,
                ),
              ),
              Text(
                "Novo curso",
                style: AppTextStyles.textTheme.labelMedium!.apply(
                  color: AppColors.tertiaryColor,
                ),
              ),
            ],
          ),
          CustomSpace(height: AppSizes.size15),
          Container(
            padding: EdgeInsets.all(AppSizes.size15),
            width: MediaQuery.of(context).size.width - AppSizes.size30,
            decoration: BoxDecoration(
              color: AppColors.cardColor,
              borderRadius: BorderRadius.circular(
                BorderRadiusSize.borderRadiusMedium,
              ),
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Engenharia de software",
                      style: AppTextStyles.textTheme.labelSmall!.apply(
                        color: AppColors.courseLabelColor,
                      ),
                    ),
                    Text(
                      "Abrir",
                      style: AppTextStyles.textTheme.labelMedium!.apply(
                        color: AppColors.tertiaryColor,
                      ),
                    ),
                  ],
                ),
                Divider(
                  height: AppSizes.size30,
                  thickness: 1,
                  color: AppColors.courseLabelColor,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

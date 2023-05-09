import 'package:flutter/material.dart';
import 'package:vr_challenge/app/layers/presentation/widgets/custom_elevated_button.dart';
import 'package:vr_challenge/app/layers/presentation/widgets/custom_outlined_button.dart';
import 'package:vr_challenge/core/constants/theme/app_colors.dart';
import 'package:vr_challenge/core/constants/theme/app_sizes.dart';
import 'package:vr_challenge/core/constants/theme/app_text_styles.dart';

void courseAlert(
  BuildContext context,
  String courseName,
  void onPressed,
) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text(
          "Deletar curso",
          style: AppTextStyles.textTheme.bodyMedium!.apply(
            color: AppColors.courseLabelColor,
          ),
        ),
        content: Text(
          "Deseja realmente deletar o curso de $courseName?",
          style: AppTextStyles.textTheme.labelSmall!.apply(
            color: AppColors.courseLabelColor,
          ),
        ),
        actions: [
          CustomElevatedButton(
            margin: EdgeInsets.fromLTRB(
              AppSizes.size10,
              AppSizes.size10,
              AppSizes.size10,
              AppSizes.size15,
            ),
            backgroundColor: AppColors.dangerColor,
            label: "Deletar",
            onPressed: () {
              onPressed;
              Navigator.pop(context);
            },
          ),
          CustomOutlinedButton(
            margin: EdgeInsets.fromLTRB(
              AppSizes.size10,
              AppSizes.size00,
              AppSizes.size10,
              AppSizes.size15,
            ),
            label: "Cancelar",
            onPressed: () => Navigator.pop(context),
          ),
        ],
      );
    },
  );
}

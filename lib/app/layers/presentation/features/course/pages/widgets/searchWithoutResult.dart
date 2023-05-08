import 'package:flutter/material.dart';
import 'package:vr_challenge/core/constants/theme/app_colors.dart';
import 'package:vr_challenge/core/constants/theme/app_text_styles.dart';

class SearchWithoutResult extends StatelessWidget {
  const SearchWithoutResult({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        "Nenhum curso foi encontrado",
        style: AppTextStyles.textTheme.labelMedium!.apply(
          color: AppColors.courseLabelColor,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:vr_challenge/core/theme/app_colors.dart';
import 'package:vr_challenge/core/theme/app_sizes.dart';
import 'package:vr_challenge/core/theme/app_text_styles.dart';

class SearchWithoutResult extends StatelessWidget {
  const SearchWithoutResult({
    super.key,
    this.message,
  });

  final String? message;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: EdgeInsets.only(top: AppSizes.size15),
        child: Text(
          message ?? "Nenhum curso foi encontrado",
          style: AppTextStyles.textTheme.labelMedium!.apply(
            color: AppColors.courseLabelColor,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}

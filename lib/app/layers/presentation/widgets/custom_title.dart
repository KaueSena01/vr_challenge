import 'package:flutter/material.dart';
import 'package:vr_challenge/core/theme/app_colors.dart';
import 'package:vr_challenge/core/theme/app_text_styles.dart';

Widget title(String title) {
  return Text(
    title,
    style: AppTextStyles.textTheme.displayMedium!.apply(
      color: AppColors.courseLabelColor,
    ),
  );
}

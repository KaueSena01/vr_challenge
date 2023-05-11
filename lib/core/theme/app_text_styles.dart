import 'package:flutter/material.dart';
import 'package:vr_challenge/core/theme/app_sizes.dart';

abstract class AppTextStyles {
  static TextTheme textTheme = TextTheme(
    // display
    displayLarge: TextStyle(
      fontSize: FontSize.fontSize32,
      fontWeight: FontWeight.w700,
    ),
    displayMedium: TextStyle(
      fontSize: FontSize.fontSize32,
      fontWeight: FontWeight.w500,
    ),
    displaySmall: TextStyle(
      fontSize: FontSize.fontSize32,
      fontWeight: FontWeight.w400,
    ),
    // title
    titleLarge: TextStyle(
      fontSize: FontSize.fontSize24,
      fontWeight: FontWeight.w700,
    ),
    titleMedium: TextStyle(
      fontSize: FontSize.fontSize24,
      fontWeight: FontWeight.w500,
    ),
    titleSmall: TextStyle(
      fontSize: FontSize.fontSize24,
      fontWeight: FontWeight.w400,
    ),
    // body
    bodyLarge: TextStyle(
      fontSize: FontSize.fontSize20,
      fontWeight: FontWeight.w700,
    ),
    bodyMedium: TextStyle(
      fontSize: FontSize.fontSize20,
      fontWeight: FontWeight.w500,
    ),
    bodySmall: TextStyle(
      fontSize: FontSize.fontSize20,
      fontWeight: FontWeight.w400,
    ),
    // label
    labelLarge: TextStyle(
      fontSize: FontSize.fontSize16,
      fontWeight: FontWeight.w700,
    ),
    labelMedium: TextStyle(
      fontSize: FontSize.fontSize16,
      fontWeight: FontWeight.w500,
    ),
    labelSmall: TextStyle(
      fontSize: FontSize.fontSize16,
      fontWeight: FontWeight.w400,
    ),
    // headline
    headlineLarge: TextStyle(
      fontSize: FontSize.fontSize14,
      fontWeight: FontWeight.w700,
    ),
    headlineMedium: TextStyle(
      fontSize: FontSize.fontSize14,
      fontWeight: FontWeight.w500,
    ),
    headlineSmall: TextStyle(
      fontSize: FontSize.fontSize14,
      fontWeight: FontWeight.w400,
    ),
  );
}

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:vr_challenge/core/constants/theme/app_colors.dart';
import 'package:vr_challenge/core/constants/theme/app_sizes.dart';
import 'package:vr_challenge/core/constants/theme/app_text_styles.dart';

abstract class AppTheme {
  static const MaterialColor _primarySwatch = MaterialColor(0xFF03A8E3, {
    50: Color(0xFF03A8E3),
    100: Color(0xFF03A8E3),
    200: Color(0xFF03A8E3),
    300: Color(0xFF03A8E3),
    400: Color(0xFF03A8E3),
    500: Color(0xFF03A8E3),
    600: Color(0xFF03A8E3),
    700: Color(0xFF03A8E3),
    800: Color(0xFF03A8E3),
    900: Color(0xFF03A8E3),
  });

  static final ThemeData themeData = ThemeData(
    primarySwatch: _primarySwatch,
    primaryColor: const Color(0xFF03A8E3),
    scaffoldBackgroundColor: AppColors.primaryColor,
    textTheme: AppTextStyles.textTheme,
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.tertiaryColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(BorderRadiusSize.borderRadiusSmall),
          ),
        ),
        elevation: 0,
      ),
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        backgroundColor: AppColors.whiteColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(BorderRadiusSize.borderRadiusSmall),
          ),
        ),
        side: BorderSide(
          width: BorderSize.borderSizeSmall,
          color: AppColors.tertiaryColor,
          style: BorderStyle.solid,
        ),
      ),
    ),
    cupertinoOverrideTheme: const CupertinoThemeData(),
    brightness: Brightness.light,
    canvasColor: AppColors.primaryColor,
    // scaffoldBackgroundColor: lightColor,
    cardTheme: const CardTheme(
      color: Colors.white,
      elevation: 0,
      margin: EdgeInsets.all(0),
    ),
    inputDecorationTheme: InputDecorationTheme(
      isDense: true,
      filled: true,
      fillColor: AppColors.quaternaryColor,
      floatingLabelBehavior: FloatingLabelBehavior.always,

      labelStyle: AppTextStyles.textTheme.headlineSmall!.apply(
        color: AppColors.whiteColor,
      ),

      hintStyle: AppTextStyles.textTheme.labelSmall!.apply(
        color: AppColors.labelColor,
      ),

      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(BorderRadiusSize.borderRadiusSmall),
        borderSide: BorderSide(
          color: AppColors.whiteColor,
          width: 1,
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(BorderRadiusSize.borderRadiusSmall),
        borderSide: BorderSide(
          color: AppColors.whiteColor,
          width: 1,
        ),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(BorderRadiusSize.borderRadiusSmall),
        borderSide: BorderSide(
          color: AppColors.whiteColor,
          width: 1,
        ),
      ),
      errorStyle: AppTextStyles.textTheme.headlineSmall!.apply(
        color: Colors.red,
      ),
      // TextStyle(
      //   fontSize: 12,
      //   fontWeight: FontWeight.w300,
      //   fontFamily: 'Poppins',
      //   color: AppColors.whiteColor,
      // ),
    ),
    colorScheme: ColorScheme.light(
      primary: AppColors.primaryColor,
    ),
  );
}

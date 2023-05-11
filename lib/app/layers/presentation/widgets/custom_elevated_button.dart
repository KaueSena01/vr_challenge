import 'package:flutter/material.dart';
import 'package:vr_challenge/core/theme/app_colors.dart';
import 'package:vr_challenge/core/theme/app_sizes.dart';
import 'package:vr_challenge/core/theme/app_text_styles.dart';

class CustomElevatedButton extends StatelessWidget {
  const CustomElevatedButton({
    super.key,
    required this.label,
    required this.onPressed,
    this.textStyle,
    this.width,
    this.height,
    this.margin,
    this.isEnabled = true,
    this.backgroundColor,
  });

  final String label;
  final TextStyle? textStyle;
  final void Function()? onPressed;
  final double? width;
  final double? height;
  final EdgeInsets? margin;
  final Color? backgroundColor;
  final bool isEnabled;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width ?? MediaQuery.of(context).size.width,
      height: height ?? AppSizes.size55,
      margin: margin,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor,
        ),
        onPressed: isEnabled ? onPressed : null,
        child: Text(
          label,
          style: textStyle ??
              AppTextStyles.textTheme.labelSmall!.apply(
                color: AppColors.whiteColor,
              ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:vr_challenge/core/constants/theme/app_colors.dart';
import 'package:vr_challenge/core/constants/theme/app_sizes.dart';
import 'package:vr_challenge/core/constants/theme/app_text_styles.dart';

class CustomOutlinedButton extends StatelessWidget {
  const CustomOutlinedButton({
    super.key,
    required this.label,
    this.borderColor,
    this.labelColor,
    this.margin,
    required this.onPressed,
    this.width,
    this.height,
  });

  final String label;
  final Color? borderColor;
  final Color? labelColor;
  final EdgeInsets? margin;
  final void Function()? onPressed;
  final double? width;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      width: width ?? MediaQuery.of(context).size.width,
      height: height ?? AppSizes.size55,
      child: OutlinedButton(
        style: OutlinedButton.styleFrom(
          side: BorderSide(
            color: borderColor ?? AppColors.tertiaryColor,
          ),
        ),
        onPressed: onPressed,
        child: Text(
          label,
          style: AppTextStyles.textTheme.labelSmall!.apply(
            color: labelColor ?? AppColors.tertiaryColor,
          ),
        ),
      ),
    );
  }
}

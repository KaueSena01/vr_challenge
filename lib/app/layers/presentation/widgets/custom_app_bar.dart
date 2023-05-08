import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:vr_challenge/core/constants/theme/app_colors.dart';
import 'package:vr_challenge/core/constants/theme/app_sizes.dart';
import 'package:vr_challenge/core/constants/theme/app_text_styles.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    super.key,
    this.label,
    this.labelColor,
    this.onTap,
  });

  final String? label;
  final Color? labelColor;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(
        AppSizes.size15,
        AppSizes.size25,
        AppSizes.size15,
        AppSizes.size05,
      ),
      height: AppSizes.size50,
      width: MediaQuery.of(context).size.width - AppSizes.size30,
      color: AppColors.whiteColor,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: () {
              Modular.to.pop();
            },
            child: SvgPicture.asset(
              "assets/icons/arrow.svg",
              height: AppSizes.size30,
              width: AppSizes.size30,
            ),
          ),
          GestureDetector(
            onTap: onTap,
            child: Text(
              label ?? "",
              style: AppTextStyles.textTheme.labelMedium!.apply(
                color: labelColor ?? AppColors.tertiaryColor,
              ),
            ),
          )
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:vr_challenge/core/constants/theme/app_colors.dart';
import 'package:vr_challenge/core/constants/theme/app_sizes.dart';
import 'package:vr_challenge/core/constants/theme/app_text_styles.dart';

void showBottomSheetModal(BuildContext context) {
  showModalBottomSheet(
    backgroundColor: AppColors.whiteColor.withOpacity(0),
    context: context,
    builder: (context) {
      return Container(
        decoration: BoxDecoration(
          color: AppColors.cardColor,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(BorderRadiusSize.borderRadiusSmall),
            topRight: Radius.circular(BorderRadiusSize.borderRadiusSmall),
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            ListTile(
              leading: SvgPicture.asset(
                "assets/icons/courses.svg",
                height: AppSizes.size25,
              ),
              title: Text(
                'Adicionar curso',
                style: AppTextStyles.textTheme.labelMedium!.apply(
                  color: AppColors.darkColor,
                ),
              ),
              onTap: () {
                Modular.to.pop();
                Modular.to.pushNamed('/course');
              },
            ),
            ListTile(
              leading: SvgPicture.asset(
                "assets/icons/student.svg",
                height: AppSizes.size25,
              ),
              title: Text(
                'Adicionar aluno',
                style: AppTextStyles.textTheme.labelMedium!.apply(
                  color: AppColors.darkColor,
                ),
              ),
              onTap: () {},
            ),
          ],
        ),
      );
    },
  );
}

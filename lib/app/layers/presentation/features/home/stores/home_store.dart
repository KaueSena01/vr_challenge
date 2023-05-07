import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mobx/mobx.dart';
import 'package:vr_challenge/core/constants/theme/app_colors.dart';
import 'package:vr_challenge/core/constants/theme/app_sizes.dart';
import 'package:vr_challenge/core/constants/theme/app_text_styles.dart';
part 'home_store.g.dart';

class HomeStore = _HomeStoreBase with _$HomeStore;

abstract class _HomeStoreBase with Store {
  @observable
  int currentIndex = 2;

  @observable
  BuildContext? buildContext;

  @action
  void onItemTapped(int index) {
    currentIndex = index;
    switch (currentIndex) {
      case 0:
        print("navegar para tela 1");
        break;
      case 1:
        print("navegar para tela 2");
        break;
      case 2:
        print("navegar para tela 3");
        showBottomSheet(buildContext!);
        break;
      case 3:
        print("navegar para tela 4");
        break;
      case 4:
        print("navegar para tela 5");
        break;
    }
  }

  void showBottomSheet(BuildContext context) {
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
                onTap: () {},
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
}

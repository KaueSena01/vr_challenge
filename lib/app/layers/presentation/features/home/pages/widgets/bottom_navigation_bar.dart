import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:vr_challenge/app/layers/presentation/features/home/stores/home_store.dart';
import 'package:vr_challenge/core/constants/theme/app_colors.dart';
import 'package:vr_challenge/core/constants/theme/app_sizes.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  const CustomBottomNavigationBar({
    super.key,
    required this.homeStore,
  });

  final HomeStore homeStore;

  @override
  Widget build(BuildContext context) {
    homeStore.buildContext = context;
    return BottomNavigationBar(
      currentIndex: homeStore.currentIndex,
      onTap: homeStore.onItemTapped,
      backgroundColor: AppColors.whiteColor,
      selectedItemColor: AppColors.courseLabelColor,
      type: BottomNavigationBarType.fixed,
      items: [
        BottomNavigationBarItem(
          icon: SvgPicture.asset(
            "assets/icons/lock.svg",
            height: AppSizes.size25,
          ),
          label: 'Admin',
        ),
        BottomNavigationBarItem(
          icon: SvgPicture.asset(
            "assets/icons/courses.svg",
            height: AppSizes.size25,
          ),
          label: 'Cursos',
        ),
        BottomNavigationBarItem(
          icon: Container(
            height: 40,
            width: 80,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  AppColors.primaryColor,
                  AppColors.secondaryColor,
                ],
              ),
              borderRadius: BorderRadius.circular(
                BorderRadiusSize.borderRadiusSmall,
              ),
            ),
            child: Icon(
              Icons.add,
              size: 36,
              color: AppColors.whiteColor,
            ),
          ),
          label: "",
        ),
        BottomNavigationBarItem(
          icon: SvgPicture.asset(
            "assets/icons/student.svg",
            height: AppSizes.size25,
          ),
          label: 'Alunos',
        ),
        BottomNavigationBarItem(
          icon: SvgPicture.asset(
            "assets/icons/bell-2.svg",
            height: AppSizes.size25,
          ),
          label: 'Notificações',
        ),
      ],
    );
  }
}

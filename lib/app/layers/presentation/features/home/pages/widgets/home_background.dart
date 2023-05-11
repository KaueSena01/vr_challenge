import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:vr_challenge/app/layers/domain/entities/admin_entity.dart';
import 'package:vr_challenge/app/layers/presentation/widgets/custom_space.dart';
import 'package:vr_challenge/app/layers/presentation/widgets/custom_text_field.dart';
import 'package:vr_challenge/core/theme/app_colors.dart';
import 'package:vr_challenge/core/theme/app_sizes.dart';
import 'package:vr_challenge/core/theme/app_text_styles.dart';
import 'package:vr_challenge/core/utils/name_formart.dart';

class HomeBackgroundCard extends StatelessWidget {
  HomeBackgroundCard({
    Key? key,
    required this.adminEntity,
    required this.onSearchTextChanged,
  }) : super(key: key);

  final AdminEntity adminEntity;
  final TextEditingController _searchController = TextEditingController();
  final Function(String)? onSearchTextChanged;

  @override
  Widget build(BuildContext context) {
    _searchController.addListener(() {
      if (onSearchTextChanged != null) {
        onSearchTextChanged!(_searchController.text);
      }
    });

    return Container(
      height: AppSizes.size240,
      width: double.infinity,
      padding: EdgeInsets.fromLTRB(
        AppSizes.size15,
        AppSizes.size70,
        AppSizes.size15,
        AppSizes.size15,
      ),
      decoration: BoxDecoration(
        color: AppColors.primaryColor,
        borderRadius: BorderRadius.vertical(
          bottom: Radius.circular(BorderRadiusSize.borderRadiusLarge),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Olá, ${nameFormart(adminEntity.name)}",
                    style: AppTextStyles.textTheme.bodyMedium!.apply(
                      color: AppColors.whiteColor,
                    ),
                  ),
                  Text(
                    adminEntity.email,
                    style: AppTextStyles.textTheme.headlineSmall!.apply(
                      color: AppColors.whiteColor,
                    ),
                  ),
                ],
              ),
              GestureDetector(
                child: SvgPicture.asset(
                  "assets/icons/bell.svg",
                  height: AppSizes.size25,
                ),
              ),
            ],
          ),
          CustomSpace(height: AppSizes.size40),
          CustomTextField(
            hintText: "Pesquisar por...",
            prefixIcon: Icon(
              Icons.search,
              size: AppSizes.size25,
            ),
            controller: _searchController,
          ),
        ],
      ),
    );
  }
}

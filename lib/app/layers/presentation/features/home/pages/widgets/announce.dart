import 'package:flutter/widgets.dart';
import 'package:vr_challenge/app/layers/presentation/widgets/custom_space.dart';
import 'package:vr_challenge/core/constants/theme/app_colors.dart';
import 'package:vr_challenge/core/constants/theme/app_sizes.dart';
import 'package:vr_challenge/core/constants/theme/app_text_styles.dart';

class Announce extends StatelessWidget {
  const Announce({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: AppSizes.size25,
        horizontal: AppSizes.size15,
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Anúncios",
                style: AppTextStyles.textTheme.labelMedium!.apply(
                  color: AppColors.darkColor,
                ),
              ),
              Text(
                "Anúnciar",
                style: AppTextStyles.textTheme.labelMedium!.apply(
                  color: AppColors.tertiaryColor,
                ),
              ),
            ],
          ),
          CustomSpace(height: AppSizes.size15),
          Row(
            children: [
              Container(
                alignment: Alignment.center,
                height: AppSizes.size150,
                width: MediaQuery.of(context).size.width - AppSizes.size30,
                decoration: BoxDecoration(
                  color: AppColors.whiteColor,
                  gradient: LinearGradient(
                    begin: FractionalOffset.topCenter,
                    end: FractionalOffset.bottomCenter,
                    colors: [
                      AppColors.primaryColor,
                      AppColors.secondaryColor,
                    ],
                    stops: const [0.0, 1.0],
                  ),
                  borderRadius: BorderRadius.circular(
                    BorderRadiusSize.borderRadiusLarge,
                  ),
                ),
                child: Text(
                  "Lista de anúncios",
                  style: AppTextStyles.textTheme.labelMedium!.apply(
                    color: AppColors.whiteColor,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

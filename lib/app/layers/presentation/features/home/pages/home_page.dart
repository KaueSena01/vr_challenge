import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:vr_challenge/app/layers/domain/entities/admin_entity.dart';
import 'package:vr_challenge/app/layers/presentation/features/home/pages/widgets/announce.dart';
import 'package:vr_challenge/app/layers/presentation/features/home/pages/widgets/courses.dart';
import 'package:vr_challenge/app/layers/presentation/features/home/pages/widgets/home_background.dart';
import 'package:vr_challenge/app/layers/presentation/features/home/stores/home_store.dart';
import 'package:vr_challenge/app/layers/presentation/features/home/pages/widgets/bottom_navigation_bar.dart';
import 'package:vr_challenge/core/constants/theme/app_colors.dart';

class HomePage extends StatelessWidget {
  HomePage({
    super.key,
    required this.adminEntity,
  });

  final AdminEntity adminEntity;
  final HomeStore _homeStore = Modular.get<HomeStore>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            HomeBackground(adminEntity: adminEntity),
            const Announce(),
            const Courses(),
          ],
        ),
      ),
      bottomNavigationBar: Observer(
        builder: (_) => CustomBottomNavigationBar(homeStore: _homeStore),
      ),
    );
  }
}

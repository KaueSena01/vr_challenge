import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:vr_challenge/app/layers/domain/entities/admin_entity.dart';
import 'package:vr_challenge/app/layers/presentation/features/course/stores/course_store.dart';
import 'package:vr_challenge/app/layers/presentation/features/home/pages/widgets/courses.dart';
import 'package:vr_challenge/app/layers/presentation/features/home/pages/widgets/home_background.dart';
import 'package:vr_challenge/app/layers/presentation/features/home/stores/home_store.dart';
import 'package:vr_challenge/app/layers/presentation/features/home/pages/widgets/bottom_navigation_bar.dart';
import 'package:vr_challenge/core/constants/theme/app_colors.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    super.key,
    required this.adminEntity,
  });

  final AdminEntity adminEntity;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final HomeStore _homeStore = Modular.get<HomeStore>();

  final CourseStore _courseStore = Modular.get<CourseStore>();

  @override
  void initState() {
    super.initState();
    _courseStore.getAllCourses();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            HomeBackgroundCard(adminEntity: widget.adminEntity),
            // const Announce(),
            Observer(
              builder: (_) => _courseStore.loading
                  ? const Center(
                      child: CircularProgressIndicator(),
                    )
                  : Courses(courseEntity: _courseStore.coursesList),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Observer(
        builder: (_) => CustomBottomNavigationBar(homeStore: _homeStore),
      ),
    );
  }
}

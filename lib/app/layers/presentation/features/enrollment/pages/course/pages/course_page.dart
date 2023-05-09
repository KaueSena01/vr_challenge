import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:vr_challenge/app/layers/domain/entities/course_entity.dart';
import 'package:vr_challenge/app/layers/presentation/features/enrollment/pages/course/pages/widgets/body.dart';
import 'package:vr_challenge/app/layers/presentation/features/enrollment/pages/course/pages/widgets/course_alert.dart';
import 'package:vr_challenge/app/layers/presentation/features/enrollment/pages/course/stores/course_store.dart';
import 'package:vr_challenge/app/layers/presentation/features/enrollment/stores/enrollment_store.dart';
import 'package:vr_challenge/app/layers/presentation/widgets/custom_app_bar.dart';
import 'package:vr_challenge/app/layers/presentation/widgets/custom_elevated_button.dart';
import 'package:vr_challenge/app/layers/presentation/widgets/custom_outlined_button.dart';
import 'package:vr_challenge/app/layers/presentation/widgets/custom_space.dart';
import 'package:vr_challenge/app/layers/presentation/widgets/custom_title.dart';
import 'package:vr_challenge/core/constants/theme/app_colors.dart';
import 'package:vr_challenge/core/constants/theme/app_sizes.dart';

class CoursePage extends StatefulWidget {
  const CoursePage({
    super.key,
    required this.courseEntity,
  });

  final CourseEntity courseEntity;

  @override
  State<CoursePage> createState() => _CoursePageState();
}

class _CoursePageState extends State<CoursePage> {
  final CourseStore courseStore = Modular.get<CourseStore>();

  final EnrollmentStore enrollmentStore = Modular.get<EnrollmentStore>();

  @override
  void initState() {
    super.initState();
    enrollmentStore.getEnrolledCoursesCount(widget.courseEntity.id!);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomAppBar(
              label: "Editar curso",
              onTap: () => Modular.to
                  .pushNamed('update', arguments: widget.courseEntity),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: AppSizes.size15),
                  child: Form(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        title(widget.courseEntity.name),
                        CustomSpace(height: AppSizes.size60),
                        Body(
                          courseEntity: widget.courseEntity,
                          enrollmentStore: enrollmentStore,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            CustomElevatedButton(
              margin: EdgeInsets.fromLTRB(
                AppSizes.size15,
                AppSizes.size15,
                AppSizes.size15,
                AppSizes.size05,
              ),
              label: "Matricular alunos",
              onPressed: enrollmentStore.count < 10
                  ? () => Modular.to.pushNamed(
                        '/enrollment/student/enrollment',
                        arguments: widget.courseEntity,
                      )
                  : null,
            ),
            CustomOutlinedButton(
              margin: EdgeInsets.all(AppSizes.size15),
              label: "Remover curso",
              labelColor: AppColors.dangerColor,
              borderColor: AppColors.dangerColor,
              onPressed: () => courseAlert(
                context,
                widget.courseEntity.name,
                courseStore.deleteCourse(
                  widget.courseEntity.id!,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

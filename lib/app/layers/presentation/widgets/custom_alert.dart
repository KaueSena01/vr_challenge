import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:vr_challenge/app/layers/presentation/features/enrollment/modules/course/stores/course_store.dart';
import 'package:vr_challenge/app/layers/presentation/features/enrollment/modules/student/stores/student_store.dart';
import 'package:vr_challenge/app/layers/presentation/features/enrollment/stores/enrollment_store.dart';
import 'package:vr_challenge/app/layers/presentation/widgets/custom_elevated_button.dart';
import 'package:vr_challenge/app/layers/presentation/widgets/custom_outlined_button.dart';
import 'package:vr_challenge/core/constants/theme/app_colors.dart';
import 'package:vr_challenge/core/constants/theme/app_sizes.dart';
import 'package:vr_challenge/core/constants/theme/app_text_styles.dart';

void customAlert({
  required BuildContext context,
  required String title,
  required String body,
  required bool isCourse,
  required int code,
}) {
  StudentStore studentStore = Modular.get<StudentStore>();
  CourseStore courseStore = Modular.get<CourseStore>();
  EnrollmentStore enrollmentStore = Modular.get<EnrollmentStore>();

  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text(
          title,
          style: AppTextStyles.textTheme.bodyMedium!.apply(
            color: AppColors.courseLabelColor,
          ),
        ),
        content: Text(
          body,
          style: AppTextStyles.textTheme.labelSmall!.apply(
            color: AppColors.courseLabelColor,
          ),
        ),
        actions: [
          CustomElevatedButton(
            margin: EdgeInsets.fromLTRB(
              AppSizes.size10,
              AppSizes.size10,
              AppSizes.size10,
              AppSizes.size15,
            ),
            backgroundColor: AppColors.dangerColor,
            label: "Deletar",
            onPressed: () {
              Navigator.pop(context);
              isCourse
                  ? {
                      courseStore.deleteCourse(code),
                      enrollmentStore.removeCourseFromEnrollment(code)
                    }
                  : {
                      studentStore.deleteStudent(code),
                      enrollmentStore.removeEnrollment(code),
                    };
              Modular.to.navigate('/home');
            },
          ),
          CustomOutlinedButton(
            margin: EdgeInsets.fromLTRB(
              AppSizes.size10,
              AppSizes.size00,
              AppSizes.size10,
              AppSizes.size15,
            ),
            label: "Cancelar",
            onPressed: () => Navigator.pop(context),
          ),
        ],
      );
    },
  );
}

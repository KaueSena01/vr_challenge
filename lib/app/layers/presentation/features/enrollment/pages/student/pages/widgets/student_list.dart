import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:vr_challenge/app/layers/domain/entities/student_entity.dart';
import 'package:vr_challenge/app/layers/presentation/widgets/custom_space.dart';
import 'package:vr_challenge/core/constants/theme/app_colors.dart';
import 'package:vr_challenge/core/constants/theme/app_sizes.dart';
import 'package:vr_challenge/core/constants/theme/app_text_styles.dart';

class StudentsList extends StatelessWidget {
  const StudentsList({
    super.key,
    required this.studentEntity,
    this.label,
    this.onStudentSelected,
    this.selectedStudents,
  });

  final List<StudentEntity> studentEntity;
  final String? label;
  final void Function(int studentId)? onStudentSelected;
  final List<int>? selectedStudents;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width - AppSizes.size30,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(
          BorderRadiusSize.borderRadiusMedium,
        ),
      ),
      child: studentEntity.isNotEmpty
          ? ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: studentEntity.length,
              padding: EdgeInsets.all(AppSizes.size00),
              itemBuilder: (_, index) {
                final student = studentEntity[index];
                final isSelected =
                    selectedStudents?.contains(student.id) ?? false;
                final toggle = isSelected ? "Remover" : "Adicionar";
                return Column(
                  children: [
                    if (index > 0)
                      Divider(
                        height: AppSizes.size30,
                        thickness: 1,
                        color: AppColors.courseLabelColor,
                      ),
                    CustomSpace(height: AppSizes.size05),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          student.name,
                          style: AppTextStyles.textTheme.labelSmall!.apply(
                            color: AppColors.courseLabelColor,
                          ),
                        ),
                        GestureDetector(
                          onTap: onStudentSelected != null
                              ? () => onStudentSelected!(student.id!)
                              : () => Modular.to.pushNamed(
                                    'update',
                                    arguments: student,
                                  ),
                          child: Text(
                            label ?? "Editar",
                            style: AppTextStyles.textTheme.labelMedium!.apply(
                              color: toggle == "Remover"
                                  ? AppColors.dangerColor
                                  : AppColors.tertiaryColor,
                            ),
                          ),
                        ),
                      ],
                    ),
                    CustomSpace(height: AppSizes.size05),
                  ],
                );
              },
            )
          : Text(
              "Não existe nenhum curso cadastrado =(",
              style: AppTextStyles.textTheme.headlineSmall!.apply(
                color: AppColors.courseLabelColor,
              ),
              textAlign: TextAlign.center,
            ),
    );
  }
}

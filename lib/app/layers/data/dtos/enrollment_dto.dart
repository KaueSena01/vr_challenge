import 'package:vr_challenge/app/layers/domain/entities/enrollment_entity.dart';

class EnrollmentDTO extends EnrollmentEntity {
  const EnrollmentDTO({
    int? id,
    required int studentCode,
    required List<int> courseCode,
  }) : super(
          id: id,
          studentCode: studentCode,
          courseCode: courseCode,
        );

  Map<String, dynamic> toMap() {
    return {
      "studentCode": studentCode,
      "courseCode": courseCode,
    };
  }

  factory EnrollmentDTO.fromMap(Map<String, dynamic> map) {
    return EnrollmentDTO(
      id: map['id'] ?? '',
      studentCode: map['studentCode'] ?? '',
      courseCode: map['courseCode'] ?? '',
    );
  }

  factory EnrollmentDTO.fromEntity(EnrollmentEntity enrollmentEntity) {
    return EnrollmentDTO(
      id: enrollmentEntity.id,
      studentCode: enrollmentEntity.studentCode,
      courseCode: enrollmentEntity.courseCode,
    );
  }
}

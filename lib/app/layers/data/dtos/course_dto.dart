import 'package:vr_challenge/app/layers/domain/entities/course_entity.dart';

class CourseDTO extends CourseEntity {
  const CourseDTO({
    int? id,
    required String name,
    required String description,
    required String syllabus,
  }) : super(
          id: id,
          name: name,
          description: description,
          syllabus: syllabus,
        );

  Map<String, dynamic> toMap() {
    return {
      "name": name,
      "description": description,
      "syllabus": syllabus,
    };
  }

  factory CourseDTO.fromMap(Map<String, dynamic> map) {
    return CourseDTO(
      id: map['id'] ?? '',
      name: map['name'] ?? '',
      description: map['description'] ?? '',
      syllabus: map['syllabus'] ?? '',
    );
  }

  factory CourseDTO.fromEntity(CourseEntity courseEntity) {
    return CourseDTO(
      id: courseEntity.id,
      name: courseEntity.name,
      description: courseEntity.description,
      syllabus: courseEntity.syllabus,
    );
  }
}

import 'package:equatable/equatable.dart';

class CourseEntity extends Equatable {
  final int? id;
  final String name;
  final String description;
  final String syllabus;

  const CourseEntity({
    this.id,
    required this.name,
    required this.description,
    required this.syllabus,
  });

  @override
  List<Object?> get props => [];
}

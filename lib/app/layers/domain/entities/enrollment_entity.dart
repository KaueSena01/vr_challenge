import 'package:equatable/equatable.dart';

class EnrollmentEntity extends Equatable {
  final int? id;
  final int studentCode;
  final List<int> courseCode;

  const EnrollmentEntity({
    this.id,
    required this.studentCode,
    required this.courseCode,
  });

  @override
  List<Object?> get props => [];
}

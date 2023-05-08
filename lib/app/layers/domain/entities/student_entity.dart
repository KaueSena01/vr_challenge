import 'package:equatable/equatable.dart';

class StudentEntity extends Equatable {
  final int? id;
  final String name;
  final String email;
  final String password;

  const StudentEntity({
    this.id,
    required this.name,
    required this.email,
    required this.password,
  });

  @override
  List<Object?> get props => [];
}

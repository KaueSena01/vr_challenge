import 'package:equatable/equatable.dart';

class AdminEntity extends Equatable {
  final String name;
  final String email;
  final String password;

  const AdminEntity({
    required this.name,
    required this.email,
    required this.password,
  });

  @override
  List<Object?> get props => [];
}

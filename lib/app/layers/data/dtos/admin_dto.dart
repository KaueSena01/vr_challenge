import 'package:vr_challenge/app/layers/domain/entities/admin_entity.dart';

class AdminDTO extends AdminEntity {
  const AdminDTO({
    required String name,
    required String email,
    required String password,
  }) : super(
          name: name,
          email: email,
          password: password,
        );

  Map<String, dynamic> toMap() {
    return {
      "name": name,
      "email": email,
      "password": password,
    };
  }

  factory AdminDTO.fromMap(Map<String, dynamic> map) {
    return AdminDTO(
      name: map['name'] ?? '',
      email: map['email'] ?? '',
      password: map['password'] ?? '',
    );
  }
}

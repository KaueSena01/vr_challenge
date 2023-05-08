import 'package:vr_challenge/app/layers/domain/entities/student_entity.dart';

class StudentDTO extends StudentEntity {
  const StudentDTO({
    int? id,
    required String name,
    required String email,
    required String password,
  }) : super(
          id: id,
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

  factory StudentDTO.fromMap(Map<String, dynamic> map) {
    return StudentDTO(
      id: map['id'] ?? '',
      name: map['name'] ?? '',
      email: map['email'] ?? '',
      password: map['password'] ?? '',
    );
  }

  factory StudentDTO.fromEntity(StudentEntity studentEntity) {
    return StudentDTO(
      id: studentEntity.id,
      name: studentEntity.name,
      email: studentEntity.email,
      password: studentEntity.password,
    );
  }
}

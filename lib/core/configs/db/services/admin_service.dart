import 'package:sqflite/sqflite.dart';
import 'package:vr_challenge/app/layers/data/dtos/admin_dto.dart';

class AdminService {
  final Database database;

  AdminService({required this.database});

  Future<AdminDTO> getAdmin(String email, String password) async {
    final data = await database.query(
      'admin',
      where: 'email = ? AND password = ?',
      whereArgs: [email, password],
    );

    if (data.isNotEmpty) {
      return AdminDTO.fromMap(data.first);
    }

    throw Exception('Usuário ou senha inválidos');
  }
}

import 'package:vr_challenge/app/layers/domain/entities/admin_entity.dart';

abstract class AdminRepository {
  Future<AdminEntity> signIn(AdminEntity adminEntity);
}

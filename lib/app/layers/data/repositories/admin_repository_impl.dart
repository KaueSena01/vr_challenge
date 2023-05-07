import 'package:vr_challenge/app/layers/data/data_sources/admin_datasource.dart';
import 'package:vr_challenge/app/layers/domain/entities/admin_entity.dart';
import 'package:vr_challenge/app/layers/domain/repositories/admin_repositorty.dart';

class AdminRepositoryImpl implements AdminRepository {
  final AdminDataSource adminDataSource;

  AdminRepositoryImpl({required this.adminDataSource});

  @override
  Future<AdminEntity> signIn(AdminEntity adminEntity) async {
    return await adminDataSource.signIn(adminEntity);
  }
}

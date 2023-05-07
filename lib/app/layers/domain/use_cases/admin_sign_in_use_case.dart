import 'package:vr_challenge/app/layers/domain/entities/admin_entity.dart';
import 'package:vr_challenge/app/layers/domain/repositories/admin_repositorty.dart';

class AdminSignInUseCase {
  final AdminRepository adminRepository;

  AdminSignInUseCase({required this.adminRepository});

  Future<void> call(AdminEntity adminEntity) async {
    await adminRepository.signIn(adminEntity);
  }
}

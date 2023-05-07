import 'package:asuka/snackbars/asuka_snack_bar.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:vr_challenge/app/layers/domain/entities/admin_entity.dart';
import 'package:vr_challenge/app/layers/domain/use_cases/admin_sign_in_use_case.dart';
part 'login_store.g.dart';

class LoginStore = _LoginStoreBase with _$LoginStore;

abstract class _LoginStoreBase with Store {
  final AdminSignInUseCase _signInUseCase;

  _LoginStoreBase(this._signInUseCase);

  @observable
  bool loading = false;

  @action
  Future<void> signIn(String email, String password) async {
    loading = true;

    try {
      final admin = await _signInUseCase(
        AdminEntity(name: "", email: email, password: password),
      );
      Modular.to.pushReplacementNamed('/home', arguments: admin);
    } catch (_) {
      AsukaSnackbar.alert(
        "Administrador não encontrado, verifique suas credenciais!",
      ).show();
    } finally {
      loading = false;
    }
  }
}

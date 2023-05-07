import 'package:mobx/mobx.dart';
import 'package:vr_challenge/app/layers/domain/entities/admin_entity.dart';
import 'package:vr_challenge/app/layers/domain/use_cases/admin_sign_in_use_case.dart';
part 'admin_store.g.dart';

class AdminStore = _AdminStoreBase with _$AdminStore;

abstract class _AdminStoreBase with Store {
  final AdminSignInUseCase _signInUseCase;

  _AdminStoreBase(this._signInUseCase);

  @observable
  String? email;

  @observable
  String? password;

  @observable
  bool loading = false;

  @action
  Future<void> signIn(String email, String password) async {
    loading = true;

    try {
      await _signInUseCase(
        AdminEntity(
          name: "name",
          email: email,
          password: password,
        ),
      );
    } catch (e) {
      // handle error
      print(e);
    } finally {
      loading = false;
    }
  }
}

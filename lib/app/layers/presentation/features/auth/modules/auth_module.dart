import 'package:flutter_modular/flutter_modular.dart';
import 'package:vr_challenge/app/layers/data/data_sources/local/admin_datasource_impl.dart';
import 'package:vr_challenge/app/layers/data/repositories/admin_repository_impl.dart';
import 'package:vr_challenge/app/layers/domain/use_cases/admin_sign_in_use_case.dart';
import 'package:vr_challenge/app/layers/presentation/features/auth/pages/login_page.dart';
import 'package:vr_challenge/app/layers/presentation/features/auth/stores/login_store.dart';
import 'package:vr_challenge/core/configs/db/db.dart';

class LoginModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.singleton((i) => DatabaseProvider.instance),
    Bind.lazySingleton((i) => AdminSignInUseCase(adminRepository: i.get())),
    Bind.lazySingleton((i) => AdminRepositoryImpl(adminDataSource: i.get())),
    Bind.lazySingleton((i) => AdminDataSourceImpl(i.get<DatabaseProvider>())),
    Bind.lazySingleton((i) => LoginStore(i.get())),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(
      '/',
      child: (context, agrs) => LoginPage(),
    ),
  ];
}

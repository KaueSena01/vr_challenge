import 'package:flutter_modular/flutter_modular.dart';
import 'package:vr_challenge/app/layers/data/data_sources/local/admin_datasource_impl.dart';
import 'package:vr_challenge/app/layers/data/repositories/admin_repository_impl.dart';
import 'package:vr_challenge/app/layers/domain/use_cases/admin_sign_in_use_case.dart';
import 'package:vr_challenge/app/layers/presentation/features/home/pages/home_page.dart';

import 'stores/admin_store.dart';

class HomeModule extends Module {
  @override
  final List<Bind> binds = [
    Bind((i) => AdminSignInUseCase(adminRepository: i.get())),
    Bind((i) => AdminRepositoryImpl(adminDataSource: i.get())),
    Bind((i) => AdminDataSourceImpl()),
    Bind((i) => AdminStore(i.get())),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(
      '/',
      child: (context, agrs) => const HomePage(),
    ),
  ];
}

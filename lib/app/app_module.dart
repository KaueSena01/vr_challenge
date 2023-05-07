import 'package:flutter_modular/flutter_modular.dart';
import 'package:vr_challenge/app/layers/presentation/features/home/modules/home_module.dart';
import 'layers/presentation/features/auth/pages/login_module.dart';

class AppModule extends Module {
  @override
  final List<Bind> binds = [];

  @override
  final List<ModularRoute> routes = [
    ModuleRoute(
      Modular.initialRoute,
      module: LoginModule(),
    ),
    ModuleRoute(
      '/home',
      module: HomeModule(),
    ),
  ];
}
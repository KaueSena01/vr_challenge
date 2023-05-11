import 'package:flutter_modular/flutter_modular.dart';
import 'package:vr_challenge/app/layers/presentation/features/enrollment/modules/enrollment_module.dart';
import 'package:vr_challenge/app/layers/presentation/features/home/modules/home_module.dart';
import 'layers/presentation/features/auth/modules/auth_module.dart';

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
    ModuleRoute(
      '/enrollment',
      module: EnrollmentModule(),
    ),
  ];
}

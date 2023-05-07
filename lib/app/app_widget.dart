import 'package:asuka/asuka.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:vr_challenge/core/constants/theme/app_theme.dart';

class AppWidget extends StatelessWidget {
  AppWidget({super.key});

  final GlobalKey _globalKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      key: _globalKey,
      debugShowCheckedModeBanner: false,
      title: 'VR Challenge',
      theme: AppTheme.themeData,
      builder: Asuka.builder,
      routeInformationParser: Modular.routeInformationParser,
      routerDelegate: Modular.routerDelegate,
    );
  }
}

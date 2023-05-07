import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:vr_challenge/core/constants/theme/app_colors.dart';

import '../stores/admin_store.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final AdminStore adminStore = Modular.get<AdminStore>();
    TextEditingController emailTextEditingController = TextEditingController();
    TextEditingController passwordTextEditingController =
        TextEditingController();

    return Scaffold(
      appBar: AppBar(),
      backgroundColor: AppColors.whiteColor,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          TextFormField(
            controller: emailTextEditingController,
          ),
          TextFormField(
            controller: passwordTextEditingController,
          ),
          ElevatedButton(
            child: const Text("Entrar"),
            onPressed: () async => await adminStore.signIn(
              emailTextEditingController.text,
              passwordTextEditingController.text,
            ),
          ),
        ],
      ),
    );
  }
}

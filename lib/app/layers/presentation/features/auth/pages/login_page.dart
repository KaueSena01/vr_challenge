import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:vr_challenge/app/layers/presentation/widgets/custom_elevated_button.dart';
import 'package:vr_challenge/app/layers/presentation/widgets/custom_space.dart';
import 'package:vr_challenge/app/layers/presentation/widgets/custom_login_text_field.dart';
import 'package:vr_challenge/core/theme/app_colors.dart';
import 'package:vr_challenge/core/theme/app_sizes.dart';
import 'package:vr_challenge/core/theme/app_text_styles.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:vr_challenge/core/validators/input_validator.dart';

import '../stores/login_store.dart';

class LoginPage extends StatelessWidget {
  LoginPage({Key? key}) : super(key: key);

  final _formKey = GlobalKey<FormState>();

  final LoginStore loginStore = Modular.get<LoginStore>();

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      body: Stack(
        children: <Widget>[
          Container(
            decoration: const BoxDecoration(
              color: Colors.transparent,
              image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage(
                  "assets/images/background_login.png",
                ),
              ),
            ),
          ),
          Container(
            height: double.infinity,
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.white,
              gradient: LinearGradient(
                begin: FractionalOffset.topCenter,
                end: FractionalOffset.bottomCenter,
                colors: [
                  AppColors.primaryColor.withOpacity(0.8),
                  AppColors.blackColor,
                ],
                stops: const [0.0, 0.9],
              ),
            ),
            child: Padding(
              padding: EdgeInsets.all(AppSizes.size15),
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: 150,
                                width: 150,
                                child: SvgPicture.asset(
                                  "assets/icons/vr _challenge.svg",
                                ),
                              ),
                            ],
                          ),
                          CustomSpace(height: AppSizes.size30),
                          Text(
                            'Bem vindo ao VR challenge',
                            style: AppTextStyles.textTheme.bodySmall!.apply(
                              color: AppColors.whiteColor,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          CustomSpace(height: AppSizes.size20),
                          CustomLoginTextField(
                            hintText: "Digite seu e-mail",
                            controller: _emailController,
                            validator: emailValidator,
                          ),
                          CustomSpace(height: AppSizes.size25),
                          CustomLoginTextField(
                            hintText: "Digite sua senha",
                            controller: _passwordController,
                            validator: passwordValidator,
                          ),
                        ],
                      ),
                    ),
                    Observer(
                      builder: (_) => loginStore.loading
                          ? const Center(
                              child: CircularProgressIndicator(),
                            )
                          : CustomElevatedButton(
                              label: "Entrar",
                              backgroundColor: AppColors.primaryColor,
                              onPressed: () async {
                                FocusScope.of(context).unfocus();

                                if (_formKey.currentState!.validate()) {
                                  await loginStore.signIn(
                                    _emailController.text,
                                    _passwordController.text,
                                  );
                                }
                              },
                            ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

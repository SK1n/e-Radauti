import 'package:authentication_repository/authentication_repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterapperadauti/app/i18n/strings.g.dart';
import 'package:flutterapperadauti/app/pages/login/cubit/login_cubit.dart';
import 'package:flutterapperadauti/app/pages/login/view/login_form.dart';
import 'package:flutterapperadauti/app/pages/sign_up/view/sign_up_page.dart';
import 'package:flutterapperadauti/modules/login/controller/login_controller.dart';
import 'package:flutterapperadauti/utils/assets.dart';
import 'package:flutterapperadauti/utils/shared_widgets/app_scaffold/app_scaffold.dart';
import 'package:get/get.dart';

class LoginPage extends GetView<LoginController> {
  const LoginPage({super.key});

  static Page<void> page() => const MaterialPage<void>(child: LoginPage());

  @override
  Widget build(BuildContext context) {
    final t = context.t;
    return AppScaffold(
      slivers: [
        Image.asset(
          Assets.logoImagesRc,
          width: 100,
          height: 100,
        ),
        Center(
          child: Padding(
            padding: const EdgeInsets.only(bottom: 20),
            child: Text(
              t.singInScreen.welcome,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
            ),
          ),
        ),
        BlocProvider(
          create: (context) =>
              LoginCubit(context.read<AuthenticationRepository>()),
          child: const LoginForm(),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 20),
          child: RichText(
            text: TextSpan(
              text: t.singInScreen.createAccount,
              style: const TextStyle(
                color: Colors.black,
                fontSize: 16,
              ),
              children: [
                TextSpan(
                  text: t.singInScreen.createAccountButton,
                  style: const TextStyle(
                    color: Colors.blue,
                    fontSize: 16,
                  ),
                  recognizer: TapGestureRecognizer()
                    ..onTap = () {
                      Navigator.of(context).push(SignUpPage.route());
                    },
                ),
              ],
            ),
          ),
        ),
      ],
      appBarTitle: t.singInScreen.title,
      showDrawerButton: false,
    );
  }
}

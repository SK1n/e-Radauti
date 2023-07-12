import 'package:auto_route/annotations.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../cubit/login_cubit.dart';
import 'login_form.dart';
import '../../sign_up/view/sign_up_page.dart';
import '../../../repository/authentication/authentication_repository.dart';
import '../../../../gen/strings.g.dart';
import '../../../utils/scaffolds/app_scaffold.dart';

@RoutePage()
class PageLogin extends StatelessWidget {
  const PageLogin({super.key});

  static Page<void> page() => const MaterialPage<void>(child: PageLogin());

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      slivers: [
        Image.asset(
          'assets/logo_images/rc.png',
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

import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterapperadauti/app/utils/app_constants.dart';
import 'package:flutterapperadauti/gen/assets.gen.dart';
import '../cubit/login_cubit.dart';
import 'login_form.dart';
import '../../sign_up/view/sign_up_page.dart';
import '../../../repository/authentication/authentication_repository.dart';
import '../../../../gen/strings.g.dart';
import '../../../utils/scaffolds/app_scaffold.dart';

class PageLogin extends StatelessWidget {
  const PageLogin({super.key});

  static Page<void> page() => const MaterialPage<void>(child: PageLogin());

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      slivers: [
        Assets.logoImages.rc.image(width: 100, height: 100),
        Center(
          child: Padding(
            padding: AppConstants.bottomDelimiter,
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
          padding: AppConstants.innerCardPadding,
          child: RichText(
            text: TextSpan(
              text: t.singInScreen.createAccount,
              style: AppConstants.titleBigTextStyle,
              children: [
                TextSpan(
                  text: t.singInScreen.createAccountButton,
                  style: AppConstants.linkTextStyle,
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

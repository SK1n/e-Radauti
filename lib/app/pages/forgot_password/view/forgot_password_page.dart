import 'package:authentication_repository/authentication_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterapperadauti/app/pages/forgot_password/cubit/forgot_password_cubit.dart';
import 'package:flutterapperadauti/app/pages/forgot_password/view/forgot_password_form.dart';
import 'package:flutterapperadauti/i18n/strings.g.dart';
import 'package:flutterapperadauti/utils/shared_widgets/app_scaffold/app_scaffold.dart';

class ForgotPasswordPage extends StatelessWidget {
  final String? email;

  const ForgotPasswordPage(this.email, {super.key});

  static Route<void> route(String? email) {
    return MaterialPageRoute<void>(builder: (_) => ForgotPasswordPage(email));
  }

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      appBarTitle: t.forgotPassword.title,
      showDrawerButton: false,
      slivers: [
        BlocProvider(
          create: (context) => ForgotPasswordCubit(
            context.read<AuthenticationRepository>(),
          ),
          child: ForgotPasswordForm(email),
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../cubit/forgot_password_cubit.dart';
import 'forgot_password_form.dart';
import '../../../repository/authentication/authentication_repository.dart';
import '../../../../gen/strings.g.dart';
import '../../../utils/scaffolds/app_scaffold.dart';

class ForgotPasswordPage extends StatelessWidget {
  final String? email;

  const ForgotPasswordPage(this.email, {super.key});

  static Route<void> route(String? email) {
    return MaterialPageRoute<void>(
      builder: (_) => ForgotPasswordPage(email),
    );
  }

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      appBarTitle: context.t.forgotPassword.title,
      showDrawerButton: false,
      slivers: [
        BlocProvider(
          create: (context) => ForgotPasswordCubit(
            context.read<AuthenticationRepository>(),
          )..emailChanged(email!),
          child: ForgotPasswordForm(email),
        ),
      ],
    );
  }
}

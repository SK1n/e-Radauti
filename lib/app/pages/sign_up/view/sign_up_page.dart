import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/sign_up_cubit.dart';
import 'sign_up_form.dart';
import '../../../repository/authentication/authentication_repository.dart';
import '../../../../gen/strings.g.dart';
import '../../../utils/scaffolds/app_scaffold.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});
  static Route<void> route() {
    return MaterialPageRoute<void>(builder: (_) => const SignUpPage());
  }

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      appBarTitle: context.t.createAccount.title,
      showDrawerButton: false,
      slivers: [
        BlocProvider(
          create: (context) =>
              SignUpCubit(context.read<AuthenticationRepository>()),
          child: const SignUpForm(),
        ),
      ],
    );
  }
}

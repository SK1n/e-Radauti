import 'package:authentication_repository/authentication_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutterapperadauti/app/pages/sign_up/cubit/sign_up_cubit.dart';
import 'package:flutterapperadauti/app/pages/sign_up/view/sign_up_form.dart';
import 'package:flutterapperadauti/i18n/strings.g.dart';
import 'package:flutterapperadauti/modules/create_account/controllers/sign_up_controller.dart';
import 'package:flutterapperadauti/utils/shared_widgets/app_scaffold/app_scaffold.dart';
import 'package:get/get.dart';

class SignUpPage extends GetView<SignUpController> {
  const SignUpPage({super.key});
  static Route<void> route() {
    return MaterialPageRoute<void>(builder: (_) => const SignUpPage());
  }

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      appBarTitle: t.createAccount.title,
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

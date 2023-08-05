import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterapperadauti/app/form_inputs/form_inputs.dart';
import 'package:flutterapperadauti/app/utils/app_constants.dart';

import '../../forgot_password/view/forgot_password_page.dart';
import '../cubit/login_cubit.dart';
import '../../../../gen/strings.g.dart';
import '../../../utils/widgets/loading_widget.dart';
import 'package:formz/formz.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginCubit, LoginState>(
      listener: (context, state) {
        if (state.status.isFailure) {
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(
              SnackBar(
                content: Text(state.errorMessage),
              ),
            );
        }
      },
      child: Column(
        children: [
          _EmailInput(),
          _PasswordInput(),
          Padding(
            padding: AppConstants.innerCardPadding,
            child: InkWell(
              child: Text(
                context.t.singInScreen.forgotPassword,
                style: AppConstants.linkTextStyle,
              ),
              onTap: () {
                Navigator.of(context).push(
                  ForgotPasswordPage.route(
                    context.read<LoginCubit>().state.form.email.value,
                  ),
                );
              },
            ),
          ),
          _LoginButton(),
          _GuestLoginButton(),
        ],
      ),
    );
  }
}

class _EmailInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginCubit, LoginState>(
      buildWhen: (previous, current) =>
          previous.form.email != current.form.email,
      builder: (context, state) {
        return Padding(
          padding: AppConstants.innerCardPadding,
          child: TextFormField(
            onChanged: (email) =>
                context.read<LoginCubit>().emailChanged(email),
            keyboardType: TextInputType.emailAddress,
            validator: (_) => state.form.email.displayError?.text(),
            decoration: InputDecoration(
              errorText:
                  state.form.isPure ? null : state.form.email.error?.text(),
              labelText: context.t.singInScreen.emailTextField,
            ),
          ),
        );
      },
    );
  }
}

class _PasswordInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginCubit, LoginState>(
      buildWhen: (previous, current) =>
          previous.form.password != current.form.password,
      builder: (context, state) {
        return Padding(
          padding: AppConstants.innerCardPadding,
          child: TextFormField(
            onChanged: (password) =>
                context.read<LoginCubit>().passwordChanged(password),
            obscureText: true,
            validator: (_) => state.form.password.displayError?.text(),
            decoration: InputDecoration(
              errorText:
                  state.form.isPure ? null : state.form.password.error?.text(),
              labelText: context.t.singInScreen.passwordTextField,
            ),
          ),
        );
      },
    );
  }
}

class _LoginButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginCubit, LoginState>(
      builder: (context, state) {
        if (state.status.isInProgress) {
          return const LoadingWidget();
        }
        return Container(
          padding: AppConstants.innerCardPadding,
          width: MediaQuery.of(context).size.width,
          child: FilledButton(
            onPressed: state.form.isValid
                ? () => context.read<LoginCubit>().logInWithCredentials()
                : null,
            child: Text(context.t.singInScreen.logInButton),
          ),
        );
      },
    );
  }
}

class _GuestLoginButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginCubit, LoginState>(
      builder: (context, state) {
        return Container(
          padding: AppConstants.innerCardPadding,
          width: MediaQuery.of(context).size.width,
          child: FilledButton(
            onPressed: () => context.read<LoginCubit>().logInAnonymously(),
            child: Text(context.t.singInScreen.guest),
          ),
        );
      },
    );
  }
}

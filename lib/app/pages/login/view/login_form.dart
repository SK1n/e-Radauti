import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutterapperadauti/app/pages/forgot_password/view/forgot_password_page.dart';
import 'package:flutterapperadauti/app/pages/login/cubit/login_cubit.dart';
import 'package:flutterapperadauti/app/utils/widgets/border_text_form_field.dart';
import 'package:flutterapperadauti/i18n/strings.g.dart';
import 'package:flutterapperadauti/utils/loading_widget.dart';
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
                content: Text(state.errorMessage ?? 'Authentication Failure'),
              ),
            );
        }
      },
      child: Column(
        children: [
          _EmailInput(),
          _PasswordInput(),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: InkWell(
              child: Text(
                t.singInScreen.forgotPassword,
                style: const TextStyle(color: Colors.blue),
              ),
              onTap: () {
                Navigator.of(context).push(
                  ForgotPasswordPage.route(
                    context.read<LoginCubit>().state.email.value,
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
      buildWhen: (previous, current) => previous.email != current.email,
      builder: (context, state) {
        return BorderTextFormField(
          onChanged: (email) => context.read<LoginCubit>().emailChanged(email),
          keyboardType: TextInputType.emailAddress,
          errorText:
              state.email.displayError != null ? t.formats.invalidEmail : null,
          hint: t.singInScreen.emailTextField,
        );
      },
    );
  }
}

class _PasswordInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginCubit, LoginState>(
      buildWhen: (previous, current) => previous.password != current.password,
      builder: (context, state) {
        return BorderTextFormField(
          onChanged: (password) =>
              context.read<LoginCubit>().passwordChanged(password),
          hint: t.singInScreen.passwordTextField,
          obscureText: true,
          errorText: state.password.displayError != null
              ? t.formats.requiredField
              : null,
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
        return state.status.isInProgress
            ? const LoadingWidget()
            : SizedBox(
                width: MediaQuery.of(context).size.width,
                child: FilledButton(
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  onPressed: state.isValid
                      ? () => context.read<LoginCubit>().logInWithCredentials()
                      : null,
                  child: Text(t.singInScreen.logInButton),
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
        return SizedBox(
          width: MediaQuery.of(context).size.width,
          child: FilledButton(
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
            ),
            onPressed: () => context.read<LoginCubit>().logInAnonymously(),
            child: Text(t.singInScreen.guest),
          ),
        );
      },
    );
  }
}

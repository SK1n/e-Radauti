import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutterapperadauti/app/pages/sign_up/cubit/sign_up_cubit.dart';
import 'package:flutterapperadauti/app/utils/widgets/border_text_form_field.dart';
import 'package:flutterapperadauti/i18n/strings.g.dart';
import 'package:flutterapperadauti/utils/loading_widget.dart';
import 'package:formz/formz.dart';

class SignUpForm extends StatelessWidget {
  const SignUpForm({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<SignUpCubit, SignUpState>(
      listener: (context, state) {
        if (state.status.isSuccess) {
          Navigator.of(context).pop();
        } else if (state.status.isFailure) {
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(
              SnackBar(content: Text(state.errorMessage ?? 'Sign Up Failure')),
            );
        }
      },
      child: Column(
        children: [
          _EmailInput(),
          _UsernameInput(),
          _PhoneNumberInput(),
          _PasswordInput(),
          _ConfirmedPasswordInput(),
          _SignUpButton(),
        ],
      ),
    );
  }
}

class _EmailInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignUpCubit, SignUpState>(
      buildWhen: (previous, current) => previous.email != current.email,
      builder: (context, state) {
        return BorderTextFormField(
          onChanged: (email) => context.read<SignUpCubit>().emailChanged(email),
          keyboardType: TextInputType.emailAddress,
          hint: t.createAccount.emailTextField,
          errorText:
              state.email.displayError != null ? t.formats.invalidEmail : null,
        );
      },
    );
  }
}

class _ConfirmedPasswordInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignUpCubit, SignUpState>(
      buildWhen: (previous, current) =>
          previous.confirmedPassword != current.confirmedPassword,
      builder: (context, state) {
        return BorderTextFormField(
            obscureText: true,
            onChanged: (confirmedPassword) => context
                .read<SignUpCubit>()
                .confirmedPasswordChanged(confirmedPassword),
            errorText: state.confirmedPassword.displayError != null
                ? t.formats.confirmPassword
                : null,
            hint: t.createAccount.confirmPassword);
      },
    );
  }
}

class _PasswordInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignUpCubit, SignUpState>(
      buildWhen: (previous, current) => previous.password != current.password,
      builder: (context, state) {
        return BorderTextFormField(
          obscureText: true,
          onChanged: (password) =>
              context.read<SignUpCubit>().passwordChanged(password),
          errorText: state.password.displayError != null
              ? t.formats.strongerPassword
              : null,
          hint: t.createAccount.passwordTextField,
        );
      },
    );
  }
}

class _UsernameInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignUpCubit, SignUpState>(
      buildWhen: (previous, current) => previous.username != current.username,
      builder: (context, state) {
        return BorderTextFormField(
          onChanged: (username) =>
              context.read<SignUpCubit>().usernameChanged(username),
          hint: t.createAccount.usernameTextField,
          errorText: state.username.displayError != null
              ? t.formats.requiredField
              : null,
        );
      },
    );
  }
}

class _PhoneNumberInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignUpCubit, SignUpState>(
      buildWhen: (previous, current) =>
          previous.phoneNumber != current.phoneNumber,
      builder: (context, state) {
        return BorderTextFormField(
          keyboardType: TextInputType.phone,
          hint: t.createAccount.phoneNumberTextField,
          errorText: state.phoneNumber.displayError != null
              ? t.formats.invalidPhoneNumber
              : null,
          onChanged: (phoneNumber) =>
              context.read<SignUpCubit>().phoneNumberChanged(phoneNumber),
        );
      },
    );
  }
}

class _SignUpButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignUpCubit, SignUpState>(
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
                      ? () => context
                          .read<SignUpCubit>()
                          .createAccountWithEmailAndPassword()
                      : null,
                  child: Text(t.createAccount.createAccountButton),
                ),
              );
      },
    );
  }
}

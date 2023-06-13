import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutterapperadauti/app/i18n/strings.g.dart';
import 'package:flutterapperadauti/app/pages/forgot_password/cubit/forgot_password_cubit.dart';
import 'package:flutterapperadauti/app/utils/widgets/border_text_form_field.dart';
import 'package:flutterapperadauti/utils/loading_widget.dart';
import 'package:formz/formz.dart';

class ForgotPasswordForm extends StatelessWidget {
  final String? email;
  const ForgotPasswordForm(this.email, {super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<ForgotPasswordCubit, ForgotPasswordState>(
      listener: (context, state) {
        if (state.status.isFailure) {
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(
              SnackBar(
                content:
                    Text(state.errorMessage ?? 'Error sending reset email'),
              ),
            );
        } else if (state.status.isSuccess) {
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(
              const SnackBar(
                content: Text(
                    'We\'ve sent an email with steps to reset you\'r password'),
              ),
            );
          Navigator.of(context).pop();
        }
      },
      child: Column(
        children: [
          _EmailInput(email),
          _ResetPasswordButton(),
        ],
      ),
    );
  }
}

class _EmailInput extends StatelessWidget {
  final String? email;
  const _EmailInput(this.email);
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ForgotPasswordCubit, ForgotPasswordState>(
      buildWhen: (previous, current) => previous.email != current.email,
      builder: (context, state) {
        return BorderTextFormField(
          initialValue: email,
          onChanged: (email) =>
              context.read<ForgotPasswordCubit>().emailChanged(email),
          keyboardType: TextInputType.emailAddress,
          hint: t.forgotPassword.emailTextField,
          errorText:
              state.email.displayError != null ? t.formats.invalidEmail : null,
        );
      },
    );
  }
}

class _ResetPasswordButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ForgotPasswordCubit, ForgotPasswordState>(
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
                          .read<ForgotPasswordCubit>()
                          .sendPasswordResetEmail()
                      : null,
                  child: Text(t.forgotPassword.resetPasswordButton),
                ),
              );
      },
    );
  }
}

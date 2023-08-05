import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterapperadauti/app/pages/forgot_password/cubit/forgot_password_cubit.dart';
import 'package:flutterapperadauti/app/utils/app_constants.dart';
import 'package:flutterapperadauti/app/utils/widgets/loading_widget.dart';
import 'package:flutterapperadauti/gen/strings.g.dart';
import 'package:flutterapperadauti/app/form_inputs/form_inputs.dart';
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
                content: Text(state.errorMessage),
              ),
            );
        } else if (state.status.isSuccess) {
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(
              SnackBar(
                content: Text(
                  context.t.forgotPassword.emailSent,
                ),
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
      buildWhen: (previous, current) =>
          previous.form.email != current.form.email,
      builder: (context, state) {
        return Padding(
          padding: AppConstants.innerCardPadding,
          child: TextFormField(
            initialValue: email,
            onChanged: (email) =>
                context.read<ForgotPasswordCubit>().emailChanged(email),
            keyboardType: TextInputType.emailAddress,
            validator: (_) => state.form.email.displayError?.text(),
            decoration: InputDecoration(
              errorText:
                  state.form.isPure ? null : state.form.email.error?.text(),
              labelText: context.t.forgotPassword.emailTextField,
            ),
          ),
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
            : Container(
                padding: AppConstants.innerCardPadding,
                width: MediaQuery.of(context).size.width,
                child: FilledButton(
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  onPressed: state.form.isValid
                      ? () => context
                          .read<ForgotPasswordCubit>()
                          .sendPasswordResetEmail()
                      : null,
                  child: Text(context.t.forgotPassword.resetPasswordButton),
                ),
              );
      },
    );
  }
}

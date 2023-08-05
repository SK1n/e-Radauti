import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterapperadauti/app/pages/sign_up/cubit/sign_up_cubit.dart';
import 'package:flutterapperadauti/app/utils/app_constants.dart';
import 'package:flutterapperadauti/app/utils/widgets/loading_widget.dart';
import 'package:flutterapperadauti/app/form_inputs/form_inputs.dart';
import 'package:flutterapperadauti/gen/strings.g.dart';
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
              SnackBar(content: Text(state.errorMessage)),
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
      buildWhen: (previous, current) =>
          previous.form.email != current.form.email,
      builder: (context, state) {
        return Padding(
          padding: AppConstants.innerCardPadding,
          child: TextFormField(
            onChanged: (email) =>
                context.read<SignUpCubit>().emailChanged(email),
            keyboardType: TextInputType.emailAddress,
            validator: (_) => state.form.email.displayError?.text(),
            decoration: InputDecoration(
              errorText:
                  state.form.isPure ? null : state.form.email.error?.text(),
              labelText: context.t.createAccount.emailTextField,
            ),
          ),
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
          previous.form.confirmPassword != current.form.confirmPassword,
      builder: (context, state) {
        return Padding(
          padding: AppConstants.innerCardPadding,
          child: TextFormField(
            obscureText: true,
            onChanged: (confirmedPassword) => context
                .read<SignUpCubit>()
                .confirmedPasswordChanged(confirmedPassword),
            validator: (_) => state.form.confirmPassword.displayError?.text(),
            decoration: InputDecoration(
              errorText: state.form.isPure
                  ? null
                  : state.form.confirmPassword.error?.text(),
              labelText: context.t.createAccount.confirmPassword,
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
    return BlocBuilder<SignUpCubit, SignUpState>(
      buildWhen: (previous, current) =>
          previous.form.password != current.form.password,
      builder: (context, state) {
        return Padding(
          padding: AppConstants.innerCardPadding,
          child: TextFormField(
            obscureText: true,
            onChanged: (password) =>
                context.read<SignUpCubit>().passwordChanged(password),
            validator: (_) => state.form.password.displayError?.text(),
            decoration: InputDecoration(
              errorText:
                  state.form.isPure ? null : state.form.password.error?.text(),
              labelText: context.t.createAccount.passwordTextField,
            ),
          ),
        );
      },
    );
  }
}

class _UsernameInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignUpCubit, SignUpState>(
      buildWhen: (previous, current) => previous.form.name != current.form.name,
      builder: (context, state) {
        return Padding(
          padding: AppConstants.innerCardPadding,
          child: TextFormField(
            onChanged: (username) =>
                context.read<SignUpCubit>().usernameChanged(username),
            validator: (_) => state.form.name.displayError?.text(),
            decoration: InputDecoration(
              errorText:
                  state.form.isPure ? null : state.form.name.error?.text(),
              labelText: context.t.createAccount.usernameTextField,
            ),
          ),
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
          previous.form.phone != current.form.phone,
      builder: (context, state) {
        return Padding(
          padding: AppConstants.innerCardPadding,
          child: TextFormField(
            keyboardType: TextInputType.phone,
            onChanged: (phoneNumber) =>
                context.read<SignUpCubit>().phoneNumberChanged(phoneNumber),
            validator: (_) => state.form.phone.displayError?.text(),
            decoration: InputDecoration(
              errorText:
                  state.form.isPure ? null : state.form.phone.error?.text(),
              labelText: context.t.createAccount.phoneNumberTextField,
            ),
          ),
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
            : Container(
                padding: AppConstants.innerCardPadding,
                width: MediaQuery.of(context).size.width,
                child: FilledButton(
                  onPressed: state.form.isValid
                      ? () => context
                          .read<SignUpCubit>()
                          .createAccountWithEmailAndPassword()
                      : null,
                  child: Text(context.t.createAccount.createAccountButton),
                ),
              );
      },
    );
  }
}

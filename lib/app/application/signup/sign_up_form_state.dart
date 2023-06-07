part of 'sign_up_form_bloc.dart';

@freezed
abstract class SignUpFormState with _$SignUpFormState {
  factory SignUpFormState({
    required String email,
    required String password,
    required String name,
    required String phoneNumber,
    required bool showErrorMessage,
    required bool isSubmitting,
    required AuthFailureOrSuccess authFailureOrSuccess,
  }) = _SignInFormState;

  factory SignUpFormState.initial() => SignUpFormState(
        email: '',
        password: '',
        name: '',
        phoneNumber: '',
        showErrorMessage: false,
        isSubmitting: false,
        authFailureOrSuccess: const AuthFailureOrSuccess.none(),
      );
}

part of 'sign_in_form_bloc.dart';

@freezed
abstract class SignInFormState with _$SignInFormState {
  factory SignInFormState({
    required String email,
    required String password,
    required bool rememberMe,
    required bool showErrorMessage,
    required bool isSubmitting,
    required AuthFailureOrSuccess authFailureOrSuccess,
  }) = _SignInFormState;

  factory SignInFormState.initial() => SignInFormState(
        email: '',
        password: '',
        rememberMe: false,
        showErrorMessage: false,
        isSubmitting: false,
        authFailureOrSuccess: const AuthFailureOrSuccess.none(),
      );
}

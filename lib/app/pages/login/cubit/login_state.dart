part of 'login_cubit.dart';

@freezed
class LoginState with _$LoginState {
  const factory LoginState({
    @Default(LoginForm()) final LoginForm form,
    @Default(FormzSubmissionStatus.initial) final FormzSubmissionStatus status,
    @Default('') final String errorMessage,
  }) = _LoginState;
}

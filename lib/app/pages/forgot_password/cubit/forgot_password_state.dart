part of 'forgot_password_cubit.dart';

@freezed
class ForgotPasswordState with _$ForgotPasswordState {
  const factory ForgotPasswordState({
    @Default(ForgotPasswordForm()) ForgotPasswordForm form,
    @Default(FormzSubmissionStatus.initial) final FormzSubmissionStatus status,
    @Default('') final String errorMessage,
  }) = _ForgotPasswordState;
}

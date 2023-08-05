part of 'sign_up_cubit.dart';

@freezed
class SignUpState with _$SignUpState {
  const factory SignUpState({
    @Default(SignUpForm()) final SignUpForm form,
    @Default(FormzSubmissionStatus.initial) final FormzSubmissionStatus status,
    @Default('') final String errorMessage,
  }) = _SignUpState;
}

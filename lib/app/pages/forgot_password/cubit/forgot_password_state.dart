part of 'forgot_password_cubit.dart';

//TODO: change to use freezed
final class ForgotPasswordState extends Equatable {
  const ForgotPasswordState({
    this.email = const EmailInput.pure(),
    this.status = FormzSubmissionStatus.initial,
    this.isValid = false,
    this.errorMessage,
  });

  final EmailInput email;
  final FormzSubmissionStatus status;
  final bool isValid;
  final String? errorMessage;

  @override
  List<Object?> get props => [email, status, isValid, errorMessage];

  ForgotPasswordState copyWith({
    EmailInput? email,
    FormzSubmissionStatus? status,
    bool? isValid,
    String? errorMessage,
  }) =>
      ForgotPasswordState(
        email: email ?? this.email,
        status: status ?? this.status,
        isValid: isValid ?? this.isValid,
        errorMessage: errorMessage ?? this.errorMessage,
      );
}

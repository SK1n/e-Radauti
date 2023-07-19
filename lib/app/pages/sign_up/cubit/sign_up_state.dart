part of 'sign_up_cubit.dart';

final class SignUpState extends Equatable {
  const SignUpState({
    this.email = const EmailInput.pure(),
    this.password = const PasswordInput.pure(),
    this.username = const NameInput.pure(),
    this.phoneNumber = const PhoneInput.pure(),
    this.confirmedPassword = const ConfirmPasswordInput.pure(),
    this.status = FormzSubmissionStatus.initial,
    this.isValid = false,
    this.errorMessage,
  });

  final EmailInput email;
  final PasswordInput password;
  final NameInput username;
  final PhoneInput phoneNumber;
  final ConfirmPasswordInput confirmedPassword;
  final FormzSubmissionStatus status;
  final bool isValid;
  final String? errorMessage;

  @override
  List<Object?> get props => [
        email,
        password,
        username,
        phoneNumber,
        confirmedPassword,
        status,
        isValid,
        errorMessage
      ];

  SignUpState copyWith({
    EmailInput? email,
    PasswordInput? password,
    NameInput? username,
    PhoneInput? phoneNumber,
    ConfirmPasswordInput? confirmedPassword,
    FormzSubmissionStatus? status,
    bool? isValid,
    String? errorMessage,
  }) {
    return SignUpState(
      email: email ?? this.email,
      password: password ?? this.password,
      username: username ?? this.username,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      confirmedPassword: confirmedPassword ?? this.confirmedPassword,
      status: status ?? this.status,
      isValid: isValid ?? this.isValid,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}

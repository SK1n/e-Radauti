part of 'sign_up_cubit.dart';

final class SignUpState extends Equatable {
  const SignUpState({
    this.email = const Email.pure(),
    this.password = const PasswordSignUp.pure(),
    this.username = const Username.pure(),
    this.phoneNumber = const PhoneNumber.pure(),
    this.confirmedPassword = const ConfirmedPassword.pure(),
    this.status = FormzSubmissionStatus.initial,
    this.isValid = false,
    this.errorMessage,
  });

  final Email email;
  final PasswordSignUp password;
  final Username username;
  final PhoneNumber phoneNumber;
  final ConfirmedPassword confirmedPassword;
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
    Email? email,
    PasswordSignUp? password,
    Username? username,
    PhoneNumber? phoneNumber,
    ConfirmedPassword? confirmedPassword,
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

import 'package:formz/formz.dart';

/// Validation errors for the [Password] [FormzInput].
enum PasswordSignUpValidationError {
  /// Generic invalid error.
  invalid
}

/// {@template password}
/// Form input for an password input.
/// {@endtemplate}
class PasswordSignUp extends FormzInput<String, PasswordSignUpValidationError> {
  /// {@macro password}
  const PasswordSignUp.pure() : super.pure('');

  /// {@macro password}
  const PasswordSignUp.dirty([super.value = '']) : super.dirty();

  @override
  PasswordSignUpValidationError? validator(String? value) {
    if ('${value}'.length > 6) {
      return null;
    } else {
      return PasswordSignUpValidationError.invalid;
    }
  }
}

import 'package:formz/formz.dart';

/// Validation errors for the [Password] [FormzInput].
enum PasswordValidationError {
  /// Generic invalid error.
  invalid
}

/// {@template password}
/// Form input for an password input.
/// {@endtemplate}
class Password extends FormzInput<String, PasswordValidationError> {
  /// {@macro password}
  const Password.pure() : super.pure('');

  /// {@macro password}
  const Password.dirty([super.value = '']) : super.dirty();

  static final _passwordRegExp = RegExp(r'^[^\s]+$');

  @override
  PasswordValidationError? validator(String? value) {
    if (_passwordRegExp.hasMatch(value ?? '') && '${value}'.length > 6) {
      return null;
    } else {
      return PasswordValidationError.invalid;
    }
  }
}

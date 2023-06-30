import 'package:formz/formz.dart';

/// Validation errors for the [Email] [FormzInput].
enum DescriptionValidationError {
  /// Generic invalid error.
  invalid
}

/// {@template email}
/// Form input for an email input.
/// {@endtemplate}
class Description extends FormzInput<String, DescriptionValidationError> {
  /// {@macro email}
  const Description.pure() : super.pure('');

  /// {@macro email}
  const Description.dirty([super.value = '']) : super.dirty();

  @override
  DescriptionValidationError? validator(String? value) {
    return "$value".length > 50 ? null : DescriptionValidationError.invalid;
  }
}

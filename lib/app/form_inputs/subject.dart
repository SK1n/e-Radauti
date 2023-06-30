import 'package:formz/formz.dart';

/// Validation errors for the [Email] [FormzInput].
enum SubjectValidationError {
  /// Generic invalid error.
  invalid
}

/// {@template email}
/// Form input for an email input.
/// {@endtemplate}
class Subject extends FormzInput<String, SubjectValidationError> {
  /// {@macro email}
  const Subject.pure() : super.pure('');

  /// {@macro email}
  const Subject.dirty([super.value = '']) : super.dirty();

  @override
  SubjectValidationError? validator(String? value) {
    return "$value".isNotEmpty ? null : SubjectValidationError.invalid;
  }
}

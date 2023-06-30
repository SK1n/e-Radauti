import 'package:formz/formz.dart';

/// Validation errors for the [Dropdown] [FormzInput].
enum DropdownValidationError {
  /// Dropdown is empty error.
  invalid
}

/// {@template dropdown}
/// Form input for a dropdown.
/// {@endtemplate}
class Dropdown extends FormzInput<String, DropdownValidationError> {
  /// {@macro dropdown}
  const Dropdown.pure() : super.pure('');

  /// {@macro dropdown}
  const Dropdown.dirty(String value) : super.dirty(value);

  @override
  DropdownValidationError? validator(String? value) {
    return value?.isNotEmpty == true ? null : DropdownValidationError.invalid;
  }
}

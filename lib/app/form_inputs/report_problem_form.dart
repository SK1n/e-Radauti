import 'package:formz/formz.dart';

/// Generic validation errors for form inputs.
enum GenericValidationError {
  /// Generic invalid error.
  invalid,

  /// Value is required.
  required,

  /// Value does not meet the minimum length requirement.
  minLength,

  /// Value does not match the specified pattern.
  pattern,

  /// Value is not in email format.
  email,
}

/// Generic form input class.
class GenericInput<T> extends FormzInput<T, GenericValidationError> {
  /// Generic form input class constructor.
  const GenericInput.pure(T value) : super.pure(value);

  /// Generic form input class constructor for a dirty input.
  const GenericInput.dirty(T value) : super.dirty(value);

  @override
  GenericValidationError? validator(T? value) {
    if (value == null || value.toString().isEmpty) {
      return GenericValidationError.required;
    }
    return null;
  }

  /// Email format validator.
  GenericValidationError? emailValidator(String? value) {
    if (value != null && value.isNotEmpty) {
      final emailRegex = RegExp(
          r'^[\w-]+(\.[\w-]+)*@[a-zA-Z0-9-]+(\.[a-zA-Z0-9-]+)*(\.[a-zA-Z]{2,})$');
      if (!emailRegex.hasMatch(value)) {
        return GenericValidationError.email;
      }
    }
    return null;
  }
}

/// Subject form input class.
class Subject extends GenericInput<String> {
  /// Subject form input class constructor.
  const Subject.pure() : super.pure('');

  /// Subject form input class constructor for a dirty input.
  const Subject.dirty(String value) : super.dirty(value);
}

/// Description form input class.
class Description extends GenericInput<String> {
  /// Description form input class constructor.
  const Description.pure() : super.pure('');

  /// Description form input class constructor for a dirty input.
  const Description.dirty(String value) : super.dirty(value);

  @override
  GenericValidationError? validator(String? value) {
    if (value == null || value.isEmpty) {
      return GenericValidationError.required;
    }
    if (value.length < 50) {
      return GenericValidationError.minLength;
    }
    return null;
  }
}

/// Institution form input class.
class Institution extends GenericInput<String> {
  /// Institution form input class constructor.
  const Institution.pure() : super.pure('');

  /// Institution form input class constructor for a dirty input.
  const Institution.dirty(String value) : super.dirty(value);
}

/// Category form input class.
class Category extends GenericInput<String> {
  /// Category form input class constructor.
  const Category.pure() : super.pure('');

  /// Category form input class constructor for a dirty input.
  const Category.dirty(String value) : super.dirty(value);
}

/// Phone number form input class.
class PhoneNumber extends GenericInput<String> {
  /// Phone number form input class constructor.
  const PhoneNumber.pure() : super.pure('');

  /// Phone number form input class constructor for a dirty input.
  const PhoneNumber.dirty(String value) : super.dirty(value);

  @override
  GenericValidationError? validator(String? value) {
    if (value == null || value.isEmpty) {
      return GenericValidationError.required;
    }
    final regex = RegExp(
        r'^(\+4|)?(07[0-8]{1}[0-9]{1}|02[0-9]{2}|03[0-9]{2}){1}?(\s|\.|\-)?([0-9]{3}(\s|\.|\-|)){2}$');
    if (!regex.hasMatch(value)) {
      return GenericValidationError.pattern;
    }
    return null;
  }
}

/// Username form input class.
class Username extends GenericInput<String> {
  /// Username form input class constructor.
  const Username.pure() : super.pure('');

  /// Username form input class constructor for a dirty input.
  const Username.dirty(String value) : super.dirty(value);

  @override
  GenericValidationError? validator(String? value) {
    if (value == null || value.isEmpty) {
      return GenericValidationError.required;
    }
    return null;
  }
}

/// Email form input class.
class Email extends GenericInput<String> {
  /// Email form input class constructor.
  const Email.pure() : super.pure('');

  /// Email form input class constructor for a dirty input.
  const Email.dirty(String value) : super.dirty(value);

  @override
  GenericValidationError? validator(String? value) {
    if (value == null || value.isEmpty) {
      return GenericValidationError.required;
    }
    return emailValidator(value);
  }
}

/// Image Picker form input class.
class ImagePicker extends GenericInput<List<dynamic>?> {
  /// Email form input class constructor.
  ImagePicker.pure() : super.pure([]);

  /// Email form input class constructor for a dirty input.
  const ImagePicker.dirty(List<dynamic>? value) : super.dirty(value);

  @override
  GenericValidationError? validator(List<dynamic>? value) {
    if (value == null || value.isEmpty) {
      return GenericValidationError.required;
    }
    return null;
  }
}

import 'package:flutterapperadauti/gen/strings.g.dart';
import 'package:formz/formz.dart';

enum FormInputError {
  /// Generic invalid error.
  invalid,

  /// Value is required.
  required,

  /// Value does not meet the minimum length requirement.
  minLength50,

  /// Min Length password
  minLengthPassword,

  passwordMismatch,

  /// Value does not match the specified pattern.
  pattern,

  /// Value is not in email format.
  email,

  /// Value is not in a phone number format
  phone,
}

class EmailInput extends FormzInput<String, FormInputError> {
  const EmailInput.pure() : super.pure('');
  const EmailInput.dirty(super.value) : super.dirty();

  static final regex = RegExp(
      r'^[\w-]+(\.[\w-]+)*@[a-zA-Z0-9-]+(\.[a-zA-Z0-9-]+)*(\.[a-zA-Z]{2,})$');

  @override
  FormInputError? validator(String value) {
    if (value.isEmpty) {
      return FormInputError.required;
    }
    if (!regex.hasMatch(value)) {
      return FormInputError.email;
    }
    return null;
  }
}

class NameInput extends FormzInput<String, FormInputError> {
  const NameInput.pure() : super.pure('');
  const NameInput.dirty(super.value) : super.dirty();
  @override
  FormInputError? validator(String value) {
    if (value.isEmpty) {
      return FormInputError.required;
    }
    return null;
  }
}

class PhoneInput extends FormzInput<String, FormInputError> {
  const PhoneInput.pure() : super.pure('');
  const PhoneInput.dirty(super.value) : super.dirty();

  static final regex = RegExp(
      r'^(\+4|)?(07[0-8]{1}[0-9]{1}|02[0-9]{2}|03[0-9]{2}){1}?(\s|\.|\-)?([0-9]{3}(\s|\.|\-|)){2}$');

  @override
  FormInputError? validator(String value) {
    if (value.isEmpty) {
      return FormInputError.required;
    }
    if (!regex.hasMatch(value)) {
      return FormInputError.phone;
    }
    return null;
  }
}

class CategoryInput extends FormzInput<String, FormInputError> {
  const CategoryInput.pure() : super.pure('');
  const CategoryInput.dirty(super.value) : super.dirty();

  @override
  FormInputError? validator(String? value) {
    if (value == null || value.isEmpty) {
      return FormInputError.required;
    }
    return null;
  }
}

class InstitutionInput extends FormzInput<String, FormInputError> {
  const InstitutionInput.pure() : super.pure('');
  const InstitutionInput.dirty(super.value) : super.dirty();

  @override
  FormInputError? validator(String? value) {
    if (value == null || value.isEmpty) {
      return FormInputError.required;
    }
    return null;
  }
}

class SubjectInput extends FormzInput<String, FormInputError> {
  const SubjectInput.pure() : super.pure('');
  const SubjectInput.dirty(super.value) : super.dirty();

  @override
  FormInputError? validator(String value) {
    if (value.isEmpty) {
      return FormInputError.required;
    }
    return null;
  }
}

class DescriptionInput extends FormzInput<String, FormInputError> {
  const DescriptionInput.pure() : super.pure('');
  const DescriptionInput.dirty(super.value) : super.dirty();

  @override
  FormInputError? validator(String value) {
    if (value.length < 50) {
      return FormInputError.minLength50;
    }
    if (value.isEmpty) {
      return FormInputError.required;
    }
    return null;
  }
}

class LocationInput extends FormzInput<bool, FormInputError> {
  const LocationInput.pure() : super.pure(false);
  const LocationInput.dirty(super.value) : super.dirty();

  @override
  FormInputError? validator(bool value) {
    return null;
  }
}

class ImageInput extends FormzInput<List<dynamic>, FormInputError> {
  ImageInput.pure() : super.pure([]);
  const ImageInput.dirty(super.value) : super.dirty();

  @override
  FormInputError? validator(List<dynamic> value) {
    if (value.isEmpty) {
      return FormInputError.required;
    }
    return null;
  }
}

class PasswordInput extends FormzInput<String, FormInputError> {
  const PasswordInput.pure() : super.pure('');
  const PasswordInput.dirty(super.value) : super.dirty();

  @override
  FormInputError? validator(String value) {
    if (value.length < 6) {
      return FormInputError.minLengthPassword;
    }
    if (value.isEmpty) {
      return FormInputError.required;
    }
    return null;
  }
}

class ConfirmPasswordInput extends FormzInput<String, FormInputError> {
  const ConfirmPasswordInput.pure({this.password = ''}) : super.pure('');
  const ConfirmPasswordInput.dirty({required this.password, String value = ''})
      : super.dirty(value);

  final String password;

  @override
  FormInputError? validator(String value) {
    if (value != password) {
      return FormInputError.passwordMismatch;
    }
    if (value.isEmpty) {
      return FormInputError.required;
    }
    return null;
  }
}

extension GetErrorText on FormInputError {
  String text() {
    switch (this) {
      case FormInputError.required:
        return t.formats.requiredField;
      case FormInputError.email:
        return t.formats.invalidEmail;
      case FormInputError.minLength50:
        return t.formats.minimum50;
      case FormInputError.minLengthPassword:
        return t.formats.strongerPassword;
      case FormInputError.phone:
        return t.formats.invalidPhoneNumber;
      case FormInputError.passwordMismatch:
        return t.formats.confirmPassword;
      default:
        return '';
    }
  }
}

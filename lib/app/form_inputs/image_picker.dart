import 'package:formz/formz.dart';

/// Validation errors for the [Email] [FormzInput].
enum ImagePickerValidationError {
  /// Generic invalid error.
  invalid
}

/// {@template email}
/// Form input for an email input.
/// {@endtemplate}
class ImagePicker extends FormzInput<String, ImagePickerValidationError> {
  /// {@macro email}
  const ImagePicker.pure() : super.pure('');

  /// {@macro email}
  const ImagePicker.dirty([super.value = '']) : super.dirty();

  @override
  ImagePickerValidationError? validator(String? value) {
    return value?.isNotEmpty == true
        ? null
        : ImagePickerValidationError.invalid;
  }
}

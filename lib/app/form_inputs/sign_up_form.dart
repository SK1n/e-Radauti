import 'package:flutterapperadauti/app/form_inputs/form_inputs.dart';
import 'package:formz/formz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'sign_up_form.freezed.dart';

@freezed
class SignUpForm with _$SignUpForm, FormzMixin {
  const factory SignUpForm({
    @Default(EmailInput.pure()) final EmailInput email,
    @Default(NameInput.pure()) final NameInput name,
    @Default(PhoneInput.pure()) final PhoneInput phone,
    @Default(PasswordInput.pure()) final PasswordInput password,
    @Default(ConfirmPasswordInput.pure())
    final ConfirmPasswordInput confirmPassword,
  }) = _SignUpForm;

  const SignUpForm._();

  @override
  List<FormzInput> get inputs => [
        email,
        name,
        phone,
        password,
        confirmPassword,
      ];
}

import 'package:flutterapperadauti/app/form_inputs/form_inputs.dart';
import 'package:formz/formz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'login_form.freezed.dart';

@freezed
class LoginForm with _$LoginForm, FormzMixin {
  const factory LoginForm({
    @Default(EmailInput.pure()) final EmailInput email,
    @Default(PasswordInput.pure()) final PasswordInput password,
  }) = _LoginForm;

  const LoginForm._();

  @override
  List<FormzInput> get inputs => [email, password];
}

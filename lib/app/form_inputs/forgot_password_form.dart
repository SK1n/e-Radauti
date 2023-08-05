import 'package:flutterapperadauti/app/form_inputs/form_inputs.dart';
import 'package:formz/formz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'forgot_password_form.freezed.dart';

@freezed
class ForgotPasswordForm with _$ForgotPasswordForm, FormzMixin {
  const factory ForgotPasswordForm({
    @Default(EmailInput.pure()) final EmailInput email,
  }) = _ForgotPasswordForm;

  const ForgotPasswordForm._();

  @override
  List<FormzInput> get inputs => [
        email,
      ];
}

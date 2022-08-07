import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutterapperadauti/utils/error_texts.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

class EmailTextField extends StatelessWidget {
  const EmailTextField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FormBuilderTextField(
        decoration: InputDecoration(hintText: 'Email'),
        name: 'email',
        initialValue: '',
        onChanged: (value) {
          //noticeFormState.upEmail(value);
        },
        validator: FormBuilderValidators.compose(
          [
            FormBuilderValidators.required(errorText: errorRequired),
            FormBuilderValidators.email(errorText: errorEmail),
          ],
        ));
  }
}

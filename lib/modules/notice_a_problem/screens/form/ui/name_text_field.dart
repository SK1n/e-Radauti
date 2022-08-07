import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutterapperadauti/utils/error_texts.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

class NameTextField extends StatelessWidget {
  const NameTextField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FormBuilderTextField(
      decoration: InputDecoration(hintText: 'Nume și prenume'),
      initialValue: '',
      name: 'name',
      autovalidateMode: AutovalidateMode.onUserInteraction,
      validator: FormBuilderValidators.compose(
          [FormBuilderValidators.required(errorText: errorRequired)]),
    );
  }
}

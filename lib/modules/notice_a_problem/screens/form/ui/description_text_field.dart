import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutterapperadauti/utils/error_texts.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

class DescriptionTextField extends StatelessWidget {
  const DescriptionTextField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FormBuilderTextField(
        decoration: InputDecoration(
          hintText: 'description',
        ),
        maxLines: 5,
        initialValue: '',
        name: 'description',
        onChanged: (value) {
          // noticeFormState.upDescription(value);
        },
        validator: FormBuilderValidators.compose(
          [
            FormBuilderValidators.required(errorText: errorRequired),
            FormBuilderValidators.minLength(50,
                errorText: 'Trebuie sa introduceti minimum 50 charactere'),
          ],
        ));
  }
}

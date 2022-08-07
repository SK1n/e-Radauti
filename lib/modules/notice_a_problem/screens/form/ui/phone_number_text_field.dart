import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutterapperadauti/utils/error_texts.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

class PhoneNumberTextField extends StatelessWidget {
  const PhoneNumberTextField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FormBuilderTextField(
        decoration: InputDecoration(hintText: 'Număr de telefon'),
        name: 'phone',
        // initialValue: noticeFormState.phoneNumber,
        // onChanged: (value) {
        //   noticeFormState.upPhoneNumber(value);
        // },
        keyboardType: TextInputType.number,
        validator: FormBuilderValidators.compose(
          [
            FormBuilderValidators.required(errorText: errorRequired),
            FormBuilderValidators.numeric(
                errorText: 'Acest camp trebuie sa contina numai numere!'),
            FormBuilderValidators.match(
                r'^(\+4|)?(07[0-8]{1}[0-9]{1}|02[0-9]{2}|03[0-9]{2}){1}?(\s|\.|\-)?([0-9]{3}(\s|\.|\-|)){2}$',
                errorText: errorPhonePattern),
          ],
        ));
  }
}

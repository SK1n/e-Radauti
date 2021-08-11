import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutterapperadauti/state/notice_problem_notifier.dart';
import 'package:flutterapperadauti/strings/form.dart';
import 'package:provider/provider.dart';

class PhoneNumberTextField extends StatelessWidget {
  const PhoneNumberTextField({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    NoticeFormState noticeFormState =
        Provider.of<NoticeFormState>(context, listen: false);
    return FormBuilderTextField(
        decoration: InputDecoration(hintText: 'Număr de telefon'),
        name: 'number',
        initialValue: noticeFormState.phoneNumber,
        onChanged: (value) {
          noticeFormState.upPhoneNumber(value);
        },
        keyboardType: TextInputType.number,
        validator: FormBuilderValidators.compose(
          [
            FormBuilderValidators.required(context, errorText: errorRequired),
            FormBuilderValidators.numeric(context,
                errorText: 'Acest camp trebuie sa contina numai numere!'),
            FormBuilderValidators.match(context,
                r'^(\+4|)?(07[0-8]{1}[0-9]{1}|02[0-9]{2}|03[0-9]{2}){1}?(\s|\.|\-)?([0-9]{3}(\s|\.|\-|)){2}$',
                errorText: errorPhonePattern),
          ],
        ));
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutterapperadauti/state/notice_problem_notifier.dart';
import 'package:flutterapperadauti/strings/form.dart';
import 'package:provider/provider.dart';

class EmailTextField extends StatelessWidget {
  const EmailTextField({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    NoticeFormState noticeFormState =
        Provider.of<NoticeFormState>(context, listen: false);
    return FormBuilderTextField(
        decoration: InputDecoration(hintText: 'Email'),
        name: 'email',
        initialValue: noticeFormState.email,
        onChanged: (value) {
          noticeFormState.upEmail(value);
        },
        validator: FormBuilderValidators.compose(
          [
            FormBuilderValidators.required(context, errorText: errorRequired),
            FormBuilderValidators.email(context, errorText: errorEmail),
          ],
        ));
  }
}

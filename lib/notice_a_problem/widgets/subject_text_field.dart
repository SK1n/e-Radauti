import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutterapperadauti/state/notice_problem_state.dart';
import 'package:flutterapperadauti/strings/form.dart';
import 'package:provider/provider.dart';

class SubjectTextField extends StatelessWidget {
  const SubjectTextField({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    NoticeFormState noticeFormState = Provider.of<NoticeFormState>(context);
    return FormBuilderTextField(
        decoration: InputDecoration(hintText: 'Subiect'),
        name: 'subject',
        initialValue: noticeFormState.subject,
        onChanged: (value) {
          noticeFormState.upSubject(value);
        },
        validator: FormBuilderValidators.compose(
          [
            FormBuilderValidators.required(context, errorText: errorRequired),
          ],
        ));
  }
}

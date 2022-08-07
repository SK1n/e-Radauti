import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutterapperadauti/utils/error_texts.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

class SubjectTextField extends StatelessWidget {
  const SubjectTextField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // NoticeFormState noticeFormState = Provider.of<NoticeFormState>(context);
    return FormBuilderTextField(
      decoration: InputDecoration(hintText: 'Subiect'),
      name: 'subject',
      // initialValue: noticeFormState.subject,
      // onChanged: (value) {
      //   noticeFormState.upSubject(value);
      // },
      validator: FormBuilderValidators.compose(
        [
          FormBuilderValidators.required(errorText: errorRequired),
        ],
      ),
    );
  }
}

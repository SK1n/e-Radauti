import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutterapperadauti/state/notice_problem_state.dart';
import 'package:flutterapperadauti/strings/form.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:provider/provider.dart';

class NameTextField extends StatelessWidget {
  const NameTextField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    NoticeFormState noticeFormState = Provider.of<NoticeFormState>(context);
    return FormBuilderTextField(
      decoration: InputDecoration(hintText: 'Nume și prenume'),
      initialValue: noticeFormState.name,
      name: 'name',
      onChanged: (value) => noticeFormState.upName(value),
      validator: FormBuilderValidators.compose(
          [FormBuilderValidators.required(errorText: errorRequired)]),
    );
  }
}

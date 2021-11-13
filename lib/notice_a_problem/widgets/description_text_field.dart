import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutterapperadauti/state/notice_problem_state.dart';
import 'package:flutterapperadauti/strings/form.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:provider/provider.dart';

class DescriptionTextField extends StatelessWidget {
  const DescriptionTextField({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    NoticeFormState noticeFormState =
        Provider.of<NoticeFormState>(context, listen: false);
    return FormBuilderTextField(
        decoration: InputDecoration(hintText: 'Descriere'),
        maxLines: 5,
        initialValue: noticeFormState.description,
        name: 'description',
        onChanged: (value) {
          noticeFormState.upDescription(value);
        },
        validator: FormBuilderValidators.compose(
          [
            FormBuilderValidators.required(context, errorText: errorRequired),
            FormBuilderValidators.minLength(context, 150,
                errorText: 'Trebuie sa introduceti minimum 150 charactere'),
          ],
        ));
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutterapperadauti/utils/error_texts.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

class InstitutionDropDown extends StatelessWidget {
  const InstitutionDropDown({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List list = [
      'Primăria Rădăuți',
      'Servicii Comunale',
      'ACET Rădăuți',
      'Consiliul Județean Suceava',
      'Garda De Mediu Suceava',
      'Garda Forestieră Suceava',
      'Ocolul Silvic Marginea',
      'DSP Suceava',
      'Asociația Rădăuțiul Civic',
    ];
    //NoticeFormState noticeFormState = Provider.of(context);
    return FormBuilderDropdown(
      name: 'institution_email',
      hint: Text('Selecteaza o institutie'),
      validator: FormBuilderValidators.compose(
          [FormBuilderValidators.required(errorText: errorRequired)]),
      items: list
          .map((emailDestination) => DropdownMenuItem(
                value: emailDestination,
                child: Text('$emailDestination'),
              ))
          .toList(),
    );
  }
}

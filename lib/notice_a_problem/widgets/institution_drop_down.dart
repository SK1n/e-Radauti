import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutterapperadauti/state/notice_problem_state.dart';
import 'package:flutterapperadauti/strings/form.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:provider/provider.dart';

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
    NoticeFormState noticeFormState = Provider.of(context);
    return FormBuilderDropdown(
      name: 'destinationEmail',
      initialValue: noticeFormState.institution,
      onChanged: (value) {
        noticeFormState.upInstitution(value.toString());
        debugPrint('${noticeFormState.institution}');
        noticeFormState.upInstitutionEmail(emailDestination(value.toString()));
      },
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

  String emailDestination(String value) {
    switch (value) {
      case "Primăria Rădăuți":
        return "relatiipublice@primariaradauti.ro";

      case "Servicii Comunale":
        return "office@serviciicomunale.ro";

      case "ACET Rădăuți":
        return "agentia.radauti@acetsv.ro";

      case "Consiliul Județean Suceava":
        return "contact@cjsuceava.ro";

      case "Garda De Mediu Suceava":
        return "cjsuceava@gnm.ro";

      case "Garda Forestieră Suceava":
        return "gardaforestiera.suceava@gmail.com";

      case "DSP Suceava":
        return "dspsv@dspsv.ro";

      case "Ocolul Silvic Marginea":
        return "marginea@suceava.rosilva.ro";

      case "Asociația Rădăuțiul Civic":
        return "radautiulcivic@gmail.com";

      default:
        return '';
    }
  }
}

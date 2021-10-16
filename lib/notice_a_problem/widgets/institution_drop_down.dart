import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutterapperadauti/state/notice_problem_state.dart';
import 'package:provider/provider.dart';

class InstitutionDropDown extends StatelessWidget {
  const InstitutionDropDown({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List list = [
      'Institutia',
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
      initialValue: 'Institutia',
      name: 'destinationEmail',
      onChanged: (value) {
        noticeFormState.upInstitution(value);
        debugPrint('${noticeFormState.institution}');
        noticeFormState.upInstitutionEmail(emailDestination(value));
      },
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
      case "Institutia":
        return null;
        break;
      case "Primăria Rădăuți":
        return "relatiipublice@primariaradauti.ro";
        break;
      case "Servicii Comunale":
        return "office@serviciicomunale.ro";
        break;
      case "ACET Rădăuți":
        return "agentia.radauti@acetsv.ro";
        break;
      case "Consiliul Județean Suceava":
        return "contact@cjsuceava.ro";
        break;
      case "Garda De Mediu Suceava":
        return "cjsuceava@gnm.ro";
        break;
      case "Garda Forestieră Suceava":
        return "gardaforestiera.suceava@gmail.com";
        break;
      case "DSP Suceava":
        return "dspsv@dspsv.ro";
        break;
      case "Ocolul Silvic Marginea":
        return "marginea@suceava.rosilva.ro";
        break;
      case "Asociația Rădăuțiul Civic":
        return "radautiulcivic@gmail.com";
        break;
      default:
        return null;
    }
  }
}

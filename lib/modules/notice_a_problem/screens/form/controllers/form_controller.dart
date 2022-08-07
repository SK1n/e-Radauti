import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';

class NoticeProblemController extends GetxController {
  final GlobalKey<FormBuilderState> formKey = new GlobalKey();
  dynamic useLocation = false.obs;
  List<dynamic> imageLinks = [];

  void addImageLink(value) async {
    imageLinks.add(value);
  }

  String getInstitutionEmail(String? value) {
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
        return "";
    }
  }
}

import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutterapperadauti/controllers/location_controller.dart';
import 'package:flutterapperadauti/utils/helpers/display_error.dart';
import 'package:flutterapperadauti/utils/helpers/upload_to_firebase.dart';
import 'package:get/get.dart';

class NoticeProblemController extends GetxController
    with DisplayError, UploadToFirebase {
  final GlobalKey<FormBuilderState> formKey = GlobalKey();
  final LocationController _locationController = Get.find<LocationController>();
  dynamic useLocation = false.obs;
  List<String> imageLinks = [];

  List categoryDropDownList = [
    ['Altele'],
    ['Gunoi neridicat'],
    ['Infrastructură'],
    ['Probleme la utilitati'],
    ['Constructii ilegale'],
    ['Siguranta'],
    ['Calitatea aerului si poluare'],
  ];

  List institutionDropDownList = [
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

  String? getInstitutionEmail(String? value) {
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
        return null;
    }
  }

  bool validate() {
    return kDebugMode ? true : formKey.currentState!.validate();
  }

  Future prepareDataAndUpload() async {
    if (validate()) {
      formKey.currentState!.save();
      try {
        await Future.forEach(
          formKey.currentState!.fields['ImagePicker']?.value,
          (element) async => imageLinks.add(
            await uploadImageToFirebase(
              path: 'Notice_A_Problem',
              file: element,
            ),
          ),
        );
        debugPrint('list: $imageLinks');
        String data = await createData();
        await uploadDataToFirebase(
          collection: kDebugMode ? 'test' : 'collection',
          document: 'Markers',
          array: 'markers',
          data: data,
        ).whenComplete(() {
          formKey.currentState!.reset();
          imageLinks = [];
          useLocation.value = false;
        });
      } catch (e) {
        displayError(e);
      }
    }
  }

  Future<String> createData() async {
    //return NoticeProblemMapMarkerModel.toJson()
    String json = jsonEncode([
      {
        "category": formKey.currentState!.fields['category']?.value ?? '',
        "description": formKey.currentState!.fields['description']?.value ?? '',
        "index":
            _getIndex(formKey.currentState!.fields['category']?.value) ?? '',
        "institution":
            formKey.currentState!.fields['institution_email']?.value ?? '',
        "institution_email": getInstitutionEmail(
                formKey.currentState?.fields['institution_email']?.value) ??
            '',
        "lat":
            useLocation.value ? await _locationController.getLatitute() : null,
        "long":
            useLocation.value ? await _locationController.getLongitude() : null,
        "status": "În lucru",
        "subject": formKey.currentState!.fields['subject']?.value ?? '',
        "email": formKey.currentState!.fields['email']?.value ?? '',
        "name": formKey.currentState!.fields['name']?.value ?? '',
        "url": imageLinks,
        "phone": formKey.currentState!.fields['phone']?.value ?? '',
      },
    ]);
    return json;
  }

  _getIndex(String? value) {
    switch (value) {
      case 'Altele':
        return 0;

      case 'Gunoi neridicat':
        return 1;

      case 'Infrastructură':
        return 2;

      case 'Probleme la utilitati':
        return 3;

      case 'Constructii ilegale':
        return 4;

      case 'Siguranta':
        return 5;

      case 'Calitatea aerului si poluare':
        return 6;

      default:
        return 0;
    }
  }
}

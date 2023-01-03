import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutterapperadauti/controllers/location_controller.dart';
import 'package:flutterapperadauti/utils/helpers/upload_to_firebase.dart';
import 'package:get/get.dart';

class NoticeProblemController extends GetxController with UploadToFirebase {
  final GlobalKey<FormBuilderState> formKey = GlobalKey();
  final LocationController _locationController = Get.find<LocationController>();
  dynamic useLocation = false.obs;
  List<String> imageLinks = [];

  List<DropdownMenuItem> dropdowns = [
    DropdownMenuItem(
      value: {
        "email": "relatiipublice@primariaradauti.ro",
        "text": "radauti-city-hall".tr,
      },
      child: Text("radauti-city-hall".tr),
    ),
    DropdownMenuItem(
      value: {
        "email": "office@serviciicomunale.ro",
        "text": "comunal-services".tr,
      },
      child: Text("comunal-services".tr),
    ),
    DropdownMenuItem(
      value: {
        "email": "agentia.radauti@acetsv.ro",
        "text": 'acet-radauti'.tr,
      },
      child: Text('acet-radauti'.tr),
    ),
    DropdownMenuItem(
      value: {
        "email": "contact@cjsuceava.ro",
        "text": 'suceava-county-council'.tr,
      },
      child: Text('suceava-county-council'.tr),
    ),
    DropdownMenuItem(
      value: {
        "email": "cjsuceava@gnm.ro",
        "text": 'suceava-environmental-guard'.tr,
      },
      child: Text('suceava-environmental-guard'.tr),
    ),
    DropdownMenuItem(
      value: {
        "email": "gardaforestiera.suceava@gmail.com",
        "text": 'suceava-forest-guard'.tr,
      },
      child: Text('suceava-forest-guard'.tr),
    ),
    DropdownMenuItem(
      value: {
        "email": "dspsv@dspsv.ro",
        "text": 'dsp-suceava'.tr,
      },
      child: Text('dsp-suceava'.tr),
    ),
    DropdownMenuItem(
      value: {
        "email": "marginea@suceava.rosilva.ro",
        "text": 'ocolul-silvic-marginea'.tr,
      },
      child: Text('ocolul-silvic-marginea'.tr),
    ),
    DropdownMenuItem(
      value: {
        "email": "radautiulcivic@gmail.com",
        "text": 'radautiul-civic-association'.tr,
      },
      child: Text('radautiul-civic-association'.tr),
    ),
  ];

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
        Get.showSnackbar(
          GetSnackBar(
            title: 'A intervenit o eroare',
            message: e.toString(),
            duration: const Duration(seconds: 5),
          ),
        );
      }
    }
  }

  Future<String> createData() async {
    var fields = formKey.currentState!;
    String json = jsonEncode([
      {
        "category": fields.fields['category']?.value ?? '',
        "description": fields.fields['description']?.value ?? '',
        "index": category.indexOf(fields.fields['category']?.value),
        "institution": fields.fields['institution_email']?.value["text"] ?? '',
        "institution_email":
            fields.fields['institution_email']?.value["email"] ?? '',
        "lat":
            useLocation.value ? await _locationController.getLatitute() : null,
        "long":
            useLocation.value ? await _locationController.getLongitude() : null,
        "status": "În lucru",
        "subject": fields.fields['subject']?.value ?? '',
        "email": fields.fields['email']?.value ?? '',
        "name": fields.fields['name']?.value ?? '',
        "url": imageLinks,
        "phone": fields.fields['phone']?.value ?? '',
      },
    ]);
    debugPrint(json);
    return json;
  }

  List<String> category = [
    'other'.tr,
    'uncollected-garbage'.tr,
    'infrastructure'.tr,
    'utilities-problems'.tr,
    'illegal-constructions'.tr,
    'safety'.tr,
    'air-quality-pollution'.tr,
  ];
}

import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutterapperadauti/controllers/location_controller.dart';
import 'package:flutterapperadauti/utils/base_controller.dart';
import 'package:fluttericon/entypo_icons.dart';
import 'package:fluttericon/font_awesome5_icons.dart';
import 'package:fluttericon/octicons_icons.dart';
import 'package:get/get.dart';
import 'package:latlong2/latlong.dart' as latLng;

import '../../../data/models/notice_problem_map/markers_model.dart';
import '../../../data/models/notice_problem_map/notice_problem_map_marker_model.dart';

class ReportProblemController extends BaseController {
  final GlobalKey<FormBuilderState> formKey = GlobalKey();
  final LocationController _locationController = Get.find<LocationController>();
  dynamic useLocation = false.obs;
  List<String> imageLinks = [];
  List<Marker> markerList = [];
  NoticeProblemMapMarkerModel? markersModel;

  final Map<String, String> dropDown = {
    'relatiipublice@primariaradauti.ro': 'radauti-city-hall',
    'office@serviciicomunale.ro': 'comunal-services',
    'agentia.radauti@acetsv.ro': 'acet-radauti',
    'contact@cjsuceava.ro': 'suceava-county-council',
    'cjsuceava@gnm.ro': 'suceava-environmental-guard',
    'gardaforestiera.suceava@gmail.com': 'suceava-forest-guard',
    'dspsv@dspsv.ro': 'dsp-suceava',
    'marginea@suceava.rosilva.ro': 'ocolul-silvic-marginea',
    'radautiulcivic@gmail.com': 'radautiul-civic-association',
  };

  List<String> category = [
    'infrastructure'.tr,
    'utilities-problems'.tr,
    'uncollected-garbage'.tr,
    'infrastructure-streets'.tr,
    'illegal-constructions'.tr,
    'air-quality-pollution'.tr,
    'safety'.tr,
    'other'.tr,
  ];

  final Map<int, IconData> icon = {
    0: Entypo.dot_3,
    1: Entypo.trash,
    2: FontAwesome5.road,
    3: Entypo.lamp,
    4: Entypo.home,
    5: Octicons.shield_check,
    6: Icons.blur_circular
  };

  Future prepareDataAndUpload() async {
    if (!formKey.currentState!.validate()) {
      return;
    }
    formKey.currentState!.save();
    try {
      await Future.forEach(
        formKey.currentState!.fields['ImagePicker']?.value,
        (element) async => imageLinks.add(
          await fireRepo.uploadImageToFirebase(
            path: 'Notice_A_Problem',
            file: element,
          ),
        ),
      );
      await fireRepo.uploadDataToFirebase(
        collection: kDebugMode ? 'test' : 'collection',
        document: 'Markers',
        array: 'markers',
        data: await createData(),
      );
      formKey.currentState!.reset();
      imageLinks = [];
      useLocation.value = false;
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

  Future<String> createData() async {
    var form = formKey.currentState!;
    String json = jsonEncode([
      {
        "category": form.fields['category']?.value ?? '',
        "description": form.fields['description']?.value ?? '',
        "index": category.indexOf(form.fields['category']?.value),
        "institution": form.fields['institution_email']?.value["text"] ?? '',
        "institution_email":
            form.fields['institution_email']?.value["email"] ?? '',
        "lat":
            useLocation.value ? await _locationController.getLatitute() : null,
        "long":
            useLocation.value ? await _locationController.getLongitude() : null,
        "status": "În lucru",
        "subject": form.fields['subject']?.value ?? '',
        "email": form.fields['email']?.value ?? '',
        "name": form.fields['name']?.value ?? '',
        "url": imageLinks,
        "phone": form.fields['phone']?.value ?? '',
      },
    ]);
    debugPrint(json);
    return json;
  }

  Future<NoticeProblemMapMarkerModel> getMarkers() async {
    markerList.clear();

    try {
      final DocumentReference dr = fireRepo.firestore.doc('collection/Markers');
      return await fireRepo.getDocument(
        document: dr,
        convert: NoticeProblemMapMarkerModel.fromJson,
      );
    } on Exception {
      rethrow;
    }
  }

  addMarkersToList(MarkersModel element) {
    markerList.add(
      Marker(
        point: latLng.LatLng(element.lat as double, element.long as double),
        builder: (BuildContext context) {
          return InkWell(
            onTap: () {
              Get.defaultDialog(
                barrierDismissible: false,
                title: '${element.subject}',
                content: Column(
                  children: [
                    Text('${element.description}'),
                    Text('${element.institution}'),
                  ],
                ),
                onConfirm: () => Get.back(),
                textConfirm: 'close'.tr,
              );
            },
            child: SizedBox(
                width: 40,
                height: 40,
                child: CircleAvatar(
                  backgroundColor: Colors.white,
                  child:
                      Icon(icon.entries.elementAt(element.index as int).value),
                )),
          );
        },
      ),
    );
  }

  @override
  void onInit() {
    markerList.clear();
    super.onInit();
  }

  @override
  void onClose() {
    markerList.clear();
    super.onClose();
  }
}

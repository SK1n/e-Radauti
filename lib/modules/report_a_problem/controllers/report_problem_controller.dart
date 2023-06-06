import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutterapperadauti/controllers/location_controller.dart';
import 'package:flutterapperadauti/routes/app_pages.dart';
import 'package:flutterapperadauti/utils/base_controller.dart';
import 'package:fluttericon/entypo_icons.dart';
import 'package:fluttericon/font_awesome5_icons.dart';
import 'package:fluttericon/octicons_icons.dart';
import 'package:get/get.dart';
import 'package:latlong2/latlong.dart' as latLng;
import 'package:logger/logger.dart';

import '../../../data/models/notice_problem_map/markers_model.dart';
import '../../../data/models/notice_problem_map/notice_problem_map_marker_model.dart';

class ReportProblemController extends BaseController {
  final GlobalKey<FormBuilderState> formKey = GlobalKey();
  List<String> imageLinks = [];

  final Map<String, String> dropDown = {
    'relatiipublice@primariaradauti.ro': 'radauti-city-hall'.tr,
    'office@serviciicomunale.ro': 'comunal-services'.tr,
    'agentia.radauti@acetsv.ro': 'acet-radauti'.tr,
    'contact@cjsuceava.ro': 'suceava-county-council'.tr,
    'cjsuceava@gnm.ro': 'suceava-environmental-guard'.tr,
    'gardaforestiera.suceava@gmail.com': 'suceava-forest-guard'.tr,
    'dspsv@dspsv.ro': 'dsp-suceava'.tr,
    'marginea@suceava.rosilva.ro': 'ocolul-silvic-marginea'.tr,
    'radautiulcivic@gmail.com': 'radautiul-civic-association'.tr,
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
      isLoading = true;
      await Future.forEach(
        formKey.currentState!.fields['ImagePicker']?.value,
        (element) async => imageLinks.add(
          await fireRepo.uploadImageToFirebase(
            path: 'Notice_A_Problem',
            file: element,
          ),
        ),
      );
      kReleaseMode
          ? await fireRepo.uploadDataToFirebase(
              collection: 'collection',
              document: 'Markers',
              array: 'markers',
              data: await createData())
          : DoNothingAction();
      await fireRepo.uploadDataToFirebase(
        collection: 'users',
        document: fireRepo.getUID(),
        array: 'reports',
        data: await createData(),
      );
      formKey.currentState!.reset();
      imageLinks = [];
    } catch (e) {
      Get.showSnackbar(
        GetSnackBar(
          title: 'A intervenit o eroare',
          message: e.toString(),
          duration: const Duration(seconds: 5),
        ),
      );
    } finally {
      isLoading = false;
    }
  }

  Future<String> createData() async {
    var form = formKey.currentState!;

    String json = jsonEncode([
      {
        "category": form.fields['category']?.value ?? '',
        "description": form.fields['description']?.value ?? '',
        "index": category.indexOf(form.fields['category']?.value),
        "institution": form.fields['institution_email']?.value.value ?? '',
        "institution_email": form.fields['institution_email']?.value.key ?? '',
        // "lat":
        //     useLocation.value ? await _locationController.getLatitute() : null,
        // "long":
        //     useLocation.value ? await _locationController.getLongitude() : null,
        'lat': null,
        'long': null,
        "status": "În lucru",
        "subject": form.fields['subject']?.value ?? '',
        "email": form.fields['email']?.value ?? '',
        "name": form.fields['name']?.value ?? '',
        "url": imageLinks,
        "phone": form.fields['phone']?.value ?? '',
        'created_at': DateTime.now().toLocal().toString(),
      },
    ]);
    debugPrint(json);
    return json;
  }

  addMarkersToList(List<MarkersModel> data) {
    List<Marker> markers = [];
    for (MarkersModel item in data) {
      if (item.lat != null && item.long != null) {
        markers.add(
          Marker(
            point: latLng.LatLng(item.lat as double, item.long as double),
            builder: (BuildContext context) {
              return InkWell(
                onTap: () {
                  Get.toNamed(Routes.previewReport, arguments: [item]);
                },
                child: SizedBox(
                  width: 40,
                  height: 40,
                  child: CircleAvatar(
                    backgroundColor: Colors.white,
                    child: Icon(
                      icon.entries.elementAt(item.index as int).value,
                    ),
                  ),
                ),
              );
            },
          ),
        );
      }
    }

    return markers;
  }

  Future<void> getMarkers() async {
    return futurize(() async {
      DocumentReference dr = fireRepo.firestore.doc('collection/Markers');
      NoticeProblemMapMarkerModel data = await fireRepo.getDocument(
        document: dr,
        convert: NoticeProblemMapMarkerModel.fromJson,
      );
      return addMarkersToList(data.markers ?? []);
    });
  }

  @override
  void onReady() async {
    await getMarkers();
    super.onReady();
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_map_marker_cluster/flutter_map_marker_cluster.dart';
import 'package:flutterapperadauti/data/models/notice_problem_map/markers_model.dart';
import 'package:flutterapperadauti/data/models/notice_problem_map/notice_problem_map_marker_model.dart';
import 'package:fluttericon/entypo_icons.dart';
import 'package:fluttericon/font_awesome5_icons.dart';
import 'package:fluttericon/octicons_icons.dart';
// ignore: depend_on_referenced_packages, library_prefixes
import 'package:latlong2/latlong.dart' as latLng;
import 'package:get/get.dart';

class NoticeProblemMapController extends GetxController
    with GetSingleTickerProviderStateMixin {
  late PopupController popupController;
  List<Marker> markerList = [];

  NoticeProblemMapMarkerModel? markersModel;

  final _extendSpeedDial = true.obs;
  get extendSpeedDial => _extendSpeedDial.value;
  set extendSpeedDial(value) => _extendSpeedDial.value = value;

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
                content: Text('${element.description}'),
                onConfirm: () => Get.back(),
                textConfirm: 'close'.tr,
              );
            },
            child: SizedBox(
                width: 40,
                height: 40,
                child: CircleAvatar(
                  backgroundColor: Colors.white,
                  child: switchIcon(element.index as int),
                )),
          );
        },
      ),
    );
  }

  Icon switchIcon(int icon) {
    switch (icon) {
      case 0:
        return const Icon(
          Entypo.dot_3,
          color: Colors.black,
        );

      case 1:
        return const Icon(
          Entypo.trash,
          color: Colors.black,
        );

      case 2:
        return const Icon(
          FontAwesome5.road,
          color: Colors.black,
        );

      case 3:
        return const Icon(
          Entypo.lamp,
          color: Colors.black,
        );

      case 4:
        return const Icon(
          Entypo.home,
          color: Colors.black,
        );

      case 5:
        return const Icon(
          Octicons.shield_check,
          color: Colors.black,
        );

      case 6:
        return const Icon(
          Icons.blur_circular,
          color: Colors.black,
        );

      default:
        return const Icon(
          Entypo.dot_3,
          color: Colors.black,
        );
    }
  }

  @override
  void onInit() {
    popupController = PopupController();
    markerList.clear();
    super.onInit();
  }
}

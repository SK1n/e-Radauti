import 'package:flutter/material.dart';
import 'package:flutterapperadauti/controllers/location_controller.dart';
import 'package:flutterapperadauti/modules/notice_a_problem/screens/form/controllers/form_controller.dart';
import 'package:fluttericon/font_awesome_icons.dart';
import 'package:get/get.dart';

class LocationSwitch extends StatelessWidget {
  const LocationSwitch({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final LocationController _locationController =
        Get.find<LocationController>();
    final NoticeProblemController _noticeProblemController =
        Get.find<NoticeProblemController>();
    return Obx(
      () => SwitchListTile(
        dense: true,
        secondary: Icon(FontAwesome.pin),
        title: Text(
            'Adăugați locația sesizării dacă sunteți în locul unde este problema sesizată'),
        isThreeLine: false,
        value: _noticeProblemController.useLocation.value,
        onChanged: (value) {
          if (value) {
            _locationController.checkServiceEnabled();
            _locationController.checkPermissionGranted().then(
                  (value) => _noticeProblemController.useLocation.value = value,
                );
          } else {
            _noticeProblemController.useLocation.value = false;
          }
        },
      ),
    );
  }
}

import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:flutterapperadauti/controllers/location_controller.dart';
import 'package:flutterapperadauti/modules/report_a_problem/controllers/form_controller.dart';
import 'package:fluttericon/font_awesome_icons.dart';
import 'package:get/get.dart';

class LocationSwitch extends StatelessWidget {
  const LocationSwitch({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final LocationController locationController =
        Get.find<LocationController>();
    final NoticeProblemController noticeProblemController =
        Get.find<NoticeProblemController>();
    return Card(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(4.0),
          topRight: Radius.circular(4.0),
        ),
      ),
      child: Obx(
        () => SwitchListTile(
          dense: true,
          tileColor: Get.isDarkMode
              ? FlexColor.darkScaffoldBackground
              : FlexColor.lightScaffoldBackground,
          secondary: const Icon(FontAwesome.pin),
          title: Text('add-location'.tr),
          isThreeLine: false,
          value: noticeProblemController.useLocation.value,
          onChanged: (value) {
            if (value) {
              locationController.checkServiceEnabled();
              locationController.checkPermissionGranted().then(
                    (value) =>
                        noticeProblemController.useLocation.value = value,
                  );
            } else {
              noticeProblemController.useLocation.value = false;
            }
          },
        ),
      ),
    );
  }
}

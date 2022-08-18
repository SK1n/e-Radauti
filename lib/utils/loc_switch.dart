import 'package:flutter/material.dart';
import 'package:flutterapperadauti/controllers/location_controller.dart';
import 'package:get/get.dart';

class LocSwitch extends StatelessWidget {
  const LocSwitch({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final LocationController locationController = Get.put(LocationController());
    return Card(
      child: ListTile(
        title: Text('Locatie'),
        leading: Icon(Icons.pin_drop),
        trailing: TextButton(
          child: Text('Acorda'),
          onPressed: locationController.enabled.value
              ? () async {
                  locationController.checkServiceEnabled();
                  locationController.checkPermissionGranted();
                  if (await locationController.checkServiceEnabled() &&
                      await locationController.checkPermissionGranted()) {
                    locationController.enabled.value = false;
                  }
                }
              : null,
        ),
      ),
    );
  }
}

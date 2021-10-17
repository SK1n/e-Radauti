import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterapperadauti/state/geolocator_state.dart';
import 'package:geolocator/geolocator.dart';
import 'package:permission_handler/permission_handler.dart';

void geolocationOnChanged({
  @required BuildContext context,
  @required GeolocatorState geolocatorState,
  @required bool value,
}) {
  geolocatorState.changeValue(value);
  geolocatorState.value
      ? Permission.location.request().then((value) => {
            value.isGranted
                ? geolocatorState.changeValue(true)
                : geolocatorState.changeValue(false),
            value.isPermanentlyDenied
                ? showDialog(
                    barrierDismissible: false,
                    context: context,
                    builder: (BuildContext context) => Platform.isIOS
                        ? cupertinoGeolocationDeniedDialog(
                            context, geolocatorState)
                        : androidGeolocationDeniedDialog(
                            context, geolocatorState),
                  )
                : DoNothingAction()
          })
      : DoNothingAction();
}

cupertinoGeolocationDeniedDialog(
    BuildContext context, GeolocatorState geolocatorState) {
  return CupertinoAlertDialog(
    title: Text('Permisiunea de locatie este oprita'),
    content: Text('Doriti sa deschideti setarile pentru a le activa?'),
    actions: [
      TextButton(
        onPressed: () => {
          Navigator.pop(context),
          geolocatorState.changeValue(false),
        },
        child: Text('Cancel'),
      ),
      TextButton(
        onPressed: () => {
          Geolocator.openAppSettings(),
          Navigator.pop(context),
        },
        child: Text('Setari'),
      ),
    ],
  );
}

androidGeolocationDeniedDialog(
    BuildContext context, GeolocatorState geolocatorState) {
  return AlertDialog(
    title: Text('Permisiunea de locatie este oprita'),
    content: Text('Doriti sa deschideti setarile pentru a le activa?'),
    actions: [
      TextButton(
        onPressed: () => {
          Navigator.pop(context),
          geolocatorState.changeValue(false),
        },
        child: Text('Cancel'),
      ),
      TextButton(
        onPressed: () async => {
          await Geolocator.openAppSettings(),
          Navigator.pop(context),
        },
        child: Text('Setari'),
      ),
    ],
  );
}

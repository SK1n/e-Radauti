import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterapperadauti/state/geolocator_state.dart';
import 'package:flutterapperadauti/state/notice_problem_state.dart';
import 'package:geolocator/geolocator.dart';

Future<void> geolocationOnChanged({
  required BuildContext context,
  required GeolocatorState geolocatorState,
  required bool value,
  required NoticeFormState noticeFormState,
}) async {
  geolocatorState.changeValue(value);
  LocationPermission permission = await Geolocator.checkPermission();
  if (geolocatorState.value) {
    if (permission == LocationPermission.denied) {
      debugPrint("Permission denied");
      showDialog(
        context: context,
        builder: (BuildContext context) => Platform.isIOS
            ? CupertinoAlertDialog(
                title: Text('Avem nevoie de acces la locatie'),
                content: Text(
                    'Locatia va fi folosita doar atunci cand trimiteti o sesizare.'),
                actions: [
                  TextButton(
                      onPressed: () async {
                        Navigator.pop(context);
                        await Geolocator.requestPermission()
                            .then((value) async {
                          if (value == LocationPermission.always ||
                              value == LocationPermission.whileInUse) {
                            geolocatorState.changeValue(true);
                            await Geolocator.getCurrentPosition().then(
                                (value) => noticeFormState.getPosition(value));
                          }
                        });
                      },
                      child: Text('OK'))
                ],
              )
            : AlertDialog(
                title: Text('Avem nevoie de acces la locatie'),
                content: Text(
                    'Locatia va fi folosita doar atunci cand trimiteti o sesizare.'),
                actions: [
                  TextButton(
                      onPressed: () async {
                        Navigator.pop(context);
                        await Geolocator.requestPermission()
                            .then((value) async {
                          if (value == LocationPermission.always ||
                              value == LocationPermission.whileInUse) {
                            geolocatorState.changeValue(true);
                            await Geolocator.getCurrentPosition().then(
                                (value) => noticeFormState.getPosition(value));
                          }
                        });
                      },
                      child: Text('OK'))
                ],
              ),
      );
    } else if (permission == LocationPermission.deniedForever) {
      debugPrint("Permission denied forever");
      geolocatorState.changeValue(false);
      Platform.isIOS
          ? cupertinoGeolocationDeniedDialog(context, geolocatorState)
          : androidGeolocationDeniedDialog(context, geolocatorState);
    } else {
      debugPrint("Permission granted");
      await Geolocator.getCurrentPosition().then((value) {
        noticeFormState.getPosition(value);
      });
      geolocatorState.changeValue(true);
    }
  }
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
          Geolocator.openLocationSettings(),
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

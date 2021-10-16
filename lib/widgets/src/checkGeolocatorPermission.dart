import 'package:flutterapperadauti/state/notice_problem_state.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:geolocator/geolocator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:flutterapperadauti/notice_a_problem/location_switch.dart';
import 'dart:io';

Future<void> checkPermissions(BuildContext context) async {
  debugPrint('check geolocator permission!');
  var status = await Permission.location.status;
  if (status.isGranted) {
    debugPrint('Geolocator permission isGranted');
    if (context.read<NoticeFormState>().position == null) {
      context
          .read<NoticeFormState>()
          .getPosition(await Geolocator.getCurrentPosition());
    }
  } else if (status.isDenied) {
    debugPrint('Geolocator permission isUndetermined!');
    await showDialog(
        barrierDismissible: false,
        context: context,
        builder: (BuildContext context) {
          return Platform.isAndroid
              ? AlertDialog(
                  content: Text('Avem nevoie de locatia dvs.'),
                  actions: [
                    TextButton(
                        child: Text('Ok'),
                        onPressed: () async => {
                              Navigator.pop(context),
                              await Permission.location.request(),
                              if (context.read<NoticeFormState>().position ==
                                  null)
                                {
                                  context.read<NoticeFormState>().getPosition(
                                      await Geolocator.getCurrentPosition()),
                                }
                            }),
                    TextButton(
                      child: Text('Respinge'),
                      onPressed: () {
                        Navigator.pop(context);
                        context.read<LocationSwitchState>().updateState(false);
                      },
                    )
                  ],
                )
              : CupertinoAlertDialog(
                  title: Text('Avem nevoie de locatia dvs.'),
                  actions: [
                    CupertinoDialogAction(
                        child: Text('Ok'),
                        isDefaultAction: true,
                        onPressed: () async => {
                              Navigator.pop(context),
                              await Permission.location.request(),
                              if (context.read<NoticeFormState>().position ==
                                  null)
                                {
                                  context.read<NoticeFormState>().getPosition(
                                      await Geolocator.getCurrentPosition())
                                }
                            }),
                    CupertinoDialogAction(
                      child: Text('Respinge'),
                      onPressed: () {
                        Navigator.pop(context);
                        context.read<LocationSwitchState>().updateState(false);
                      },
                    )
                  ],
                );
        });
  } else {
    debugPrint('Geolocator permission isForeverDenied!');
    await showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) => CupertinoAlertDialog(
        title: Text('Acces la locatie'),
        content:
            Text('Avem nevoie de locatia dvs. pentru a fi adaugata la email!'),
        actions: <Widget>[
          CupertinoDialogAction(
            child: Text('Respinge'),
            onPressed: () => Navigator.of(context).pop(),
          ),
          CupertinoDialogAction(
            child: Text('Setari'),
            onPressed: () => Geolocator.openAppSettings(),
          ),
        ],
      ),
    );
  }
}

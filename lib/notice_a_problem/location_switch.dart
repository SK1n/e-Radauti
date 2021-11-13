import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutterapperadauti/geolocator.dart';
import 'package:flutterapperadauti/notice_a_problem/widgets/send_button.dart';
import 'package:flutterapperadauti/state/geolocator_state.dart';
import 'package:flutterapperadauti/state/notice_problem_state.dart';
import 'package:geolocator/geolocator.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:provider/provider.dart';

class LocationSwitch extends StatelessWidget {
  const LocationSwitch({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    GeolocatorState geolocatorState = Provider.of<GeolocatorState>(context);
    return SwitchListTile(
      dense: true,
      secondary: Icon(SimpleLineIcons.location_pin),
      title: Text(
          'Adăugați locația sesizării dacă sunteți în locul unde este problema sesizată'),
      isThreeLine: false,
      value: geolocatorState.value,
      onChanged: (value) async {
        geolocatorState.changeValue(value);
        await geolocationOnChanged(
            context: context, geolocatorState: geolocatorState, value: value);

        if (geolocatorState.value) {
          context.read<SendButtonLoadingState>().updateState(true);
          Geolocator.getCurrentPosition().then(
            (position) => {
              context.read<NoticeFormState>().getPosition(position),
              context.read<SendButtonLoadingState>().updateState(false),
            },
          );
        }
      },
    );
  }
}

class LocationSwitchState extends ChangeNotifier {
  bool _value = false;
  bool get value => _value;

  void updateState(bool value) {
    _value = value;
    debugPrint('switch: $value');
    notifyListeners();
  }
}

// TODO : check if the email works properly. Solved switcher problem.

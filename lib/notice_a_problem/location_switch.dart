import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutterapperadauti/state/notice_problem_notifier.dart';
import 'package:flutterapperadauti/widgets/src/checkGeolocatorPermission.dart';
import 'package:provider/provider.dart';

class LocationSwitch extends StatelessWidget {
  const LocationSwitch({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SwitchListTile(
      dense: true,
      secondary: Icon(SimpleLineIcons.location_pin),
      title: Text(
          'Adăugați locația sesizării dacă sunteți în locul unde este problema sesizată'),
      isThreeLine: false,
      value: context.watch<LocationSwitchState>().value,
      onChanged: (value) {
        context.read<LocationSwitchState>().updateState(value);
        value = context.read<LocationSwitchState>().value;
        // ignore: unnecessary_statements
        value
            ? checkPermissions(context)
            : context.read<NoticeFormState>().getPosition(null);
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

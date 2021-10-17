import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutterapperadauti/notice_a_problem/widgets/send_button.dart';
import 'package:flutterapperadauti/state/notice_problem_state.dart';
import 'package:geolocator/geolocator.dart';
import 'package:permission_handler/permission_handler.dart';
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
        if (value) {
          Permission.location.isGranted.then((isGranted) {
            if (isGranted) {
              context.read<SendButtonLoadingState>().updateState(true);
              Geolocator.getCurrentPosition().then(
                (position) => {
                  context.read<NoticeFormState>().getPosition(position),
                  context.read<SendButtonLoadingState>().updateState(false),
                },
              );
            } else {
              showDialog(
                context: context,
                builder: (BuildContext contect) => Platform.isIOS
                    ? CupertinoAlertDialog(
                        title: Text('Locatia nu este activata'),
                        content: Text('Doriti sa o activati?'),
                        actions: [
                          TextButton(
                            onPressed: () => Navigator.pop(context),
                            child: Text('Cancel'),
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                              context
                                  .read<SendButtonLoadingState>()
                                  .updateState(false);
                              context
                                  .read<LocationSwitchState>()
                                  .updateState(false);
                              Navigator.pushNamed(context, '/settings');
                            },
                            child: Text('Setari'),
                          ),
                        ],
                      )
                    : AlertDialog(
                        title: Text('Locatia nu este activata'),
                        content: Text('Doriti sa o activati?'),
                        actions: [
                          TextButton(
                            onPressed: () => Navigator.pop(context),
                            child: Text('Cancel'),
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                              context
                                  .read<SendButtonLoadingState>()
                                  .updateState(false);
                              context
                                  .read<LocationSwitchState>()
                                  .updateState(false);
                              Navigator.pushNamed(context, '/settings');
                            },
                            child: Text('Setari'),
                          ),
                        ],
                      ),
              );
            }
          });
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

import 'package:flutter/material.dart';
import 'package:flutterapperadauti/geolocator.dart';
import 'package:flutterapperadauti/notice_a_problem/widgets/send_button.dart';
import 'package:flutterapperadauti/state/geolocator_state.dart';
import 'package:flutterapperadauti/state/notice_problem_state.dart';
import 'package:fluttericon/font_awesome_icons.dart';
import 'package:provider/provider.dart';

class LocationSwitch extends StatelessWidget {
  final SendButtonLoadingState? sendButtonLoadingState;
  const LocationSwitch({
    Key? key,
    this.sendButtonLoadingState,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    GeolocatorState geolocatorState = Provider.of<GeolocatorState>(context);
    NoticeFormState noticeFormState =
        Provider.of<NoticeFormState>(context, listen: false);
    return SwitchListTile(
      dense: true,
      secondary: Icon(FontAwesome.pin),
      title: Text(
          'Adăugați locația sesizării dacă sunteți în locul unde este problema sesizată'),
      isThreeLine: false,
      value: geolocatorState.valueSwitch,
      onChanged: (value) async {
        geolocatorState.changeValueSwitch(value);
        if (geolocatorState.valueSwitch) {
          sendButtonLoadingState!.updateState(true);
          await geolocationOnChanged(
                  context: context,
                  geolocatorState: geolocatorState,
                  noticeFormState: noticeFormState,
                  value: value)
              .then((value) => sendButtonLoadingState!.updateState(false));
        } else {
          sendButtonLoadingState!.updateState(false);
        }
      },
    );
  }
}

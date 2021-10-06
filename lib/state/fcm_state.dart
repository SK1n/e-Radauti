import 'package:flutter/material.dart';

class FCMState extends ChangeNotifier {
  String _fcm;
  String get fcm => _fcm;

  void getFcm(String fcm) {
    _fcm = fcm;
    debugPrint('fcm: $fcm');
    notifyListeners();
  }
}

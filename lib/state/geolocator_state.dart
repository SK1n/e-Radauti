import 'package:flutter/foundation.dart';

class GeolocatorState extends ChangeNotifier {
  bool _value = false;
  bool get value => _value;

  void changeValue(bool value) {
    _value = value;
    notifyListeners();
  }
}

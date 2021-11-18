import 'package:flutter/foundation.dart';

class GeolocatorState extends ChangeNotifier {
  bool _value = false;
  bool get value => _value;
  bool _valueSwitch = false;
  bool get valueSwitch => _valueSwitch;

  void changeValue(bool value) {
    _value = value;
    notifyListeners();
  }

  void changeValueSwitch(bool value) {
    _valueSwitch = value;
    notifyListeners();
  }
}

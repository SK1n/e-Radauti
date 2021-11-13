import 'package:flutter/material.dart';

class Subscription extends ChangeNotifier {
  List subscribed = [];
  List topics = ['Toate', 'Evenimente', 'Sesizari'];
  bool _enabled = false;
  bool get enabled => _enabled;

  void changeEnabled(bool value) {
    _enabled = value;
    notifyListeners();
  }
}

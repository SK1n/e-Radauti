import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SendButtonLoadingState extends ChangeNotifier {
  bool _isLoading = false;
  bool get isLoading => _isLoading;

  void updateState(bool value) {
    _isLoading = value;
    notifyListeners();
  }
}

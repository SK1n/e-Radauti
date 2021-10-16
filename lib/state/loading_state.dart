import 'package:flutter/material.dart';

class IsLoading extends ChangeNotifier {
  bool _loading = false;
  bool get loading => _loading;

  void changeLoadingState() {
    _loading = !_loading;
    debugPrint('loading: $_loading');
    notifyListeners();
  }
}

import 'package:flutter/material.dart';

class Subscription extends ChangeNotifier {
  bool _topicAll = false;
  bool get topicAll => _topicAll;

  void changeSubscription(bool value) {
    _topicAll = value;
    debugPrint('topic:$_topicAll');
    notifyListeners();
  }
}

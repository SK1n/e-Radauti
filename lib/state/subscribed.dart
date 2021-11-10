import 'package:flutter/material.dart';

class Subscription extends ChangeNotifier {
  List subscribed = [];
  List topics = ['default', 'events', 'notice'];
}

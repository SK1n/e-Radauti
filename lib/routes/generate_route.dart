import 'package:flutter/material.dart';
import 'package:flutterapperadauti/modules/events/main.dart';
import 'package:flutterapperadauti/modules/menu/menu_screen.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;
    switch (settings.name) {
      case '/events':
        return MaterialPageRoute(builder: (context) => MainEventsScreen());
      default:
        return MaterialPageRoute(builder: (context) => MenuScreen());
    }
  }
}

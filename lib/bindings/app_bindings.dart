import 'package:flutter/material.dart';
import 'package:flutter_loadingindicator/flutter_loadingindicator.dart';
import 'package:flutterapperadauti/controllers/analytics_controller.dart';
import 'package:flutterapperadauti/controllers/notifications_controller.dart';
import 'package:get/get.dart';

class AppBindings implements Bindings {
  @override
  void dependencies() {
    EasyLoading.instance
      ..indicatorType = EasyLoadingIndicatorType.wave
      ..userInteractions = false
      ..loadingStyle = EasyLoadingStyle.custom
      ..backgroundColor = Colors.white
      ..indicatorColor = Colors.pinkAccent
      ..textColor = Colors.white;
    Get.lazyPut(() => NotificationsController());
    Get.lazyPut(() => AnalyticsController());
  }
}

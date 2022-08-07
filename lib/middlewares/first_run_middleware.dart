import 'package:flutter/material.dart';
import 'package:flutterapperadauti/controllers/first_run_controller.dart';
import 'package:flutterapperadauti/routes/app_pages.dart';
import 'package:get/get.dart';

class FirstRunMiddleware extends GetMiddleware {
  @override
  Future<GetNavConfig?> redirectDelegate(GetNavConfig route) async {
    FirstRunController _controller = Get.put(FirstRunController());
    if (await _controller.firstRun) {
      return GetNavConfig.fromRoute(Routes.ONBOARD);
    } else {
      return super.redirectDelegate(route);
    }
  }
}

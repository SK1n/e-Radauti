import 'package:flutter/foundation.dart';
import 'package:flutterapperadauti/controllers/first_run_controller.dart';
import 'package:get/get.dart';

class FirstRunBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => FirstRunController());
  }
}

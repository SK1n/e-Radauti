import 'package:flutterapperadauti/controllers/location_controller.dart';
import 'package:get/get.dart';

class LocationBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => LocationController());
  }
}

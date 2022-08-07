import 'package:flutterapperadauti/air_quality/screens/air_quality/controllers/air_quality_controller.dart';
import 'package:get/get.dart';

class AirQualityBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AirQualityController());
  }
}

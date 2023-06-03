import 'package:flutterapperadauti/modules/air_quality/controllers/air_quality_controller.dart';
import 'package:flutterapperadauti/repositories/firebase_repository.dart';
import 'package:get/get.dart';

class AirQualityBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AirQualityController(FirebaseRepository()));
  }
}

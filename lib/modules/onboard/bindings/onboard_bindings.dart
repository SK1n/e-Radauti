import 'package:flutterapperadauti/modules/onboard/controllers/onboard_controller.dart';
import 'package:get/get.dart';

class OnboardBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<OnboardController>(
      () => OnboardController(),
    );
  }
}

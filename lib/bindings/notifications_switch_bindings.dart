import 'package:flutterapperadauti/controllers/notifications_switch_controller.dart';
import 'package:get/get.dart';

class NotificationsSwitchBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => NotificationsSwitchController());
  }
}

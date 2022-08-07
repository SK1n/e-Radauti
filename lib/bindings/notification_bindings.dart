import 'package:flutterapperadauti/controllers/notifications_controller.dart';
import 'package:get/get.dart';

class NotificationsBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => NotificationsController());
  }
}

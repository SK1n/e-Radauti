import 'package:flutterapperadauti/modules/login/controllers/reset_password_controller.dart';
import 'package:get/get.dart';

class ResetPasswordBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ResetPasswordController>(() => ResetPasswordController());
  }
}

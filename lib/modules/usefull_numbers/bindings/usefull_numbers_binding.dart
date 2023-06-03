import 'package:flutterapperadauti/modules/usefull_numbers/controllers/usefull_numbers_controller.dart';
import 'package:flutterapperadauti/repositories/firebase_repository.dart';
import 'package:get/get.dart';

class UsefullNumbersBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<UsefullNumbersController>(
      () => UsefullNumbersController(),
    );
  }
}

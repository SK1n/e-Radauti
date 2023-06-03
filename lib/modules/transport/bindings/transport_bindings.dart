import 'package:flutterapperadauti/modules/transport/controllers/transport_controller.dart';
import 'package:flutterapperadauti/repositories/firebase_repository.dart';
import 'package:get/get.dart';

class TransportBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TransportController>(() => TransportController());
  }
}

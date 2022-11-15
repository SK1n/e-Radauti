import 'package:flutterapperadauti/data/clients/local_legislation_client.dart';
import 'package:flutterapperadauti/modules/town_hall/controllers/local_legislation_controller.dart';
import 'package:get/get.dart';

class LocalLegislationBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LocalLegislationController>(
        () => LocalLegislationController(const LocalLegislationClient()));
  }
}

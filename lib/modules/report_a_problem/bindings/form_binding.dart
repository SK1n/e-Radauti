import 'package:flutterapperadauti/controllers/location_controller.dart';
import 'package:flutterapperadauti/modules/report_a_problem/controllers/form_controller.dart';
import 'package:get/get.dart';

class NoticeProblemFormBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<NoticeProblemController>(() => NoticeProblemController());
    Get.lazyPut<LocationController>(() => LocationController());
  }
}

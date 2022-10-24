import 'package:flutterapperadauti/modules/notice_a_problem/controllers/notice_map_controller.dart';
import 'package:get/get.dart';

class NoticeProblemMapBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<NoticeProblemMapController>(() => NoticeProblemMapController());
  }
}

import 'package:flutterapperadauti/controllers/dao_controller.dart';
import 'package:flutterapperadauti/modules/events/controllers/events_controller.dart';
import 'package:get/get.dart';

class EventsBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => EventsController());
    Get.lazyPut(() => DaoController());
  }
}

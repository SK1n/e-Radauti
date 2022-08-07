import 'package:flutterapperadauti/controllers/download_image_controller.dart';
import 'package:flutterapperadauti/controllers/events_controller.dart';
import 'package:get/get.dart';

class EventsBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => EventsController());
    Get.lazyPut(() => DownloadImageController());
  }
}

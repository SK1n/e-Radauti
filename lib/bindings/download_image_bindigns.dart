import 'package:flutterapperadauti/controllers/download_image_controller.dart';
import 'package:get/get.dart';

class DownloadImageBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => DownloadImageController());
  }
}

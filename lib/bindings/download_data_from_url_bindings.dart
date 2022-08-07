import 'package:flutterapperadauti/controllers/download_data_from_url_controller.dart';
import 'package:get/get.dart';

class DownloadDataFromUrlBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => DownloadDataFromUrlController());
  }
}

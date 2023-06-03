import 'package:flutterapperadauti/data/clients/e_radauti_website_client.dart';
import 'package:flutterapperadauti/modules/announcements/controllers/announcements_controller.dart';
import 'package:flutterapperadauti/repositories/firebase_repository.dart';
import 'package:get/get.dart';

class AnnouncementsBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AnnouncementsController>(
      () => AnnouncementsController(const ERadautiWebsiteClient()),
    );
  }
}

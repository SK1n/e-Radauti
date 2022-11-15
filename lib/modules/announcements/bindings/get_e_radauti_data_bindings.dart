import 'package:flutterapperadauti/data/clients/e_radauti_website_client.dart';
import 'package:flutterapperadauti/modules/announcements/controllers/get_e_radauti_data_controller.dart';
import 'package:get/get.dart';

class GetERadautiDataBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<GetERadautiDataController>(
        () => GetERadautiDataController(const ERadautiWebsiteClient()));
  }
}

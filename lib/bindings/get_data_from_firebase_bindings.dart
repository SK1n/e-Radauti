import 'package:flutterapperadauti/controllers/get_data_from_firebase_controller.dart';
import 'package:get/get.dart';

class GetDataFromFirebaseBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<GetDataFromFirebaseController>(
        () => GetDataFromFirebaseController());
  }
}

import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class DownloadImageController extends GetxController {
  Future<String> getDownloadUrlFromUrlRef(String imgURL) async {
    return await FirebaseStorage.instance
        .refFromURL(imgURL)
        .getDownloadURL()
        .then((imageUrl) {
      return imageUrl;
    });
  }
}

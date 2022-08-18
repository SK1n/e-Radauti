import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:get/get.dart';

class NotificationsSwitchController extends GetxController {
  void askForPermissions() {
    FirebaseMessaging.instance.requestPermission();
  }
}

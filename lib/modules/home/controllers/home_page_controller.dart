import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';

class HomePageController extends GetxController {
  final Logger _logger = Logger();
  @override
  void onReady() async {
    await setupInteractedMessage();
    super.onReady();
  }

  Future didOpenAppFromNotifications() async {
    FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
        FlutterLocalNotificationsPlugin();
    // await flutterLocalNotificationsPlugin.getNotificationAppLaunchDetails().then((value) => Get.toNamed('/home/${value.payload.}'));
  }

  Future<void> setupInteractedMessage() async {
    _logger.d('setupInteractiveMessage()');
    RemoteMessage? initialMessage =
        await FirebaseMessaging.instance.getInitialMessage();
    _logger.d(initialMessage?.data ?? "empty");
    if (initialMessage == null) return;
    _logger.d('initialMessage != null');
    _handleMessage(initialMessage);
    FirebaseMessaging.onMessageOpenedApp.listen(_handleMessage);
  }

  void _handleMessage(RemoteMessage message) {
    _logger.d('handleMessage');
    if (message.data['view'].isEmpty) return;
    _logger.d('data: ${message.data['view']}');
    Get.toNamed('/home/${message.data['view']}');
  }
}

import 'dart:io';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutterapperadauti/controllers/analytics_controller.dart';
import 'package:get/get.dart';

final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();

class NotificationsController extends GetxController {
  final AnalyticsController _analytics = Get.put(AnalyticsController());
  final AndroidNotificationChannel channel = AndroidNotificationChannel(
    'high_importance_channel', // id
    'High Importance Notifications', // title
    description:
        'This channel is used for important notifications.', // description
    importance: Importance.high,
  );
  void setupNotifs() {
    if (Platform.isIOS) {
      FirebaseMessaging.instance.requestPermission();
    }
    FirebaseMessaging.instance
        .getInitialMessage()
        .then((RemoteMessage? message) {
      if (message != null) {
        _analytics.addToAnalytics('getInitialMessage:' + message.data['view']);
        Navigator.pushNamed(Get.context!, message.data['view']);
      }
    });
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      RemoteNotification? notification = message.notification;
      AndroidNotification? android = message.notification?.android;
      if (notification != null && android != null) {
        _analytics.addToAnalytics(message.data['view']);
        flutterLocalNotificationsPlugin.show(
            notification.hashCode,
            notification.title,
            notification.body,
            NotificationDetails(
              android: AndroidNotificationDetails(
                channel.id,
                channel.name,
                channelDescription: channel.description,
                icon: 'app_logo_final',
              ),
            ),
            payload: message.data["view"]);
      }
    });
    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      _analytics.addToAnalytics('onMessageOpenedApp:' + message.data['view']);
      Get.toNamed(message.data['view']);
    });
    didOpenAppFromNotif();
  }

  Future<void> didOpenAppFromNotif() async {
    final NotificationAppLaunchDetails? notificationAppLaunchDetails =
        await flutterLocalNotificationsPlugin.getNotificationAppLaunchDetails();
    if (notificationAppLaunchDetails!.didNotificationLaunchApp) {
      _analytics.addToAnalytics(
          "didOpenAppFromBotif: " + notificationAppLaunchDetails.payload!);
      if (notificationAppLaunchDetails.payload != null) {
        Get.toNamed('${notificationAppLaunchDetails.payload}');
      }
    }
  }
}

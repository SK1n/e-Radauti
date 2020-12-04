import 'dart:io';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';

class PushNotificationsService {
  final FirebaseMessaging _fcm = FirebaseMessaging();

  Future initialise() async {
    if (Platform.isIOS) {
      // request permissions if we're on android
      _fcm.configure(
        //Called when the app is in the foreground and we recieve a push notification
        onMessage: (Map<String, dynamic> message) async {
          debugPrint('onMessage: $message');
        },
        //Called when the app has been closed and it's opened from the push notifications
        onLaunch: (Map<String, dynamic> message) async {
          debugPrint('onMessage: $message');
        },
        onResume: (Map<String, dynamic> message) async {
          debugPrint('onMessage: $message');
        },
      );
    }
  }
}

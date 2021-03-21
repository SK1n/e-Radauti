import 'dart:io';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutterapperadauti/air_quality/air_quality.dart';
import 'package:flutterapperadauti/constants/route_names.dart';
import 'package:flutterapperadauti/main.dart';

class PushNotificationService {
  final FirebaseMessaging _fcm;

  PushNotificationService(this._fcm);

  Future initialise() async {
    if (Platform.isIOS) {
      _fcm.requestNotificationPermissions(IosNotificationSettings());
    }

    String token = await _fcm.getToken();
    debugPrint("FirebaseMessaging token: $token");
    _fcm.configure(
      onMessage: (Map<String, dynamic> message) async {
        debugPrint("onMessage: $message");
      },
      onLaunch: (Map<String, dynamic> message) async {
        debugPrint("onLaunch: $message");
        _serialiseAndNavigate(message);
      },
      onResume: (Map<String, dynamic> message) async {
        debugPrint("onResume: $message");
        _serialiseAndNavigate(message);
      },
    );
  }

  void _serialiseAndNavigate(Map<String, dynamic> message) {
    var notificationData = message['data'];
    var view = notificationData['view'];
    debugPrint('view data: ${view.toString()}');
    if (view != null) {
      if (view == "air_quality") {
        MyApp.navigatorKey.currentState.pushNamed(AirQualityRoute);
      }
      if (view == "announcement") {
        MyApp.navigatorKey.currentState.pushNamed(AnnouncementsRoute);
      }
      if (view == "council_meetings") {
        MyApp.navigatorKey.currentState.pushNamed(CouncilMeetingsRoute);
      }
      if (view == "local_authorities") {
        MyApp.navigatorKey.currentState.pushNamed(LocalAuthoritieRoute);
      }
      if (view == "events") {
        MyApp.navigatorKey.currentState.pushNamed(EventsRoute);
      }
      if (view == "notice_problem") {
        MyApp.navigatorKey.currentState.pushNamed(NoticeProblemRoute);
      }
    }
  }
}

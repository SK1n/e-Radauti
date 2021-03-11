import 'dart:io';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutterapperadauti/constants/route_names.dart';
import 'package:flutterapperadauti/pushNotificationMessage.dart';
import 'package:flutterapperadauti/services/locator.dart';
import 'package:flutterapperadauti/services/navigator.dart';
import 'package:overlay_support/overlay_support.dart';

class PushNotificationService {
  final FirebaseMessaging _fcm;
  final NavigationService _navigationService = locator<NavigationService>();
  PushNotificationService(this._fcm);

  Future initialise() async {
    if (Platform.isIOS) {
      _fcm.requestNotificationPermissions(IosNotificationSettings());
    }

    // If you want to test the push notification locally,
    // you need to get the token and input to the Firebase console
    // https://console.firebase.google.com/project/YOUR_PROJECT_ID/notification/compose
    String token = await _fcm.getToken();
    print("FirebaseMessaging token: $token");

    _fcm.configure(
      onMessage: (Map<String, dynamic> message) async {
        debugPrint("onMessage: $message");
        PushNotificationMessage notification = PushNotificationMessage(
          title: message['aps']['alert']['title'],
          body: message['aps']['alert']['body'],
        );
        showSimpleNotification(
          Container(child: Text(notification.body)),
          position: NotificationPosition.top,
        );
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

  // ! If you didn't do the first steps go to lib/services/router.dart
  //  Now that you've done the first steps finnaly this is the last step .
  //  Add one more if inside if(view != null)
  //  Inside the if(view == ....) there should be the value that we will get from firebase
  //  to open a specific route .
  //  Then inside _navigationService.navigateTo
  //  ( here should be one of the const we added in lib/constants/route_names.dart ) .
  //  Now you can go to firebase and test the push notification using the token from console .

  void _serialiseAndNavigate(Map<String, dynamic> message) {
    var notificationData = message['data'];
    var view = notificationData['view'];
    if (view != null) {
      if (view == "air_quality") {
        _navigationService.navigateTo(AirQualityRoute);
      }
      if (view == "announcement") {
        _navigationService.navigateTo(AnnouncementsRoute);
      }
      if (view == "council_meetings") {
        _navigationService.navigateTo(CouncilMeetingsRoute);
      }
      if (view == "local_authorities") {
        _navigationService.navigateTo(LocalAuthoritieRoute);
      }
      if (view == "events") {
        _navigationService.navigateTo(EventsRoute);
      }
      if (view == "notice_problem") {
        _navigationService.navigateTo(NoticeProblemRoute);
      }
    }
  }
}

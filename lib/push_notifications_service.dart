import 'dart:io';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutterapperadauti/usefull_numbers/local_authorities.dart';
import 'constants/route_names.dart';
import 'locator.dart';
import 'NavigationService.dart';

class PushNotificationService {
  final FirebaseMessaging _fcm = FirebaseMessaging();
  GlobalKey<NavigatorState> _navigationKey = GlobalKey<NavigatorState>();
  final NavigationService _navigationService = locator<NavigationService>();

  Future initialise() async {
    if (Platform.isIOS) {
      // request permissions if we're on android
      _fcm.requestNotificationPermissions(IosNotificationSettings());
    }

    _fcm.configure(
      // Called when the app is in the foreground and we receive a push notification
      onMessage: (Map<String, dynamic> message) async {
        print('onMessage: $message');
      },
      // Called when the app has been closed comlpetely and it's opened
      // from the push notification.
      onLaunch: (Map<String, dynamic> message) async {
        print('onLaunch: $message');
        _serialiseAndNavigate(message);
      },
      // Called when the app is in the background and it's opened
      // from the push notification.
      onResume: (Map<String, dynamic> message) async {
        print('onResume: $message');
        _serialiseAndNavigate(message);
      },
    );
  }

  void _serialiseAndNavigate(Map<String, dynamic> message) {
    var notificationData = message['data'];
    var view = notificationData['view'];

    if (view != null) {
      // Navigate to the create post view
      if (view == 'announcement') {
        debugPrint('here!');
        _navigationKey.currentState.pushNamed(Announcements);
      }
      if (view == 'local_authorities') {
        _navigationService.navigateTo(LocalAuthoritie);
      }
      if (view == 'council_meetings') {
        _navigationService.navigateTo(CouncilMeetings);
      }
      if (view == 'events') {
        _navigationService.navigateTo(Events);
      }
      if (view == 'air_quality') {
        _navigationService.navigateTo(AirQuality);
      }
    }
    debugPrint('empty!');
  }
}

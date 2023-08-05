import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutterapperadauti/app/utils/app_constants.dart';
import 'package:logger/logger.dart';
import 'package:shared_preferences/shared_preferences.dart';

enum NotificationsPermissions {
  initial,
  enabled,
  disabled,
}

extension XNotificationsPermissions on NotificationsPermissions {
  bool get isInitial => this == NotificationsPermissions.initial;
  bool get isEnabled => this == NotificationsPermissions.enabled;
  bool get isDisabled => this == NotificationsPermissions.disabled;
}

class NotificationsRepository {
  final FirebaseMessaging _firebaseMessaging;
  late final SharedPreferences prefs;

  NotificationsRepository({final FirebaseMessaging? firebaseMessaging})
      : _firebaseMessaging = firebaseMessaging ?? FirebaseMessaging.instance {
    _initialize();
  }

  Future<NotificationsPermissions> askForPermissions() async {
    NotificationSettings settings =
        await _firebaseMessaging.requestPermission();
    if (settings.authorizationStatus == AuthorizationStatus.authorized) {
      return NotificationsPermissions.enabled;
    } else if (settings.authorizationStatus ==
        AuthorizationStatus.provisional) {
      return NotificationsPermissions.enabled;
    } else if (settings.authorizationStatus == AuthorizationStatus.denied) {
      return NotificationsPermissions.disabled;
    }
    return NotificationsPermissions.disabled;
  }

  Future<void> subscribeToTopic(String topic) async {
    Logger log = Logger();
    await _firebaseMessaging.subscribeToTopic(topic);
    log.d('Subscribed to: $topic');
    await prefs.setBool(topic, true);
  }

  Future<void> unsubscribeFromTopic(String topic) async {
    Logger log = Logger();
    await _firebaseMessaging.unsubscribeFromTopic(topic);
    log.d('Unsubscribed from: $topic');
    await prefs.setBool(topic, false);
  }

  Future<void> enableNotifications() async {
    await prefs.setBool(AppConstants.notificationsEnabledKey, true);
  }

  Future<void> disableNotifications() async {
    await prefs.setBool(AppConstants.notificationsEnabledKey, false);
  }

  Future<bool> notificationsEnabled() async {
    return prefs.getBool(AppConstants.notificationsEnabledKey) ?? false;
  }

  Future<void> _initialize() async {
    prefs = await SharedPreferences.getInstance();
  }
}

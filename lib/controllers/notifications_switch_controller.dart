import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';
import 'package:shared_preferences/shared_preferences.dart';

class NotificationsSwitchController extends GetxController {
  final topics = {
    "announces": false,
    "events": false,
    "air-quality": false,
    "report-problem": false,
    "local-council": false,
  }.obs;
  final dynamic _switchValue = false.obs;
  get switchValue => _switchValue.value;
  set switchValue(value) => _switchValue.value = value;
  late final SharedPreferences prefs;

  final FirebaseMessaging _messaging = FirebaseMessaging.instance;

  notificationsEnabled() => topics.containsValue(true);

  setSubscription(String key, bool value) async {
    try {
      await prefs.setBool(key, value);
      value
          ? await _messaging.subscribeToTopic(key)
          : await _messaging.unsubscribeFromTopic(key);
      Logger().d("Subscribed to $key: $value");
      topics.update(key, (v) => value);
      topics.refresh();
    } catch (e) {
      Get.defaultDialog(
        title: 'error'.tr,
        middleText: "$e\n${"please-retry".tr}",
        textConfirm: 'ok'.tr,
      );
    }
  }

  setSubscriptionAll(bool value) => topics.forEach(
        (key, _) async => await setSubscription(key, value),
      );

  printToken() async =>
      await _messaging.getToken().then((value) => debugPrint(value));

  @override
  void onInit() async {
    prefs = await SharedPreferences.getInstance();
    topics.value = {
      "announces": prefs.getBool("announces") ?? false,
      "events": prefs.getBool("events") ?? false,
      "air-quality": prefs.getBool("air-quality") ?? false,
      "report-problem": prefs.getBool("report-problem") ?? false,
      "local-council": prefs.getBool("local-council") ?? false,
    };
    super.onInit();
  }
}

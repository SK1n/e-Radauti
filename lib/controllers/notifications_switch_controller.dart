import 'dart:async';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_loadingindicator/flutter_loadingindicator.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class NotificationsSwitchController extends GetxController {
  final topics = {
    "all": false,
    "events": false,
    "air": false,
    "reports": false,
  }.obs;
  final dynamic _switchValue = false.obs;
  get switchValue => _switchValue.value;
  set switchValue(value) => _switchValue.value = value;

  final FirebaseMessaging _messaging = FirebaseMessaging.instance;

  _saveToSharedPreferences(bool value) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setBool('subscribed', value);
    switchValue = value;
  }

  getSharedPreferencesValue() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.containsKey('subscribed')
        ? switchValue = prefs.getBool('subscribed')
        : switchValue = false;
  }

  subscribeToNotifications() async {
    EasyLoading.show();
    try {
      return await _messaging.subscribeToTopic('all').then(
        (value) async {
          Get.defaultDialog(
            barrierDismissible: false,
            title: 'Success!',
            content: const Text(
              'Din acest moment veti primi notificari!\nAceasta setare poate fi schimbata din setari!',
              textAlign: TextAlign.center,
            ),
            onConfirm: () => Get.back(),
          );
          EasyLoading.dismiss();
          await _saveToSharedPreferences(true);
        },
      ).timeout(
        const Duration(minutes: 1),
        onTimeout: () {
          throw TimeoutException('Timeout exception2');
        },
      );
    } on Exception catch (exception) {
      await _saveToSharedPreferences(false);
      EasyLoading.dismiss();
      return Get.defaultDialog(
        barrierDismissible: false,
        title: 'A intervenit o eroare!',
        content: Text(
          '$exception \nVa rugam sa incercati din nou',
        ),
        onConfirm: () => Get.back(),
      );
    }
  }

  unsubscribeFromNotifications() async {
    EasyLoading.show();
    try {
      _saveToSharedPreferences(false);
      return await _messaging.unsubscribeFromTopic('all').then(
        (value) {
          Get.defaultDialog(
            barrierDismissible: false,
            title: 'Success!',
            content: const Text(
              'Din acest moment nu veti mai primi notificari!\nAceasta setare poate fi schimbata din setari!',
              textAlign: TextAlign.center,
            ),
            onConfirm: () => Get.back(),
          );
          EasyLoading.dismiss();
        },
      ).timeout(
        const Duration(minutes: 1),
        onTimeout: () {
          throw TimeoutException('Timeout exception2');
        },
      );
    } catch (exception) {
      _saveToSharedPreferences(false);
      EasyLoading.dismiss();
      return Get.defaultDialog(
        barrierDismissible: false,
        title: 'A intervenit o eroare!',
        content: Text(
          'Aceasta este eroarea: $exception',
        ),
        onConfirm: () => Get.back(),
      );
    }
  }

  getToken() async {
    return await _messaging.getToken();
  }

  printToken() async {
    await getToken().then((value) => debugPrint(value));
  }

  @override
  void onInit() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    topics.value = {
      "all": sharedPreferences.getBool("all") ?? false,
      "events": sharedPreferences.getBool("events") ?? false,
      "reports": sharedPreferences.getBool("reports") ?? false,
      "air": sharedPreferences.getBool("air") ?? false,
    };
    super.onInit();
  }
}

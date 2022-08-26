import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_loadingindicator/flutter_loadingindicator.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class NotificationsSwitchController extends GetxController {
  dynamic _switchValue = false.obs;
  get switchValue => this._switchValue.value;
  set switchValue(value) => this._switchValue.value = value;

  FirebaseMessaging _messaging = FirebaseMessaging.instance;

  _saveToSharedPreferences(bool value) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setBool('subscribed', value);
  }

  getSharedPreferencesValue() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.containsKey('subscribed')
        ? this.switchValue = prefs.getBool('subscribed')
        : this.switchValue = false;
  }

  subscribeToNotifications() async {
    EasyLoading.show();
    try {
      _saveToSharedPreferences(true);
      return await _messaging.subscribeToTopic('all').then(
        (value) {
          Get.defaultDialog(
            title: 'Success!',
            content: Text(
              'Din acest moment veti primi notificari!\nAceasta setare poate fi schimbata din setari!',
              textAlign: TextAlign.center,
            ),
            actions: [
              TextButton(onPressed: () => Get.back(), child: Text('OK'))
            ],
          );
          EasyLoading.dismiss();
        },
      );
    } catch (exception) {
      _saveToSharedPreferences(false);
      EasyLoading.dismiss();
      return Get.defaultDialog(
        title: 'A intervenit o eroare!',
        content: Text(
          'Aceasta este eroarea: ' + exception.toString(),
        ),
        actions: [
          TextButton(
            onPressed: () => Get.back(),
            child: Text('OK'),
          ),
        ],
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
            title: 'Success!',
            content: Text(
              'Din acest moment nu veti mai primi notificari!\nAceasta setare poate fi schimbata din setari!',
              textAlign: TextAlign.center,
            ),
            actions: [
              TextButton(onPressed: () => Get.back(), child: Text('OK'))
            ],
          );
          EasyLoading.dismiss();
        },
      );
    } catch (exception) {
      _saveToSharedPreferences(false);
      EasyLoading.dismiss();
      return Get.defaultDialog(
        title: 'A intervenit o eroare!',
        content: Text(
          'Aceasta este eroarea: ' + exception.toString(),
        ),
        actions: [
          TextButton(
            onPressed: () => Get.back(),
            child: Text('OK'),
          ),
        ],
      );
    }
  }

  getToken() async {
    return await _messaging.getToken();
  }

  printToken() async {
    await getToken().then((value) => debugPrint(value));
  }
}

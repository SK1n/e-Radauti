import 'package:flutter/material.dart';
import 'package:flutterapperadauti/utils/base_controller.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DarkModeSwitchController extends BaseController {
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  final RxBool isLightTheme = false.obs;

  saveThemeStatus() async {
    SharedPreferences pref = await _prefs;
    pref.setBool('theme', isLightTheme.value);
  }

  getThemeStatus() async {
    var isLight = _prefs.then((SharedPreferences prefs) {
      return prefs.getBool('theme') ?? true;
    }).obs;
    isLightTheme.value = await isLight.value;
    Get.changeThemeMode(isLightTheme.value ? ThemeMode.light : ThemeMode.dark);
  }

  getCurrentTheme() async {
    return await _prefs.then((value) => value.getBool('theme') ?? true);
  }

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() async {
    super.onReady();
    await getThemeStatus();
  }
}

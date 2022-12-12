import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher_string.dart';

abstract class UrlLauncher {
  Future<void> launchUrl(String url) async {
    if (await canLaunchUrlString(url)) {
      await launchUrlString(url);
    } else {
      Get.defaultDialog(
        title: 'couldnt-open-link'.tr,
        middleText: '',
        onConfirm: () => Get.back(),
      );
    }
  }
}

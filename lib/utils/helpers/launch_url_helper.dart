import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';

mixin class UrlLauncher {
  Future<void> launchUrlS(String url) async {
    if (await canLaunchUrlString(url)) {
      await launchUrlString(url, mode: LaunchMode.externalApplication);
    } else {
      Get.defaultDialog(
        title: 'couldnt-open-link'.tr,
        middleText: '',
        onConfirm: () => Get.back(),
      );
    }
  }

  Future<void> launchUrlUri(Uri url) async {
    if (await canLaunchUrl(url)) {
      await launchUrl(
        url,
        mode: LaunchMode.externalApplication,
      );
    } else {
      Get.defaultDialog(
        title: 'couldnt-open-link'.tr,
        middleText: '',
        onConfirm: () => Get.back(),
      );
    }
  }
}

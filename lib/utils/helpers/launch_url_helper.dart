import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher_string.dart';

abstract class UrlLauncher {
  Future<void> launchUrl(String url) async {
    if (await canLaunchUrlString(url)) {
      await launchUrlString(url);
    } else {
      debugPrint('Nu se poate încărca');
      throw 'Nu se poate încărca $url';
    }
  }
}

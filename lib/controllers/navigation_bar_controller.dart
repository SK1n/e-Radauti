import 'package:auto_size_text/auto_size_text.dart';
import 'package:custom_navigation_bar/custom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:fluttericon/octicons_icons.dart';
import 'package:get/get.dart';

class NavigationBarController extends GetxController {
  List<CustomNavigationBarItem> items = [
    CustomNavigationBarItem(
      icon: const Icon(Octicons.report),
      title: AutoSizeText(
        'report-problem'.tr,
        style: const TextStyle(fontSize: 5),
        textAlign: TextAlign.center,
      ),
    ),
    CustomNavigationBarItem(
      icon: const Icon(Icons.calendar_today),
      title: AutoSizeText(
        'events'.tr,
        style: const TextStyle(fontSize: 5),
        textAlign: TextAlign.center,
      ),
    ),
    CustomNavigationBarItem(
      icon: const Icon(Icons.bubble_chart),
      title: AutoSizeText(
        'air-quality'.tr,
        style: const TextStyle(fontSize: 5),
        textAlign: TextAlign.center,
      ),
    ),
    CustomNavigationBarItem(
      icon: const Icon(Icons.location_city),
      title: AutoSizeText(
        'local-administration'.tr,
        style: const TextStyle(fontSize: 5),
        textAlign: TextAlign.center,
      ),
    ),
    CustomNavigationBarItem(
      icon: const Icon(Icons.perm_phone_msg),
      title: AutoSizeText(
        'usefull-numbers'.tr,
        style: const TextStyle(fontSize: 5),
        textAlign: TextAlign.center,
      ),
    ),
  ];
}

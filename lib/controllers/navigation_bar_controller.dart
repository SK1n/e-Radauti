import 'package:flutter/material.dart';
import 'package:fluttericon/octicons_icons.dart';
import 'package:get/get.dart';

class NavigationBarController extends GetxController {
  List<BottomNavigationBarItem> items = [
    BottomNavigationBarItem(
      icon: const Icon(Octicons.report),
      label: 'report-problem-short'.tr,
    ),
    BottomNavigationBarItem(
      icon: const Icon(Icons.calendar_today),
      label: 'events'.tr,
    ),
    BottomNavigationBarItem(
      icon: const Icon(Icons.bubble_chart),
      label: 'air-quality-short'.tr,
    ),
    BottomNavigationBarItem(
      icon: const Icon(Icons.location_city),
      label: 'local-administration-short'.tr,
    ),
    BottomNavigationBarItem(
      icon: const Icon(Icons.perm_phone_msg),
      label: 'usefull-numbers-short'.tr,
    ),
    BottomNavigationBarItem(
      icon: const Icon(Icons.perm_phone_msg),
      label: 'usefull-numbers-short'.tr,
    ),
    BottomNavigationBarItem(
      icon: const Icon(Icons.perm_phone_msg),
      label: 'usefull-numbers-short'.tr,
    ),
  ];
}

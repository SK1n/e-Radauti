import 'package:custom_navigation_bar/custom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutterapperadauti/routes/app_pages.dart';
import 'package:get/get.dart';

class NavigationBarController extends GetxController {
  List<CustomNavigationBarItem> items = [
    CustomNavigationBarItem(
      icon: const Icon(Icons.photo_filter),
    ),
    CustomNavigationBarItem(
      icon: const Icon(Icons.calendar_today),
    ),
    CustomNavigationBarItem(
      icon: const Icon(Icons.bubble_chart),
    ),
    CustomNavigationBarItem(
      icon: const Icon(Icons.location_city),
    ),
    CustomNavigationBarItem(
      icon: const Icon(Icons.perm_phone_msg),
    ),
  ];
}

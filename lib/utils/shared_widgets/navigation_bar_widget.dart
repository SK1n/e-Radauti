import 'package:custom_navigation_bar/custom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutterapperadauti/controllers/navigation_bar_controller.dart';
import 'package:flutterapperadauti/routes/app_pages.dart';
import 'package:get/get.dart';
import 'package:get/route_manager.dart';

class NavigationBarWidget extends StatelessWidget {
  const NavigationBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final NavigationBarController navigationBarController = Get.find();
    return Card(
      child: CustomNavigationBar(
        iconSize: 30.0,
        selectedColor: Get.theme.primaryColor,
        unSelectedColor: Get.theme.primaryColor,
        backgroundColor: Colors.transparent,
        items: navigationBarController.items,
        onTap: (index) {
          switch (index) {
            case 0:
              Get.toNamed(Routes.noticeProblem);
              break;
            case 1:
              Get.toNamed(Routes.events);
              break;
            case 2:
              Get.toNamed(Routes.air);
              break;
            case 3:
              Get.toNamed(Routes.townHall);
              break;
            case 4:
              Get.toNamed(Routes.phoneNumbers);
              break;
          }
        },
      ),
    );
  }
}

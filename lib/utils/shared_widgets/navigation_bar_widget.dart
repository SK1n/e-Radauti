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
      child: BottomNavigationBar(
        selectedItemColor: Get.theme.primaryColor,
        unselectedItemColor: Get.theme.primaryColor,
        selectedIconTheme: IconThemeData(color: Get.theme.primaryColor),
        unselectedIconTheme: IconThemeData(color: Get.theme.primaryColor),
        type: BottomNavigationBarType.fixed,
        iconSize: 20.0,
        items: navigationBarController.items,
        onTap: (index) {
          switch (index) {
            case 0:
              Get.toNamed(Routes.reportProblem);
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

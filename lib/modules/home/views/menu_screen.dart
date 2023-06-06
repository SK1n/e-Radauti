import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterapperadauti/modules/home/controllers/home_page_controller.dart';
import 'package:flutterapperadauti/modules/home/views/big_menu_item.dart';
import 'package:flutterapperadauti/modules/home/views/small_menu_item.dart';
import 'package:flutterapperadauti/routes/app_pages.dart';
import 'package:flutterapperadauti/utils/shared_widgets/app_scaffold/app_scaffold.dart';
import 'package:get/get.dart';

class MenuScreen extends GetView<HomePageController> {
  const MenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      appBarTitle: 'e-radauti'.tr,
      slivers: [
        GridView.count(
          physics: const NeverScrollableScrollPhysics(),
          crossAxisCount: 2,
          shrinkWrap: true,
          mainAxisSpacing: 10.0,
          crossAxisSpacing: 10.0,
          children: [
            BigMenuItem(
              title: 'report-problem'.tr,
              image: 'assets/buttons/report.png',
              bckImg: 1,
              onTap: () => Get.toNamed(Routes.reportProblem),
            ),
            BigMenuItem(
              title: 'events'.tr,
              image: 'assets/buttons/calendar.png',
              bckImg: 2,
              onTap: () => Get.toNamed(Routes.events),
            ),
            BigMenuItem(
              title: 'local-administration'.tr,
              image: 'assets/buttons/townhall.png',
              bckImg: 3,
              onTap: () => Get.toNamed(Routes.townHall),
            ),
            BigMenuItem(
              title: 'air-quality'.tr,
              image: 'assets/buttons/pollution.png',
              bckImg: 4,
              onTap: () => Get.toNamed(Routes.air),
            ),
          ],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Divider(
              thickness: 2,
            ),
            Row(
              children: [
                SmallMenuItem(
                  image: 'assets/buttons/phone.png',
                  title: 'usefull-numbers'.tr,
                  onTap: () => Get.toNamed(Routes.phoneNumbers),
                ),
                SmallMenuItem(
                  image: 'assets/buttons/announcement.png',
                  title: 'announces'.tr,
                  onTap: () => Get.toNamed(Routes.announcements),
                ),
              ],
            ),
            Row(
              children: [
                SmallMenuItem(
                  image: 'assets/buttons/volunteering.png',
                  title: 'volunteering'.tr,
                  onTap: () => Get.toNamed(Routes.volunteer),
                ),
                SmallMenuItem(
                  image: 'assets/buttons/transport.png',
                  title: 'transport'.tr,
                  onTap: () => Get.toNamed(Routes.transport),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}

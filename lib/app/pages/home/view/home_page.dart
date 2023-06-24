import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterapperadauti/app/pages/air_quality/view/air_quality_page.dart';
import 'package:flutterapperadauti/app/pages/events/view/events_page.dart';
import 'package:flutterapperadauti/app/pages/local_administration/local_administration_page.dart';

import 'package:flutterapperadauti/app/pages/report_problem/view/report_problem_page.dart';
import 'package:flutterapperadauti/modules/home/views/big_menu_item.dart';
import 'package:flutterapperadauti/modules/home/views/small_menu_item.dart';
import 'package:flutterapperadauti/routes/app_pages.dart';
import 'package:flutterapperadauti/utils/shared_widgets/app_scaffold/app_scaffold.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  static Page<void> page() => const MaterialPage<void>(child: HomePage());
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
              onTap: () =>
                  Navigator.of(context).push(ReportProblemPage.route()),
            ),
            BigMenuItem(
              title: 'events'.tr,
              image: 'assets/buttons/calendar.png',
              bckImg: 2,
              onTap: () => Navigator.of(context).push(EventsPage.route()),
            ),
            BigMenuItem(
              title: 'local-administration'.tr,
              image: 'assets/buttons/townhall.png',
              bckImg: 3,
              onTap: () =>
                  Navigator.of(context).push(LocalAdministrationPage.route()),
            ),
            BigMenuItem(
              title: 'air-quality'.tr,
              image: 'assets/buttons/pollution.png',
              bckImg: 4,
              onTap: () => Navigator.of(context).push(AirQualityPage.route()),
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

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterapperadauti/data/models/local_announcements/local_announcements_item_model.dart';
import 'package:flutterapperadauti/data/models/local_announcements/local_announcements_model.dart';
import 'package:flutterapperadauti/modules/air_quality/views/air_quality_center_view.dart';
import 'package:flutterapperadauti/modules/announcements/views/local_announcements_item.dart';
import 'package:flutterapperadauti/modules/menu/big_menu_item.dart';
import 'package:flutterapperadauti/modules/menu/small_menu_item.dart';
import 'package:flutterapperadauti/modules/report_a_problem/views/report_problem_map.dart';
import 'package:flutterapperadauti/routes/app_pages.dart';
import 'package:flutterapperadauti/utils/const.dart';
import 'package:flutterapperadauti/utils/helpers/get_data_firebase.dart';
import 'package:flutterapperadauti/utils/services/cloud_messaging_service.dart';
import 'package:flutterapperadauti/utils/shared_widgets/app_bar_widget.dart';
import 'package:flutterapperadauti/utils/shared_widgets/futuristic.dart';
import 'package:flutterapperadauti/utils/shared_widgets/nav_drawer.dart';
import 'package:flutterapperadauti/utils/shared_widgets/navigation_bar_widget.dart';
import 'package:get/get.dart';

class MenuScreen extends StatefulWidget {
  const MenuScreen({super.key});

  @override
  State<MenuScreen> createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> with GetDataFirebase {
  @override
  void initState() {
    CloudMessagingService cloudMessagingService = CloudMessagingService();
    Get.lazyPut(() => cloudMessagingService);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: CustomScrollView(
        slivers: [
          AppBarWidget(
            content: 'e-radauti'.tr,
            leading: Icons.home,
          ),
          SliverPadding(
            padding:
                const EdgeInsets.only(left: leftMargin, right: rightMargin),
            sliver: SliverList(
              delegate: SliverChildListDelegate(
                [
                  const AirQualityCenterView(),
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
                ],
              ),
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.only(
              left: leftMargin,
              right: rightMargin,
              top: 20,
            ),
            sliver: SliverToBoxAdapter(
              child: Column(
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
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutterapperadauti/routes/app_pages.dart';
import 'package:flutterapperadauti/modules/menu/menu_item.dart';
import 'package:flutterapperadauti/utils/services/cloud_messaging_service.dart';
import 'package:flutterapperadauti/utils/shared_widgets/app_bar_widget.dart';
import 'package:flutterapperadauti/utils/shared_widgets/nav_drawer.dart';
import 'package:fluttericon/font_awesome5_icons.dart';
import 'package:get/get.dart';

class MenuScreen extends StatefulWidget {
  const MenuScreen({super.key});

  @override
  State<MenuScreen> createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  @override
  void initState() {
    CloudMessagingService cloudMessagingService = CloudMessagingService();
    Get.lazyPut(() => cloudMessagingService);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      endDrawer: const NavDrawer(),
      body: CustomScrollView(
        slivers: [
          AppBarWidget(
            content: 'e-radauti'.tr,
            leading: Icons.home,
          ),
          SliverToBoxAdapter(
            child: GridView.count(
              padding: const EdgeInsets.all(10),
              crossAxisSpacing: 5,
              mainAxisSpacing: 5,
              crossAxisCount: 2,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              children: [
                MenuItem(
                    title: 'report-problem'.tr,
                    iconData: Icons.photo_filter,
                    route: Routes.noticeProblem),
                MenuItem(
                    title: 'local-administration'.tr,
                    iconData: Icons.location_city,
                    route: Routes.townHall),
                MenuItem(
                    title: 'events'.tr,
                    iconData: Icons.calendar_today,
                    route: Routes.events),
                MenuItem(
                    title: 'usefull-numbers'.tr,
                    iconData: Icons.perm_phone_msg,
                    route: Routes.phoneNumbers),
                MenuItem(
                    title: 'announces'.tr,
                    iconData: Icons.announcement,
                    route: Routes.announcements),
                MenuItem(
                    title: 'air-quality'.tr,
                    iconData: Icons.bubble_chart,
                    route: Routes.air),
                MenuItem(
                    title: 'transport'.tr,
                    iconData: Icons.train,
                    route: Routes.transport),
                MenuItem(
                  title: 'volunteering'.tr,
                  iconData: FontAwesome5.hand_holding_heart,
                  route: Routes.volunteer,
                ),
              ],
            ),
          ),
          SliverToBoxAdapter(
            child: SizedBox(
              height: 50,
              child: Column(
                children: <Widget>[
                  SizedBox(
                    height: 17,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        InkWell(
                          child: Text(
                            'about-us'.tr,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              decoration: TextDecoration.underline,
                              color: Color(0xFF32325D),
                              fontSize: 15,
                            ),
                          ),
                          onTap: () => Get.toNamed(Routes.about),
                        ),
                        const VerticalDivider(
                          color: Colors.black,
                        ),
                        InkWell(
                          child: Text(
                            'privacy'.tr,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              decoration: TextDecoration.underline,
                              color: Color(0xFF32325D),
                              fontSize: 15,
                            ),
                          ),
                          onTap: () => Get.toNamed(Routes.confidential),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      InkWell(
                        child: Text(
                          'partners'.tr,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            decoration: TextDecoration.underline,
                            color: Color(0xFF32325D),
                            fontSize: 15,
                          ),
                        ),
                        onTap: () => Get.toNamed(Routes.partner),
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

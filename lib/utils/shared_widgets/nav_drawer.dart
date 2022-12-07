import 'package:flutter/material.dart';
import 'package:flutterapperadauti/routes/app_pages.dart';
import 'package:fluttericon/font_awesome5_icons.dart';
import 'package:get/get.dart';

class NavDrawer extends StatelessWidget {
  const NavDrawer({super.key});
  Widget addDrawerHeaderIcon() {
    return Container(
      padding: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
      margin: const EdgeInsets.fromLTRB(15.0, 5.0, 0.0, 5.0),
      child: Stack(
        alignment: AlignmentDirectional.center,
        children: <Widget>[
          Image.asset(
            "assets/logo_images/app_logo.png",
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            child: addDrawerHeaderIcon(),
          ),
          listTile(Icons.person_4, "my-account".tr, Routes.account),
          listTile(
              Icons.photo_filter, 'report-problem'.tr, Routes.noticeProblem),
          listTile(
              Icons.location_city, 'local-administration'.tr, Routes.townHall),
          listTile(Icons.calendar_today, 'events'.tr, Routes.events),
          listTile(
              Icons.perm_phone_msg, 'usefull-numbers'.tr, Routes.phoneNumbers),
          listTile(Icons.announcement, 'announces'.tr, Routes.announcements),
          listTile(Icons.bubble_chart, 'air-quality'.tr, Routes.air),
          listTile(Icons.train, 'transport'.tr, Routes.transport),
          listTile(FontAwesome5.hand_holding_heart, 'volunteering'.tr,
              Routes.volunteer),
          listTile(Icons.settings, 'settings'.tr, Routes.settings),
          listTile(
            Icons.exit_to_app,
            "sign-out".tr,
            Routes.signIn,
            onTap: () {
              debugPrint("logging out");
            },
          ),
        ],
      ),
    );
  }

  ListTile listTile(icon, title, route, {Function()? onTap}) {
    return ListTile(
      leading: Icon(
        icon,
      ),
      title: Text(title),
      onTap: onTap ??
          () {
            Get.toNamed(route);
          },
    );
  }
}

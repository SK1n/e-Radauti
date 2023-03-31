import 'package:flutter/material.dart';
import 'package:flutterapperadauti/routes/app_pages.dart';
import 'package:flutterapperadauti/utils/assets.dart';
import 'package:fluttericon/entypo_icons.dart';
import 'package:fluttericon/font_awesome5_icons.dart';
import 'package:fluttericon/iconic_icons.dart';
import 'package:get/get.dart';

class NavDrawer extends StatelessWidget {
  const NavDrawer({super.key});
  Widget addDrawerHeaderIcon() {
    return Column(
      children: [
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(Icons.person_outline_rounded),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  // TODO: make dynamic data for name and email :::>
                  Text('Luis Scripcaru'),
                  Text(
                    'luis.scripcaru@outlook.com',
                    style: TextStyle(
                      color: Colors.black38,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        listTile(null, 'my-account'.tr, Routes.account),
      ],
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
          listTile(Assets.assetsDrawerHome, 'home'.tr, Routes.home),
          listTile(Assets.assetsDrawerReportProblem, 'report-problem'.tr,
              Routes.reportProblem),
          listTile(Assets.assetsDrawerLocalAdministration,
              'local-administration'.tr, Routes.townHall),
          listTile(Assets.assetsDrawerEvents, 'events'.tr, Routes.events),
          listTile(Assets.assetsDrawerUsefullInfo, 'useful-information'.tr,
              Routes.home),
          listTile(Assets.assetsDrawerAirQuality, 'air-quality'.tr, Routes.air),
        ],
      ),
    );
  }

  Widget listTile(icon, title, route, {Function()? onTap}) {
    return Container(
      margin: EdgeInsets.all(icon != null ? 10 : 0),
      child: InkWell(
        onTap: onTap ??
            () {
              Get.back();
              Get.toNamed(route);
            },
        child: Row(
          children: [
            SizedBox(
              width: 14,
              height: 14,
              child: icon != null ? Image.asset(icon) : Container(),
            ),
            Container(
              margin: EdgeInsets.only(left: icon != null ? 10 : 0),
              child: Text(
                title,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

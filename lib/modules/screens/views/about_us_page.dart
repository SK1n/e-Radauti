import 'package:flutter/material.dart';
import 'package:flutterapperadauti/modules/screens/views/about_us_app.dart';
import 'package:flutterapperadauti/modules/screens/views/about_us_content.dart';

import 'package:flutterapperadauti/utils/shared_widgets/app_bar_model.dart';
import 'package:flutterapperadauti/utils/shared_widgets/nav_drawer.dart';
import 'package:get/get.dart';

class AboutUsPage extends StatelessWidget {
  const AboutUsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Tab> tabs = [
      Tab(
        child: Text('about-us'.tr.toUpperCase()),
      ),
      Tab(
        child: Text('about-app'.tr.toUpperCase()),
      ),
    ];
    return Scaffold(
      endDrawer: const NavDrawer(),
      body: DefaultTabController(
        length: tabs.length,
        child: NestedScrollView(
            headerSliverBuilder: (context, innerBoxIsScrolled) {
              return [
                AppBarUi(
                  content: 'about-us'.tr,
                  leading: Icons.add_box_outlined,
                  bottom: TabBar(tabs: tabs),
                )
              ];
            },
            body: const TabBarView(
              children: [
                AboutUsContent(),
                AboutUsApp(),
              ],
            )),
      ),
    );
  }
}

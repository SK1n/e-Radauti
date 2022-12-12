import 'package:flutter/material.dart';
import 'package:flutterapperadauti/modules/air_quality/views/air_quality.dart';
import 'package:flutterapperadauti/modules/air_quality/views/air_quality_charts_page.dart';
import 'package:flutterapperadauti/utils/shared_widgets/app_bar_widget.dart';
import 'package:flutterapperadauti/utils/shared_widgets/nav_drawer.dart';
import 'package:fluttericon/font_awesome5_icons.dart';
import 'package:get/get.dart';

class AirQualityPage extends StatelessWidget {
  const AirQualityPage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Tab> tabs = [
      Tab(
        icon: const Icon(Icons.air),
        child: Text('air-quality'.tr.toUpperCase()),
      ),
      Tab(
        icon: const Icon(FontAwesome5.chart_bar),
        child: Text('graphs'.tr),
      ),
    ];
    return Scaffold(
      endDrawer: const NavDrawer(),
      body: DefaultTabController(
        length: 2,
        child: NestedScrollView(
          headerSliverBuilder: (context, innerBoxIsScrolled) => [
            AppBarWidget(
              leading: Icons.bubble_chart,
              content: 'air-quality'.tr,
              bottom: TabBar(tabs: tabs),
            ),
          ],
          body: const TabBarView(
            children: [
              AirQuality(),
              AirQualityChartsPage(),
            ],
          ),
        ),
      ),
    );
  }
}

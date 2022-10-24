import 'package:flutter/material.dart';
import 'package:flutterapperadauti/modules/air_quality/views/air_quality.dart';
import 'package:flutterapperadauti/modules/air_quality/views/air_quality_charts_page.dart';
import 'package:flutterapperadauti/utils/shared_widgets/app_bar_model.dart';
import 'package:flutterapperadauti/utils/shared_widgets/nav_drawer.dart';
import 'package:fluttericon/font_awesome5_icons.dart';

class AirQualityPage extends StatelessWidget {
  const AirQualityPage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Tab> tabs = [
      const Tab(
        icon: Icon(Icons.air),
        child: Text('CALITATEA AERULUI'),
      ),
      const Tab(
        icon: Icon(FontAwesome5.chart_bar),
        child: Text('GRAFICE'),
      ),
    ];
    return Scaffold(
      endDrawer: const NavDrawer(),
      body: DefaultTabController(
        length: 2,
        child: NestedScrollView(
          headerSliverBuilder: (context, innerBoxIsScrolled) => [
            AppBarUi(
              leading: Icons.bubble_chart,
              content: 'Calitatea aerului',
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

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterapperadauti/modules/air_quality/views/current_air_quality/current_air_quality_page.dart';
import 'package:flutterapperadauti/modules/air_quality/views/charts/air_quality_charts_page.dart';
import 'package:flutterapperadauti/utils/shared_widgets/custom_cupertino_page_scaffold.dart';
import 'package:fluttericon/font_awesome5_icons.dart';
import 'package:get/get.dart';

class AirQualityPage extends StatelessWidget {
  const AirQualityPage({super.key});

  @override
  Widget build(BuildContext context) {
    List<Widget> pages = const [
      CurrentAirQualityPage(),
      AirQualityChartsPage()
    ];
    return CupertinoTabScaffold(
      tabBar: CupertinoTabBar(
        items: [
          BottomNavigationBarItem(
            label: 'air-quality'.tr,
            icon: const Icon(Icons.air),
          ),
          BottomNavigationBarItem(
            label: 'graphs'.tr,
            icon: const Icon(
              FontAwesome5.chart_area,
            ),
          ),
        ],
      ),
      tabBuilder: (_, index) => CupertinoTabView(
        builder: (_) => CustomCupertinoPageScaffold(
          navBarMiddle: 'air-quality'.tr,
          navBarLeading: InkWell(
            child: const Icon(CupertinoIcons.back),
            onTap: () => Get.back(),
          ),
          slivers: [
            SliverToBoxAdapter(
              child: pages[index],
            ),
          ],
        ),
      ),
    );
  }
}

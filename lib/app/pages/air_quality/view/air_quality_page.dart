import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutterapperadauti/app/utils/scaffolds/app_tabs_scaffold.dart';
import 'package:flutterapperadauti/gen/strings.g.dart';
import 'quality_tab.dart';
import 'tab_charts.dart';
import 'tab_map.dart';

class AirQualityPage extends StatelessWidget {
  const AirQualityPage({super.key});

  static Route<void> route() {
    return MaterialPageRoute<void>(builder: (_) => const AirQualityPage());
  }

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> tabs = [
      {
        'text': t.airQuality.airQualityTab,
        'widget': const QualityTab(),
      },
      {
        'text': t.airQuality.chartsTab,
        'widget': const TabCharts(),
      },
      {
        'text': t.airQuality.mapTab,
        'widget': const TabMap(),
      }
    ];
    return AppTabsScaffold(
      tabs: tabs,
      appBarTitle: t.airQuality.title,
    );
  }
}

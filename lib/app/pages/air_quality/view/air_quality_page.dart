import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../cubit/air_quality_cubit.dart';
import 'quality_tab.dart';
import 'tab_charts.dart';
import 'tab_map.dart';
import '../../../utils/scaffolds/app_tabs_scaffold.dart';
import '../../../../gen/strings.g.dart';

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
    return BlocProvider.value(
      value: AirQualityCubit()..getQuality(),
      child: AppTabsScaffold(
        tabs: tabs,
        appBarTitle: t.airQuality.title,
      ),
    );
  }
}

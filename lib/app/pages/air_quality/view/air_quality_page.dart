import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterapperadauti/app/i18n/strings.g.dart';
import 'package:flutterapperadauti/app/pages/air_quality/cubit/air_quality_cubit.dart';
import 'package:flutterapperadauti/app/pages/air_quality/view/quality_tab.dart';
import 'package:flutterapperadauti/utils/shared_widgets/app_scaffold/app_tabs_scaffold.dart';

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
        'widget': const QualityTab(),
      },
      {
        'text': t.airQuality.aboutTab,
        'widget': const QualityTab(),
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

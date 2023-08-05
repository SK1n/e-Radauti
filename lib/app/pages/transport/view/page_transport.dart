import 'package:flutter/material.dart';
import 'package:flutterapperadauti/app/utils/app_constants.dart';
import 'tab_taxi.dart';
import 'tab_train.dart';
import '../../../../gen/strings.g.dart';
import '../../../utils/scaffolds/app_tabs_scaffold.dart';

class PageTransport extends StatelessWidget {
  const PageTransport({super.key});

  static Route<void> route() {
    return MaterialPageRoute<void>(builder: (_) => const PageTransport());
  }

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> tabs = [
      {
        'text': context.t.transport.taxiTab,
        'widget': const TabTaxi(),
      },
      {
        'text': context.t.transport.trainTab,
        'widget': const TabTrain(),
      }
    ];
    return AppTabsScaffold(
      tabs: tabs,
      expandedHeight: AppConstants.expandedHeight,
      appBarTitle: context.t.transport.title,
    );
  }
}

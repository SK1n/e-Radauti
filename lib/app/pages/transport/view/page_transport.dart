import 'package:flutter/material.dart';
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
        'text': t.transport.taxiTab,
        'widget': const TabTaxi(),
      },
      {
        'text': t.transport.trainTab,
        'widget': const TabTrain(),
      }
    ];
    return AppTabsScaffold(
      tabs: tabs,
      expandedHeight: 150,
      appBarTitle: t.transport.title,
    );
  }
}

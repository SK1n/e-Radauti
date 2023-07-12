import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'tab_local_council_leaders.dart';
import '../../../gen/strings.g.dart';
import 'tab_local_council.dart';
import '../../utils/scaffolds/app_tabs_scaffold.dart';

@RoutePage()
class PageLocalAdministration extends StatelessWidget {
  const PageLocalAdministration({super.key});

  static Route<void> route() {
    return MaterialPageRoute<void>(
        builder: (_) => const PageLocalAdministration());
  }

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> tabs = [
      {
        'text': t.localAdministration.localCouncilTab,
        'widget': const TabLocalCouncil(),
      },
      {
        'text': t.localAdministration.localCouncilLeaders,
        'widget': const TabLocalCouncilLeaders(),
      }
    ];
    return AppTabsScaffold(
      tabs: tabs,
      expandedHeight: 150,
      appBarTitle: t.localAdministration.title,
    );
  }
}

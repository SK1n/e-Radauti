import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutterapperadauti/app/i18n/strings.g.dart';
import 'package:flutterapperadauti/app/pages/report_problem/view/report_problem_form_tab.dart';
import 'package:flutterapperadauti/app/pages/report_problem/view/report_problem_map_tab.dart';
import 'package:flutterapperadauti/app/pages/report_problem/view/report_problem_my_reports_tab.dart';
import 'package:flutterapperadauti/modules/report_a_problem/views/report_problem_form.dart';
import 'package:flutterapperadauti/utils/shared_widgets/app_scaffold/app_tabs_scaffold.dart';

class ReportProblemPage extends StatelessWidget {
  const ReportProblemPage({super.key});

  static Route<void> route() {
    return MaterialPageRoute<void>(builder: (_) => const ReportProblemPage());
  }

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> tabs = [
      {
        'text': t.events.newEventsTabTitle,
        'widget': const ReportProblemFormTab(),
      },
      {
        'text': t.events.oldEventsTabTitle,
        'widget': const ReportProblemMapTab(),
      },
      {
        'text': t.events.favoritesEventsTabTitle,
        'widget': const ReportProblemMyReportsTab(),
      }
    ];
    return AppTabsScaffold(tabs: tabs, appBarTitle: '');
  }
}

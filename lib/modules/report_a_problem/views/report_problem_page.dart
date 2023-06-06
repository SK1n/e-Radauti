import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterapperadauti/modules/report_a_problem/views/my_reports_page.dart';
import 'package:flutterapperadauti/modules/report_a_problem/views/report_problem_map.dart';
import 'package:flutterapperadauti/modules/report_a_problem/views/report_problem_form.dart';
import 'package:flutterapperadauti/utils/shared_widgets/app_scaffold/app_tabs_scaffold.dart';
import 'package:flutterapperadauti/utils/shared_widgets/custom_page_scaffold.dart';
import 'package:get/get.dart';

class ReportProblemPage extends StatelessWidget {
  const ReportProblemPage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> tabs = [
      {
        'text': 'form'.tr,
        'widget': const ReportProblemForm(),
      },
      {
        'text': 'report-map'.tr,
        'widget': const ReportProblemMap(),
      },
      {
        'text': 'my-reports'.tr,
        'widget': const MyReportsPage(),
      }
    ];
    return AppTabsScaffold(tabs: tabs, appBarTitle: 'report-problem'.tr);
  }
}

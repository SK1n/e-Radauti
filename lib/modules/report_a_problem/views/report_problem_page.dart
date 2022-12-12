import 'package:flutter/material.dart';
import 'package:flutterapperadauti/modules/report_a_problem/views/report_problem_map.dart';
import 'package:flutterapperadauti/modules/report_a_problem/views/report_problem_form.dart';

import 'package:flutterapperadauti/utils/shared_widgets/app_bar_widget.dart';
import 'package:flutterapperadauti/utils/shared_widgets/nav_drawer.dart';
import 'package:get/get.dart';

class ReportProblemPage extends StatelessWidget {
  const ReportProblemPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      endDrawer: const NavDrawer(),
      body: CustomScrollView(
        slivers: [
          AppBarWidget(
            leading: Icons.camera,
            content: 'report-problem'.tr,
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: ReportProblemMap(),
                ),
                SizedBox(
                  height: 40,
                  child: Center(
                    child: Text('send-report'.tr),
                  ),
                ),
                const ReportProblemForm(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

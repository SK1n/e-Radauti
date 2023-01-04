import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterapperadauti/modules/report_a_problem/views/report_problem_map.dart';
import 'package:flutterapperadauti/modules/report_a_problem/views/report_problem_form.dart';
import 'package:flutterapperadauti/utils/const.dart';

import 'package:flutterapperadauti/utils/shared_widgets/app_bar_widget.dart';
import 'package:get/get.dart';

class ReportProblemPage extends StatelessWidget {
  const ReportProblemPage({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: CustomScrollView(
        slivers: [
          AppBarWidget(
            leading: Icons.camera,
            content: 'report-problem'.tr,
          ),
          SliverPadding(
            padding:
                const EdgeInsets.only(left: leftMargin, right: rightMargin),
            sliver: SliverList(
              delegate: SliverChildListDelegate(
                [
                  const ReportProblemMap(),
                  const ReportProblemForm(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

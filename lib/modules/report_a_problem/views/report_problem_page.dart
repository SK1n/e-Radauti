import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterapperadauti/modules/report_a_problem/views/report_problem_map.dart';
import 'package:flutterapperadauti/modules/report_a_problem/views/report_problem_form.dart';
import 'package:flutterapperadauti/utils/shared_widgets/custom_cupertino_page_scaffold.dart';
import 'package:get/get.dart';

class ReportProblemPage extends StatelessWidget {
  const ReportProblemPage({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomCupertinoPageScaffold(
      navBarMiddle: 'report-problem'.tr,
      slivers: [
        SliverList(
          delegate: SliverChildListDelegate(
            [
              const ReportProblemMap(),
              const ReportProblemForm(),
            ],
          ),
        ),
      ],
    );
  }
}

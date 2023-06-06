import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutterapperadauti/data/models/notice_problem_map/markers_model.dart';
import 'package:flutterapperadauti/utils/shared_widgets/app_scaffold/app_scaffold.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:intl/intl.dart';

extension TextStyle2 on Text {
  Widget textTitle() {
    return Text(
      data!,
      style: const TextStyle(
        fontSize: 14.0,
        color: Color(0xFF6B7280),
        fontWeight: FontWeight.w500,
        fontFamily: 'Inter',
      ),
    );
  }

  Widget textBody() {
    return Text(
      data!,
      style: TextStyle(
        fontSize: 14.0,
        color: Colors.grey[800],
        fontWeight: FontWeight.w500,
        fontFamily: 'Inter',
      ),
    );
  }
}

extension DatePreview on String {
  String formatDate() {
    DateTime date = DateTime.parse(this);
    return DateFormat('dd MMMM yyyy', 'ro_RO').format(date);
  }
}

class ReportPreview extends StatelessWidget {
  const ReportPreview({super.key});

  @override
  Widget build(BuildContext context) {
    final MarkersModel data = Get.arguments[0];
    return AppScaffold(
      appBarTitle: 'my-reports'.tr,
      slivers: [
        Text('subject'.tr).textTitle(),
        Text(data.subject).textBody(),
        Text('description'.tr).textTitle(),
        Text(data.description).textBody(),
        Text('institution'.tr).textTitle(),
        Text(data.institution).textBody(),
        data.createdAt != null
            ? Text('report-date'.tr).textTitle()
            : Container(),
        data.createdAt != null
            ? Text(data.createdAt!.toString().formatDate()).textBody()
            : Container(),
      ],
    );
  }
}

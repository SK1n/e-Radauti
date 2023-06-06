import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterapperadauti/modules/report_a_problem/controllers/my_reports_controller.dart';
import 'package:flutterapperadauti/routes/app_pages.dart';
import 'package:flutterapperadauti/utils/loading_widget.dart';
import 'package:flutterapperadauti/utils/shared_widgets/empty_widget.dart';
import 'package:flutterapperadauti/utils/shared_widgets/err_widget.dart';
import 'package:get/get.dart';

class MyReportsPage extends GetView<MyReportsController> {
  const MyReportsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return controller.obx(
      (data) => SliverList.builder(
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: InkWell(
              onTap: () =>
                  Get.toNamed(Routes.previewReport, arguments: [data[index]]),
              child: Card(
                  child: ListTile(
                      title: Text(
                          '${data![index].subject!} | ${data[index].institutionEmail}'))),
            ),
          );
        },
        itemCount: data?.length ?? 0,
      ),
      onError: (error) => SliverToBoxAdapter(
        child: ErrWidget(
          error: error.toString(),
          retry: () async => await controller.getReports(),
        ),
      ),
      onEmpty: SliverToBoxAdapter(
        child: EmptyWidget(
          text: 'empty-reports'.tr,
        ),
      ),
      onLoading: const SliverToBoxAdapter(child: LoadingWidget()),
    );
  }
}

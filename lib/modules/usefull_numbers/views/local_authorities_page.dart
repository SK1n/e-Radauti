import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterapperadauti/modules/usefull_numbers/controllers/usefull_numbers_controller.dart';
import 'package:flutterapperadauti/modules/usefull_numbers/views/usefull_numbers_widget.dart';
import 'package:flutterapperadauti/utils/loading_widget.dart';
import 'package:get/get.dart';

class LocalAuthoritiesPage extends GetView<UsefullNumbersController> {
  const LocalAuthoritiesPage({super.key});
  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Obx(
        () {
          if (controller.isLoading) {
            return const LoadingWidget();
          }
          if (controller.hasErrors) {
            throw Exception();
          }
          return ListView.builder(
            shrinkWrap: true,
            itemCount: controller.publicInstitutions.length,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (BuildContext context, int index) {
              var data = controller.publicInstitutions[index];
              return UsefullNumbersWidget(
                title: data.title,
                phone: data.phoneNumbers,
                email: data.emails,
              );
            },
          );
        },
      ),
    );
  }
}

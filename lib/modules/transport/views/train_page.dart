import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterapperadauti/modules/transport/controllers/transport_controller.dart';
import 'package:flutterapperadauti/modules/transport/views/train_list_tile.dart';
import 'package:flutterapperadauti/utils/loading_widget.dart';
import 'package:get/get.dart';

class TrainPage extends GetView<TransportController> {
  const TrainPage({super.key});
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
            itemCount: controller.trainList.length,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (BuildContext context, int index) {
              var data = controller.trainList[index];
              return ListTileRoute(
                leadinIcon: Icons.train,
                title: data.route!,
                timeArray: data.timeTable!,
                subTitle: data.train!,
                trainRoute: data.stations!,
              );
            },
          );
        },
      ),
    );
  }
}

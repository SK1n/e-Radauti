import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterapperadauti/modules/transport/controllers/transport_controller.dart';
import 'package:flutterapperadauti/modules/transport/views/taxi_item.dart';
import 'package:flutterapperadauti/utils/loading_widget.dart';
import 'package:get/get.dart';

class TaxiPage extends GetView<TransportController> {
  const TaxiPage({super.key});

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
              return TaxiItem(
                url: data.image,
                driver: data.driverName,
                phone: data.phoneNumber,
                car: data.carType,
                plate: data.plateNumber,
              );
            },
          );
        },
      ),
    );
  }
}

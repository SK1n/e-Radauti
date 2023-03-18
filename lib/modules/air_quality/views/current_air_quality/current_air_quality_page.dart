import 'package:flutter/material.dart';
import 'package:flutterapperadauti/data/models/air_quality/air_quality_item_model.dart';
import 'package:flutterapperadauti/modules/air_quality/controllers/air_quality_controller.dart';
import 'package:flutterapperadauti/modules/air_quality/views/current_air_quality/air_quality_satu_mare_item.dart';
import 'package:flutterapperadauti/modules/air_quality/views/current_air_quality/center_air_quality_item.dart';
import 'package:flutterapperadauti/modules/air_quality/views/legend/air_quality_legend.dart';
import 'package:flutterapperadauti/utils/shared_widgets/futuristic.dart';
import 'package:get/get.dart';

class CurrentAirQualityPage extends StatelessWidget {
  const CurrentAirQualityPage({super.key});
  @override
  Widget build(BuildContext context) {
    final AirQualityController airQualityController = Get.find();
    return Futuristic(
      futureBuilder: () => airQualityController.getAirQualityCurrent(),
      dataBuilder: (context, snapshot) {
        AirQualityItemModel data = snapshot as AirQualityItemModel;
        return Column(
          children: [
            CenterAirQualityItem(data),
            AirQualitySatuMare(data),
            const AirQualityLegend(),
          ],
        );
      },
      initialBuilder: (_, __) => Container(),
    );
  }
}

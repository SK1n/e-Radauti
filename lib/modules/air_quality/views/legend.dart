import 'package:flutter/material.dart';
import 'package:flutterapperadauti/modules/air_quality/views/color_legend_widget.dart';
import 'package:flutterapperadauti/modules/air_quality/views/legend_widget.dart';
import 'package:get/get.dart';

class AirQualityLegend extends StatelessWidget {
  const AirQualityLegend({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        LegendWidget(
            collapsedTitle: 'device-location?'.tr,
            expandedTitle: 'device-location?'.tr,
            expandedContent: 'device-location'.tr),
        LegendWidget(
            collapsedTitle: 'what-is-pm25?'.tr,
            expandedTitle: 'what-is-pm25?'.tr,
            expandedContent: 'what-is-pm25'.tr),
        LegendWidget(
          collapsedTitle: 'color-meaning?'.tr,
          expandedTitle: 'color-meaning?'.tr,
          expandedWidget: const ColorLegendWidget(),
        ),
        LegendWidget(
            collapsedTitle: 'what-does-the-law-say?'.tr,
            expandedTitle: 'what-does-the-law-say?'.tr,
            expandedContent: 'what-does-the-law-say'.tr),
        LegendWidget(
            collapsedTitle: 'where-to-find-more-info?'.tr,
            expandedTitle: 'where-to-find-more-info?'.tr,
            expandedContent: 'where-to-find-more-info'.tr),
      ],
    );
  }
}
//

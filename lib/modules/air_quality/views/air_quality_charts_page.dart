import 'package:flutter/material.dart';
import 'package:flutterapperadauti/modules/air_quality/controllers/air_quality_controller.dart';
import 'package:flutterapperadauti/modules/air_quality/views/create_chart.dart';
import 'package:flutterapperadauti/utils/helpers/get_data_firebase.dart';
import 'package:flutterapperadauti/utils/shared_widgets/futuristic.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class AirQualityChartsPage extends StatelessWidget with GetDataFirebase {
  const AirQualityChartsPage({super.key});
  @override
  Widget build(BuildContext context) {
    final AirQualityController airQualityController = Get.find();
    return Futuristic(
      futureBuilder: () => airQualityController.getDataCharts(),
      dataBuilder: (context, snapshot) {
        return Column(
          children: [
            CreateChart(
              data: [
                LineSeries(
                  name: 'radauti-center'.tr,
                  dataSource: airQualityController.dataChartPmVsTimeCenter,
                  xValueMapper: (ChartSampleData data, _) => data.x,
                  yValueMapper: (ChartSampleData data, _) => data.yValue,
                  color: const Color.fromRGBO(242, 117, 7, 1),
                  // change the line color based on valu
                  // TODO: find a way to represend the line in legend
                  // pointColorMapper: (data, index) => Color.fromARGB(
                  //   255,
                  //   data.color!.r.toInt(),
                  //   data.color!.g.toInt(),
                  //   data.color!.b.toInt(),
                  // ),
                  legendIconType: LegendIconType.circle,
                  width: 3,
                ),
                LineSeries(
                  name: 'radauti-iesire-dornesti'.tr,
                  dataSource: airQualityController.dataChartPmVsTimeDornesti,
                  xValueMapper: (ChartSampleData data, _) => data.x,
                  yValueMapper: (ChartSampleData data, _) => data.yValue,
                  color: const Color.fromARGB(255, 26, 168, 45),
                  legendIconType: LegendIconType.circle,
                  width: 3,
                ),
                LineSeries(
                  name: 'limit-pm'.tr,
                  dashArray: <double>[15, 3, 3, 3],
                  dataSource: airQualityController.recommendedPmValue,
                  xValueMapper: (ChartSampleData data, _) => data.x,
                  yValueMapper: (ChartSampleData data, _) => data.yValue,
                  color: Color.fromARGB(255, 86, 26, 104),
                  isVisibleInLegend: true,
                  width: 1,
                ),
              ],
              interactiveTooltipFormat:
                  'point.x : ${'pm'.trParams({"value": 'point.y'})}',
              axisTitle: 'pm'.trParams({"value": ""}),
              chartTitle: 'pm-time',
              legend: Legend(
                isResponsive: true,
                isVisible: true,
                alignment: ChartAlignment.center,
                position: LegendPosition.bottom,
                overflowMode: LegendItemOverflowMode.scroll,
                orientation: LegendItemOrientation.vertical,
                shouldAlwaysShowScrollbar: true,
              ),
            ),
            CreateChart(
              data: [
                LineSeries(
                  dataSource: airQualityController.dataChartCoVsTime,
                  xValueMapper: (ChartSampleData data, _) => data.x,
                  yValueMapper: (ChartSampleData data, _) => data.yValue,
                  color: const Color.fromRGBO(242, 117, 7, 1),
                  legendIconType: LegendIconType.circle,
                  width: 3,
                ),
              ],
              interactiveTooltipFormat:
                  'point.x : ${'co'.trParams({"value": 'point.y'})}',
              axisTitle: 'co'.trParams({"value": ""}),
              chartTitle: 'co2-time',
              legend: Legend(),
            ),
            CreateChart(
              data: [
                LineSeries(
                  name: 'pm'.trParams({"value": ""}),
                  dataSource: airQualityController.dataChartPmVsTimeCenter,
                  xValueMapper: (ChartSampleData data, _) => data.x,
                  yValueMapper: (ChartSampleData data, _) => data.yValue,
                  color: const Color.fromRGBO(242, 117, 7, 1),
                  legendIconType: LegendIconType.circle,
                  width: 3,
                ),
                LineSeries(
                  name: 'wind-speed'.tr,
                  dataSource: airQualityController.dataChartWindVsTimeCenter,
                  xValueMapper: (ChartSampleData data, _) => data.x,
                  yValueMapper: (ChartSampleData data, _) => data.yValue,
                  color: Colors.green,
                  legendIconType: LegendIconType.circle,
                  width: 3,
                ),
              ],
              interactiveTooltipFormat: 'point.x : point.y',
              axisTitle: "${'wind-spd'.trParams({
                    "value": ""
                  })} & ${'pm'.trParams({"value": ""})}",
              chartTitle: 'wind-time',
              legend: Legend(
                isResponsive: true,
                isVisible: true,
                alignment: ChartAlignment.center,
                position: LegendPosition.bottom,
                overflowMode: LegendItemOverflowMode.wrap,
                orientation: LegendItemOrientation.vertical,
              ),
            ),
            CreateChart(
              data: [
                LineSeries(
                  name: 'hm'.tr,
                  dataSource: airQualityController.dataChartHumidityCenter,
                  xValueMapper: (ChartSampleData data, _) => data.x,
                  yValueMapper: (ChartSampleData data, _) => data.yValue,
                  color: const Color.fromRGBO(242, 117, 7, 1),
                  legendIconType: LegendIconType.circle,
                  width: 3,
                ),
                LineSeries(
                  name: 'temperature'.tr,
                  dataSource: airQualityController.dataChartTempVsTimeCenter,
                  xValueMapper: (ChartSampleData data, _) => data.x,
                  yValueMapper: (ChartSampleData data, _) => data.yValue,
                  color: Colors.green,
                  legendIconType: LegendIconType.circle,
                  width: 3,
                ),
              ],
              interactiveTooltipFormat: 'point.x : point.y',
              chartTitle: 'hm-temp-time'.tr,
              axisTitle: '% & ${'celsius'.trParams({"value": ''})}',
              legend: Legend(
                isResponsive: true,
                isVisible: true,
                alignment: ChartAlignment.center,
                position: LegendPosition.bottom,
                overflowMode: LegendItemOverflowMode.wrap,
                orientation: LegendItemOrientation.vertical,
              ),
            ),
          ],
        );
      },
      initialBuilder: (BuildContext context, void Function() _) => Container(),
    );
  }
}

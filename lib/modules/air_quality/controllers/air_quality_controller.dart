import 'dart:math';

import 'package:flutterapperadauti/data/models/air_quality_charts/air_quality_charts_item_model.dart';
import 'package:flutterapperadauti/data/models/air_quality_charts/air_quality_charts_model.dart';
import 'package:flutterapperadauti/modules/air_quality/views/create_chart.dart';
import 'package:flutterapperadauti/utils/helpers/get_data_firebase.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class AirQualityController extends GetxController with GetDataFirebase {
  List<ChartSampleData> dataChartPmVsTimeCenter = [];
  List<ChartSampleData> dataChartPmVsTimeDornesti = [];
  List<ChartSampleData> dataChartWindVsTimeCenter = [];
  List<ChartSampleData> dataChartWindVsTimeDornesti = [];
  List<ChartSampleData> dataChartCoVsTime = [];
  List<ChartSampleData> dataChartTempVsTimeCenter = [];
  List<ChartSampleData> dataChartHumidityCenter = [];

  Future getDataCharts() async {
    var data = await getData(
      convert: AirQualityChartsModel.fromJson,
      document: 'AirDatabase3',
    );
    List<AirQualityChartsItemModel>? items = data.items;
    for (int index = 0; index <= items!.length - 1; index++) {
      AirQualityChartsItemModel item = items[index];
      DateTime tempDate = DateFormat('dd/MM/yyyy HH:mm').parse(item.timestamp);
      dataChartPmVsTimeCenter.add(
        ChartSampleData(
          x: tempDate,
          yValue: item.centerPm.toDouble(),
        ),
      );
      dataChartPmVsTimeDornesti.add(
        ChartSampleData(
          x: tempDate,
          yValue: item.dornestiPm.toDouble(),
        ),
      );
      dataChartTempVsTimeCenter.add(
        ChartSampleData(
          x: tempDate,
          yValue: item.centerTemp.toDouble(),
        ),
      );
      dataChartCoVsTime.add(
        ChartSampleData(
          x: tempDate,
          yValue: item.centerCo.toDouble(),
        ),
      );
      dataChartWindVsTimeCenter.add(
        ChartSampleData(
          x: tempDate,
          yValue: item.roMeteoWindSpeed.toDouble(),
        ),
      );
      dataChartWindVsTimeDornesti.add(
        ChartSampleData(
          x: tempDate,
          yValue: item.dornestiWindSpeed.toDouble(),
        ),
      );
      dataChartHumidityCenter.add(
        ChartSampleData(
          x: tempDate,
          yValue: item.centerHm.toDouble(),
        ),
      );
    }
  }
}

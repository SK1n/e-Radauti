import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutterapperadauti/data/models/air_quality_charts/air_quality_charts_item_model.dart';
import 'package:flutterapperadauti/data/models/air_quality_charts/air_quality_charts_model.dart';
import 'package:flutterapperadauti/modules/air_quality/controllers/air_quality_controller.dart';
import 'package:flutterapperadauti/utils/helpers/get_data_firebase.dart';
import 'package:flutterapperadauti/utils/shared_widgets/futuristic.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class AirQualityChartsPage extends StatelessWidget with GetDataFirebase {
  const AirQualityChartsPage({super.key});
  @override
  Widget build(BuildContext context) {
    ZoomPanBehavior zoomPanBehavior = ZoomPanBehavior(
      enablePanning: false,
      enablePinching: true,
      enableSelectionZooming: false,
      zoomMode: ZoomMode.y,
      enableDoubleTapZooming: false,
    );
    List<ChartsModel> dataChartPmVsTime = [];
    List<ChartsModel> dataChartCoVsTime = [];
    List<ChartsModel> dataChartPmVsWindVsTime = [];
    List<ChartsModel> dataChartTempVsTime = [];
    final AirQualityController airQualityController = Get.find();
    return Futuristic(
      futureBuilder: () => airQualityController.getData(
        convert: AirQualityChartsModel.fromJson,
        document: 'AirDatabase2',
      ),
      dataBuilder: (context, snapshot) {
        AirQualityChartsModel data = snapshot as AirQualityChartsModel;
        List<AirQualityChartsItemModel>? items = data.items;
        for (int index = 0; index <= min(20, items!.length - 1); index++) {
          AirQualityChartsItemModel item = items[index];
          DateTime tempDate = DateFormat('dd/MM/yyyy HH:mm')
              .parseUTC(item.formatedDate!)
              .toLocal();

          dataChartPmVsTime
              .add(ChartsModel(date: tempDate, value: item.pm!.toDouble()));
          dataChartCoVsTime
              .add(ChartsModel(date: tempDate, value: item.co!.toDouble()));
          dataChartPmVsWindVsTime.add(ChartsModel(
              date: tempDate,
              value: item.pm!.toDouble(),
              secondValue: item.wind!.toDouble()));
          dataChartTempVsTime.add(
              ChartsModel(date: tempDate, secondValue: item.tempC!.toDouble()));
        }

        return Column(
          children: [
            Text('pm-time'.tr),
            Card(
              child: SfCartesianChart(
                zoomPanBehavior: zoomPanBehavior,
                series: [
                  ColumnSeries<ChartsModel, DateTime>(
                    dataSource: dataChartPmVsTime,
                    onPointTap: (item) {
                      showTappedValue(
                        dataChartPmVsTime[item.pointIndex!].value,
                        '??g/m??',
                        dataChartPmVsTime[item.pointIndex!].date,
                      );
                    },
                    pointColorMapper: (ChartsModel model, _) {
                      if (model.value! <= 25) {
                        return Colors.greenAccent;
                      } else if (model.value! <= 35) {
                        return Colors.yellowAccent;
                      } else {
                        return Colors.redAccent;
                      }
                    },
                    xValueMapper: (ChartsModel model, _) => model.date,
                    yValueMapper: (ChartsModel model, _) => model.value,
                    xAxisName: 'time'.tr,
                    yAxisName: 'Pm2.5',
                  ),
                ],
                primaryXAxis: DateTimeAxis(),
              ),
            ),
            Text('co2-time'.tr),
            Card(
              child: SfCartesianChart(
                zoomPanBehavior: zoomPanBehavior,
                series: <ColumnSeries>[
                  ColumnSeries<ChartsModel, DateTime>(
                    dataSource: dataChartCoVsTime,
                    xValueMapper: (ChartsModel model, _) => model.date,
                    yValueMapper: (ChartsModel model, _) => model.value,
                    xAxisName: 'time'.tr,
                    yAxisName: 'CO2',
                    onPointTap: (item) {
                      showTappedValue(
                        dataChartCoVsTime[item.pointIndex!].value,
                        'ppm',
                        dataChartCoVsTime[item.pointIndex!].date,
                      );
                    },
                  ),
                ],
                primaryXAxis: DateTimeAxis(),
              ),
            ),
            Text('pm-speed-time'.tr),
            Card(
              child: SfCartesianChart(
                zoomPanBehavior: zoomPanBehavior,
                series: <ColumnSeries>[
                  ColumnSeries<ChartsModel, DateTime>(
                    name: 'PM2.5 ??g/m??',
                    dataSource: dataChartPmVsWindVsTime,
                    xValueMapper: (ChartsModel model, _) => model.date,
                    yValueMapper: (ChartsModel model, _) => model.value,
                    xAxisName: 'time'.tr,
                    yAxisName: 'PM',
                    onPointTap: (item) {
                      showTappedValue(
                        dataChartPmVsWindVsTime[item.pointIndex!].value,
                        '??g/m??',
                        dataChartPmVsWindVsTime[item.pointIndex!].date,
                      );
                    },
                  ),
                  ColumnSeries<ChartsModel, DateTime>(
                    name: '${"wind-speed".tr} \n(m/s)',
                    dataSource: dataChartPmVsWindVsTime,
                    xValueMapper: (ChartsModel model, _) => model.date,
                    yValueMapper: (ChartsModel model, _) => model.secondValue,
                    xAxisName: 'time'.tr,
                    yAxisName: 'wind'.tr,
                    onPointTap: (item) {
                      showTappedValue(
                        dataChartPmVsWindVsTime[item.pointIndex!].secondValue,
                        'm/s',
                        dataChartPmVsWindVsTime[item.pointIndex!].date,
                      );
                    },
                  ),
                ],
                legend: Legend(
                    title: LegendTitle(text: 'legend'.tr), isVisible: true),
                primaryXAxis: DateTimeAxis(),
              ),
            ),
            Text('temperature-time'.tr),
            Card(
              child: SfCartesianChart(
                zoomPanBehavior: zoomPanBehavior,
                series: <ColumnSeries>[
                  ColumnSeries<ChartsModel, DateTime>(
                      onPointTap: (item) {
                        showTappedValue(
                          dataChartTempVsTime[item.pointIndex!].secondValue,
                          '??C',
                          dataChartTempVsTime[item.pointIndex!].date,
                        );
                      },
                      dataSource: dataChartTempVsTime,
                      xValueMapper: (ChartsModel model, _) => model.date,
                      yValueMapper: (ChartsModel model, _) => model.secondValue,
                      xAxisName: 'time'.tr,
                      yAxisName: 'temperature'.tr,
                      pointColorMapper: (ChartsModel model, _) {
                        if (model.secondValue! <= -5) {
                          return Colors.blue[100];
                        } else if (model.secondValue! <= 0) {
                          return Colors.blue[300];
                        } else if (model.secondValue! <= 10) {
                          return Colors.yellowAccent;
                        } else if (model.secondValue! <= 15) {
                          return Colors.yellow;
                        } else if (model.secondValue! <= 20) {
                          return Colors.redAccent;
                        } else {
                          return Colors.red;
                        }
                      }),
                ],
                primaryXAxis: DateTimeAxis(),
              ),
            ),
          ],
        );
      },
      initialBuilder: (BuildContext context, void Function() _) => Container(),
    );
  }

  showTappedValue(dynamic value, String measurement, DateTime time) {
    Get.defaultDialog(
      barrierDismissible: false,
      title: 'selected-value'.tr,
      content: Text(
        '${"selected-value-is".tr}: $value $measurement \n${"value-date".tr}: $time',
        maxLines: 2,
      ),
      onConfirm: () => Get.back(),
      textConfirm: 'close'.tr,
    );
  }
}

class ChartsModel {
  final DateTime date;
  final double? value;
  final double? secondValue;
  ChartsModel({this.value, required this.date, this.secondValue});
}

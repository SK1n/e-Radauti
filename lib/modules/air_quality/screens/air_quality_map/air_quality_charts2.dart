import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_loadingindicator/flutter_loadingindicator.dart';
import 'package:flutterapperadauti/controllers/get_data_from_firebase_controller.dart';
import 'package:flutterapperadauti/modules/air_quality/screens/air_quality/controllers/air_quality_controller.dart';
import 'package:flutterapperadauti/utils/futuristic.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

extension on String {
  convert() {
    return this
        .replaceAll('T', ' ')
        .replaceAll('Z', ' ')
        .replaceRange(17, null, '');
  }
}

class AirQualityCharts2 extends StatefulWidget {
  const AirQualityCharts2({Key? key}) : super(key: key);

  @override
  _AirQualityCharts2State createState() => _AirQualityCharts2State();
}

class _AirQualityCharts2State extends State<AirQualityCharts2> {
  ZoomPanBehavior zoomPanBehavior = ZoomPanBehavior(
    enablePanning: false,
    enablePinching: true,
    enableSelectionZooming: true,
    zoomMode: ZoomMode.xy,
    enableDoubleTapZooming: false,
  );
  @override
  Widget build(BuildContext context) {
    List<ChartsModel> dataChartPmVsTime = [];
    List<ChartsModel> dataChartCoVsTime = [];
    List<ChartsModel> dataChartPmVsWindVsTime = [];
    List<ChartsModel> dataChartTempVsTime = [];
    final GetDataFromFirebaseController _getDataFromFirebaseController =
        Get.find();
    final AirQualityController _airQualityController = Get.find();
    return Futuristic(
        futureBuilder: () =>
            _getDataFromFirebaseController.getDataFromFirebase('AirDatabase2'),
        busyBuilder: (_) {
          if (!EasyLoading.isShow) {
            EasyLoading.show();
          }
          return Container();
        },
        errorBuilder: (_, error, retry) {
          EasyLoading.showError("Eroare");
          return TextButton(
              onPressed: () => retry, child: Text('Incearca din nou!'));
        },
        dataBuilder: (_, snap) {
          if (EasyLoading.isShow) {
            EasyLoading.dismiss();
          }

          for (int index = 0;
              index <=
                  min(
                      20,
                      _getDataFromFirebaseController
                              .getLength(snap.data['air']) -
                          1);
              index++) {
            var data = snap.data['air'][index];
            DateTime tempDate = new DateFormat('yyyy-MM-dd HH:mm')
                .parseUTC('${data['date'].toString().convert()}')
                .toLocal();
            dataChartPmVsTime
                .add(ChartsModel(date: tempDate, value: data['pm25']));
            dataChartCoVsTime
                .add(ChartsModel(date: tempDate, value: data['co2']));
            dataChartPmVsWindVsTime.add(ChartsModel(
                date: tempDate,
                value: data['pm25'],
                secondValue: data['wind'].toInt()));
            dataChartTempVsTime.add(ChartsModel(
                date: tempDate, secondValue: data['temp_center'].toInt()));
          }

          return SingleChildScrollView(
            child: Column(
              children: [
                Text('Grafic de PM2.5 (μg/m³) vs Timp'),
                Card(
                  child: SfCartesianChart(
                    zoomPanBehavior: zoomPanBehavior,
                    series: [
                      ColumnSeries<ChartsModel, DateTime>(
                        enableTooltip: true,
                        dataLabelSettings: DataLabelSettings(isVisible: true),
                        dataSource: dataChartPmVsTime,
                        onPointTap: (item) {
                          showTappedValue(
                            dataChartPmVsTime[item.pointIndex!].value,
                            'μg/m³',
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
                        xAxisName: 'Timp',
                        yAxisName: 'Pm2.5',
                      ),
                    ],
                    primaryXAxis: DateTimeAxis(),
                  ),
                ),
                Text('Grafic de CO2 (ppm) vs Timp'),
                Card(
                  child: SfCartesianChart(
                    zoomPanBehavior: zoomPanBehavior,
                    series: <ColumnSeries>[
                      ColumnSeries<ChartsModel, DateTime>(
                        dataSource: dataChartCoVsTime,
                        xValueMapper: (ChartsModel model, _) => model.date,
                        yValueMapper: (ChartsModel model, _) => model.value,
                        xAxisName: 'Timp',
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
                Text('Grafic de PM2.5 μg/m³ & Viteza Vântului (m/s) vs Timp'),
                Card(
                  child: SfCartesianChart(
                    zoomPanBehavior: zoomPanBehavior,
                    series: <ColumnSeries>[
                      ColumnSeries<ChartsModel, DateTime>(
                        name: 'PM2.5 μg/m³',
                        dataSource: dataChartPmVsWindVsTime,
                        xValueMapper: (ChartsModel model, _) => model.date,
                        yValueMapper: (ChartsModel model, _) => model.value,
                        xAxisName: 'Timp',
                        yAxisName: 'PM',
                        onPointTap: (item) {
                          showTappedValue(
                            dataChartPmVsWindVsTime[item.pointIndex!].value,
                            'μg/m³',
                            dataChartPmVsWindVsTime[item.pointIndex!].date,
                          );
                        },
                      ),
                      ColumnSeries<ChartsModel, DateTime>(
                        name: 'Viteza Vântului \n(m/s)',
                        dataSource: dataChartPmVsWindVsTime,
                        xValueMapper: (ChartsModel model, _) => model.date,
                        yValueMapper: (ChartsModel model, _) =>
                            model.secondValue,
                        xAxisName: 'Timp',
                        yAxisName: 'Wind',
                        onPointTap: (item) {
                          showTappedValue(
                            dataChartPmVsWindVsTime[item.pointIndex!]
                                .secondValue,
                            'm/s',
                            dataChartPmVsWindVsTime[item.pointIndex!].date,
                          );
                        },
                      ),
                    ],
                    legend: Legend(
                        title: LegendTitle(text: 'Legenda'), isVisible: true),
                    primaryXAxis: DateTimeAxis(),
                  ),
                ),
                Text('Grafic de Temperatură vs Timp'),
                Card(
                  child: SfCartesianChart(
                    zoomPanBehavior: zoomPanBehavior,
                    series: <ColumnSeries>[
                      ColumnSeries<ChartsModel, DateTime>(
                          onPointTap: (item) {
                            showTappedValue(
                              dataChartTempVsTime[item.pointIndex!].secondValue,
                              '°C',
                              dataChartTempVsTime[item.pointIndex!].date,
                            );
                          },
                          dataSource: dataChartTempVsTime,
                          xValueMapper: (ChartsModel model, _) => model.date,
                          yValueMapper: (ChartsModel model, _) =>
                              model.secondValue,
                          xAxisName: 'Timp',
                          yAxisName: 'Temperatură',
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
            ),
          );
        });
  }

  showTappedValue(dynamic value, String measurement, DateTime time) {
    Get.defaultDialog(
      title: 'Valoarea selectata',
      content: Text(
        'Valoarea selectata este: $value $measurement \nLa data de: $time',
        maxLines: 2,
      ),
      actions: [
        TextButton(onPressed: () => Get.back(), child: Text('Inchide!'))
      ],
    );
  }
}

class ChartsModel {
  final DateTime date;
  final int? value;
  final int? secondValue;
  ChartsModel({this.value, required this.date, this.secondValue});
}

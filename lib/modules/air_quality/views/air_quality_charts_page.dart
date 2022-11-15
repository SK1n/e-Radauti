import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutterapperadauti/data/models/air_quality_charts/air_quality_charts_item_model.dart';
import 'package:flutterapperadauti/data/models/air_quality_charts/air_quality_charts_model.dart';
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
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Futuristic(
              futureBuilder: () => getData(
                  document: 'AirDatabase2',
                  convert: AirQualityChartsModel.fromJson),
              dataBuilder: (context, snap) {
                AirQualityChartsModel data = snap.data;
                List<AirQualityChartsItemModel>? items = data.items;
                for (int index = 0;
                    index <= min(20, items!.length - 1);
                    index++) {
                  AirQualityChartsItemModel item = items[index];
                  DateTime tempDate = DateFormat('dd/MM/yyyy HH:mm')
                      .parseUTC(item.formatedDate!)
                      .toLocal();

                  dataChartPmVsTime.add(
                      ChartsModel(date: tempDate, value: item.pm!.toDouble()));
                  dataChartCoVsTime.add(
                      ChartsModel(date: tempDate, value: item.co!.toDouble()));
                  dataChartPmVsWindVsTime.add(ChartsModel(
                      date: tempDate,
                      value: item.pm!.toDouble(),
                      secondValue: item.wind!.toDouble()));
                  dataChartTempVsTime.add(ChartsModel(
                      date: tempDate, secondValue: item.tempC!.toDouble()));
                }

                return Column(
                  children: [
                    const Text('Grafic de PM2.5 (μg/m³) vs Timp'),
                    Card(
                      child: SfCartesianChart(
                        zoomPanBehavior: zoomPanBehavior,
                        series: [
                          ColumnSeries<ChartsModel, DateTime>(
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
                    const Text('Grafic de CO2 (ppm) vs Timp'),
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
                    const Text(
                        'Grafic de PM2.5 μg/m³ & Viteza Vântului (m/s) vs Timp'),
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
                            title: LegendTitle(text: 'Legenda'),
                            isVisible: true),
                        primaryXAxis: DateTimeAxis(),
                      ),
                    ),
                    const Text('Grafic de Temperatură vs Timp'),
                    Card(
                      child: SfCartesianChart(
                        zoomPanBehavior: zoomPanBehavior,
                        series: <ColumnSeries>[
                          ColumnSeries<ChartsModel, DateTime>(
                              onPointTap: (item) {
                                showTappedValue(
                                  dataChartTempVsTime[item.pointIndex!]
                                      .secondValue,
                                  '°C',
                                  dataChartTempVsTime[item.pointIndex!].date,
                                );
                              },
                              dataSource: dataChartTempVsTime,
                              xValueMapper: (ChartsModel model, _) =>
                                  model.date,
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
                );
              }),
        ),
      ],
    );
  }

  showTappedValue(dynamic value, String measurement, DateTime time) {
    Get.defaultDialog(
      title: 'Valoarea selectata',
      content: Text(
        'Valoarea selectata este: $value $measurement \nLa data de: $time',
        maxLines: 2,
      ),
      actions: [
        TextButton(onPressed: () => Get.back(), child: const Text('Inchide!'))
      ],
    );
  }
}

class ChartsModel {
  final DateTime date;
  final double? value;
  final double? secondValue;
  ChartsModel({this.value, required this.date, this.secondValue});
}

import 'dart:io';
import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterapperadauti/air_quality/models/charts_model.dart';
import 'package:flutterapperadauti/widgets/src/loading_screen_ui.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

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
    NewFetchAirQualityData data = Provider.of<NewFetchAirQualityData>(context);
    List<ChartsModel> dataChartPmVsTime = [];
    List<ChartsModel> dataChartCoVsTime = [];
    List<ChartsModel> dataChartPmVsWindVsTime = [];
    List<ChartsModel> dataChartTempVsTime = [];
    return FutureBuilder(
        future: data.getDataFromFirebase(),
        builder: (BuildContext context, AsyncSnapshot snap) {
          if (!snap.hasData) {
            return LoadingScreen();
          } else if (snap.hasError) {
            return Container(
              height: MediaQuery.of(context).size.height,
              child: Center(
                child: Text('A apărut o eroare de conexiune la internet!'),
              ),
            );
          } else {
            for (int index = 0;
                index <= min(20, data.getLength() - 1);
                index++) {
              DateTime tempDate = new DateFormat('yyyy-MM-dd HH:mm')
                  .parseUTC(
                      '${snap.data[index].date.replaceAll('T', ' ').replaceAll('Z', ' ').replaceRange(17, null, '')}')
                  .toLocal();
              dataChartPmVsTime
                  .add(ChartsModel(date: tempDate, value: snap.data[index].pm));
              dataChartCoVsTime
                  .add(ChartsModel(date: tempDate, value: snap.data[index].co));
              dataChartPmVsWindVsTime.add(ChartsModel(
                  date: tempDate,
                  value: snap.data[index].pm,
                  secondValue: snap.data[index].wind));
              dataChartTempVsTime.add(ChartsModel(
                  date: tempDate, secondValue: snap.data[index].temp_c));
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
                                dataChartTempVsTime[item.pointIndex!]
                                    .secondValue,
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
          }
        });
  }

  showTappedValue(dynamic value, String measurement, DateTime time) {
    showDialog(
        context: context,
        builder: (BuildContext context) => Platform.isIOS
            ? CupertinoAlertDialog(
                title: Text('Valoarea selectata'),
                content: Text(
                  'Valoarea selectata este: $value $measurement \nLa data de: $time',
                  maxLines: 2,
                ),
                actions: [
                  TextButton(
                      onPressed: () => Navigator.pop(context),
                      child: Text('Inchide!'))
                ],
              )
            : AlertDialog(
                scrollable: true,
                title: Text('Valoarea selectata'),
                content: Text(
                  'Valoarea selectata este: $value $measurement \nLa data de: $time',
                ),
                actions: [
                  TextButton(
                      onPressed: () => Navigator.pop(context),
                      child: Text('Inchide!'))
                ],
              ));
  }
}

class ChartsModel {
  final DateTime date;
  final int? value;
  final double? secondValue;
  ChartsModel({this.value, required this.date, this.secondValue});
}

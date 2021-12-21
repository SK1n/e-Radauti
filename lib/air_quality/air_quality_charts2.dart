import 'package:flutter/material.dart';
import 'package:flutterapperadauti/air_quality/models/charts_model.dart';
import 'package:flutterapperadauti/widgets/src/loading_screen_ui.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:syncfusion_flutter_charts/sparkcharts.dart';

class AirQualityCharts2 extends StatefulWidget {
  const AirQualityCharts2({Key key}) : super(key: key);

  @override
  _AirQualityCharts2State createState() => _AirQualityCharts2State();
}

class _AirQualityCharts2State extends State<AirQualityCharts2> {
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
            for (int index = 0; index <= 20; index++) {
              DateTime tempDate = new DateFormat('dd-MM-yyyy hh:mm:ss')
                  .parse(snap.data[index].date);
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
                  Card(
                    child: Column(
                      children: [
                        Text('Grafic de PM2.5 (ug/m3) vs Timp'),
                        SfCartesianChart(
                          series: [
                            ColumnSeries<ChartsModel, DateTime>(
                              dataSource: dataChartPmVsTime,
                              pointColorMapper: (ChartsModel model, _) {
                                if (model.value <= 25) {
                                  return Colors.greenAccent;
                                } else if (model.value <= 35) {
                                  return Colors.yellowAccent;
                                } else {
                                  return Colors.redAccent;
                                }
                              },
                              xValueMapper: (ChartsModel model, _) =>
                                  model.date,
                              yValueMapper: (ChartsModel model, _) =>
                                  model.value,
                              xAxisName: 'Timp',
                              yAxisName: 'Pm2.5',
                            ),
                          ],
                          primaryXAxis: DateTimeAxis(),
                        )
                      ],
                    ),
                  ),
                  Card(
                    child: Column(
                      children: [
                        Text('Grafic de CO2 (ppm) vs Timp'),
                        SfCartesianChart(
                          series: <ColumnSeries>[
                            ColumnSeries<ChartsModel, DateTime>(
                              dataSource: dataChartCoVsTime,
                              xValueMapper: (ChartsModel model, _) =>
                                  model.date,
                              yValueMapper: (ChartsModel model, _) =>
                                  model.value,
                              xAxisName: 'Timp',
                              yAxisName: 'CO2',
                            ),
                          ],
                          primaryXAxis: DateTimeAxis(),
                        )
                      ],
                    ),
                  ),
                  Card(
                    child: Column(
                      children: [
                        Text(
                            'Grafic de PM2.5 μg/m³ & Viteza Vântului (m/s) vs Timp'),
                        SfCartesianChart(
                          series: <ColumnSeries>[
                            ColumnSeries<ChartsModel, DateTime>(
                              name: 'PM2.5 μg/m³',
                              dataSource: dataChartPmVsWindVsTime,
                              xValueMapper: (ChartsModel model, _) =>
                                  model.date,
                              yValueMapper: (ChartsModel model, _) =>
                                  model.value,
                              xAxisName: 'Timp',
                              yAxisName: 'PM',
                            ),
                            ColumnSeries<ChartsModel, DateTime>(
                              name: 'Viteza Vântului \n(m/s)',
                              dataSource: dataChartPmVsWindVsTime,
                              xValueMapper: (ChartsModel model, _) =>
                                  model.date,
                              yValueMapper: (ChartsModel model, _) =>
                                  model.secondValue,
                              xAxisName: 'Timp',
                              yAxisName: 'Wind',
                            ),
                          ],
                          legend: Legend(
                              title: LegendTitle(text: 'Legenda'),
                              isVisible: true),
                          primaryXAxis: DateTimeAxis(),
                        )
                      ],
                    ),
                  ),
                  Card(
                    child: Column(
                      children: [
                        Text('Grafic de Temperatură vs Timp'),
                        SfCartesianChart(
                          series: <ColumnSeries>[
                            ColumnSeries<ChartsModel, DateTime>(
                                dataSource: dataChartTempVsTime,
                                xValueMapper: (ChartsModel model, _) =>
                                    model.date,
                                yValueMapper: (ChartsModel model, _) =>
                                    model.secondValue,
                                xAxisName: 'Timp',
                                yAxisName: 'Temperatură',
                                pointColorMapper: (ChartsModel model, _) {
                                  if (model.secondValue <= -5) {
                                    return Colors.blue[100];
                                  } else if (model.secondValue <= 0) {
                                    return Colors.blue[300];
                                  } else if (model.secondValue <= 10) {
                                    return Colors.yellowAccent;
                                  } else if (model.secondValue <= 15) {
                                    return Colors.yellow;
                                  } else if (model.secondValue <= 20) {
                                    return Colors.redAccent;
                                  } else {
                                    return Colors.red;
                                  }
                                }),
                          ],
                          primaryXAxis: DateTimeAxis(),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            );
          }
        });
  }
}

class ChartsModel {
  final DateTime date;
  final int value;
  final double secondValue;
  ChartsModel({this.value, this.date, this.secondValue});
}

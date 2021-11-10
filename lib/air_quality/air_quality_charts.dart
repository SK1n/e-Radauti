import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'dart:async';

Future<List> fetchDataList() async {
  List<dynamic> fd;

  String url2 = 'https://checkup-7b62e.firebaseio.com/meteo_radauti.json';
  http.Response r = await http.get(Uri.parse(url2));
  fd = json.decode(r.body);

  List<dynamic> response = [];

  response = fd;

  return response;
}

/// Create one series with sample hard coded data.
Future<List<dynamic>> createSampleDataFuture() async {
  List<dynamic> dataSales = [];
  dataSales = await fetchDataList();

  List<TimeSeriesSales> dataRPM25 = [];
  List<TimeSeriesSales> dataRCO2 = [];
  List<TimeSeriesSales> dataRVant = [];
  List<TimeSeriesSales> dataRTemperatura = [];

  for (int i = (dataSales.length - 24); i < dataSales.length; i++) {
    var colorPM25;
    if (dataSales[i][9].toInt() <= 10) {
      colorPM25 =
          charts.ColorUtil.fromDartColor(Color.fromRGBO(80, 240, 230, 1));
    } else if (dataSales[i][9].toInt() <= 20) {
      colorPM25 =
          charts.ColorUtil.fromDartColor(Color.fromRGBO(80, 204, 170, 1));
    } else if (dataSales[i][9].toInt() <= 25) {
      colorPM25 =
          charts.ColorUtil.fromDartColor(Color.fromRGBO(240, 230, 65, 1));
    } else if (dataSales[i][9].toInt() <= 50) {
      colorPM25 =
          charts.ColorUtil.fromDartColor(Color.fromRGBO(255, 80, 80, 1));
    } else if (dataSales[i][9].toInt() <= 75) {
      colorPM25 = charts.ColorUtil.fromDartColor(Color.fromRGBO(150, 0, 50, 1));
    } else {
      colorPM25 =
          charts.ColorUtil.fromDartColor(Color.fromRGBO(125, 33, 129, 1));
    }
    dataRPM25.add(new TimeSeriesSales(DateTime.parse(dataSales[i][0]).toLocal(),
        dataSales[i][9].toInt(), colorPM25));
  }
  for (int i = (dataSales.length - 24); i < dataSales.length; i++) {
    dataRCO2.add(new TimeSeriesSales(DateTime.parse(dataSales[i][0]).toLocal(),
        dataSales[i][10].toInt(), null));
  }
  for (int i = dataSales.length - 24; i < dataSales.length; i++) {
    if (dataSales[i][2].runtimeType != String) {
      dataRVant.add(new TimeSeriesSales(
          DateTime.parse(dataSales[i][0]).toLocal(),
          dataSales[i][2].toInt(),
          null));
    }
  }
  for (int i = (dataSales.length - 24); i < dataSales.length; i++) {
    dataRTemperatura.add(new TimeSeriesSales(
        DateTime.parse(dataSales[i][0]).toLocal(),
        dataSales[i][8].toInt(),
        null));
  }

  return [
    new charts.Series<TimeSeriesSales, DateTime>(
      id: 'Sales',
      colorFn: (_, __) => charts.MaterialPalette.green.shadeDefault,
      domainFn: (TimeSeriesSales sales, _) => sales.time,
      measureFn: (TimeSeriesSales sales, _) => sales.sales,
      seriesColor: charts.ColorUtil.fromDartColor(Colors.red.shade700),
      fillColorFn: (TimeSeriesSales sales, __) => sales.color,
      data: dataRPM25,
    ),
    new charts.Series<TimeSeriesSales, DateTime>(
      id: 'Sales',
      colorFn: (_, __) => charts.MaterialPalette.green.shadeDefault,
      domainFn: (TimeSeriesSales sales, _) => sales.time,
      measureFn: (TimeSeriesSales sales, _) => sales.sales,
      seriesColor: charts.ColorUtil.fromDartColor(Colors.red.shade700),
      fillColorFn: (_, __) => charts.MaterialPalette.blue.shadeDefault.lighter,
      data: dataRCO2,
      labelAccessorFn: (TimeSeriesSales series, _) => '${series.time} 1',
      displayName: 'Name',
    ),
    new charts.Series<TimeSeriesSales, DateTime>(
      id: 'Sales',
      colorFn: (_, __) => charts.MaterialPalette.green.shadeDefault,
      domainFn: (TimeSeriesSales sales, _) => sales.time,
      measureFn: (TimeSeriesSales sales, _) => sales.sales,
      seriesColor: charts.ColorUtil.fromDartColor(Colors.red.shade700),
      fillColorFn: (_, __) => charts.MaterialPalette.red.shadeDefault,
      data: dataRVant,
    ),
    new charts.Series<TimeSeriesSales, DateTime>(
      id: 'Sales',
      colorFn: (_, __) => charts.MaterialPalette.green.shadeDefault,
      domainFn: (TimeSeriesSales sales, _) => sales.time,
      measureFn: (TimeSeriesSales sales, _) => sales.sales,
      seriesColor: charts.ColorUtil.fromDartColor(Colors.red.shade700),
      fillColorFn: (_, __) => charts.MaterialPalette.blue.shadeDefault.lighter,
      data: dataRTemperatura,
    ),
    new charts.Series<TimeSeriesSales, DateTime>(
      id: 'Sales',
      colorFn: (_, __) => charts.MaterialPalette.green.shadeDefault,
      domainFn: (TimeSeriesSales sales, _) => sales.time,
      measureFn: (TimeSeriesSales sales, _) => sales.sales,
      seriesColor: charts.ColorUtil.fromDartColor(Colors.red.shade700),
      fillColorFn: (_, __) => charts.MaterialPalette.blue.shadeDefault.darker,
      data: dataRPM25,
    ),
  ];
}

class AirQualityChartsPage extends StatelessWidget {
  final bool animate = false;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          SizedBox(
            height: 30.0,
          ),

          //grafice
          Container(
            child: FutureBuilder(
              future: createSampleDataFuture(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  charts.Series<TimeSeriesSales, DateTime> valuePM25;
                  charts.Series<TimeSeriesSales, DateTime> valuePM252;
                  charts.Series<TimeSeriesSales, DateTime> valueCO2;
                  charts.Series<TimeSeriesSales, DateTime> valueVant;
                  charts.Series<TimeSeriesSales, DateTime> valueTemperatura;
                  List<charts.Series<TimeSeriesSales, DateTime>> valueListPM25 =
                      [];
                  List<charts.Series<TimeSeriesSales, DateTime>> valueListCO2 =
                      [];
                  List<charts.Series<TimeSeriesSales, DateTime>>
                      valueListPM25Vant = [];
                  List<charts.Series<TimeSeriesSales, DateTime>>
                      valueListTemparatura = [];
                  valuePM25 = snapshot.data[0];
                  valuePM252 = snapshot.data[4];
                  valueCO2 = snapshot.data[1];
                  valueVant = snapshot.data[2];
                  valueTemperatura = snapshot.data[3];
                  valueListPM25 = [valuePM25];
                  valueListCO2 = [valueCO2];
                  valueListPM25Vant = [
                    valuePM252,
                    valueVant
                      ..setAttribute(
                          charts.measureAxisIdKey, 'secondaryMeasureAxisId')
                  ];
                  valueListTemparatura = [valueTemperatura];

                  return Column(
                    children: <Widget>[
                      //grafic pm25
                      Center(
                        child: Text('Grafic de PM2.5 (ug/m3) vs Timp'),
                      ),
                      SizedBox(
                        height: 5.0,
                      ),
                      Card(
                        child: Container(
                          height: MediaQuery.of(context).size.height / 4,
                          child: charts.TimeSeriesChart(
                            valueListPM25,
                            animate: animate,
                            // Set the default renderer to a bar renderer.
                            // This can also be one of the custom renderers of the time series chart.
                            defaultRenderer:
                                new charts.BarRendererConfig<DateTime>(
                              maxBarWidthPx: 30,
                            ),
                            // It is recommended that default interactions be turned off if using bar
                            // renderer, because the line point highlighter is the default for time
                            // series chart.
                            defaultInteractions: false,
                            // If default interactions were removed, optionally add select nearest
                            // and the domain highlighter that are typical for bar charts.
                            behaviors: [
                              new charts.SelectNearest(),
                              new charts.DomainHighlighter(),
                              new charts.ChartTitle(
                                'PM2.5 (ug/m3)',
                                behaviorPosition: charts.BehaviorPosition.start,
                                titleOutsideJustification:
                                    charts.OutsideJustification.middleDrawArea,
                                titleStyleSpec: charts.TextStyleSpec(
                                  fontSize: 12,
                                ),
                              ),
                              new charts.ChartTitle(
                                'Timp',
                                behaviorPosition:
                                    charts.BehaviorPosition.bottom,
                                titleOutsideJustification:
                                    charts.OutsideJustification.middleDrawArea,
                                titleStyleSpec: charts.TextStyleSpec(
                                  fontSize: 12,
                                ),
                              ),
                              new charts.RangeAnnotation([
                                new charts.LineAnnotationSegment(
                                  25,
                                  charts.RangeAnnotationAxisType.measure,
                                  endLabel: 'Valoarea limită UE',
                                  color: charts.MaterialPalette.green
                                      .shadeDefault.darker,
                                ),
                              ]),
                              //new charts.PanAndZoomBehavior(),
                              //new charts.SlidingViewport(),
                            ],
                          ),
                        ),
                      ),

                      SizedBox(
                        height: 20.0,
                      ),

                      //grafic co2
                      Center(
                        child: Text('Grafic de CO2 (ppm) vs Timp'),
                      ),
                      SizedBox(
                        height: 5.0,
                      ),
                      Card(
                        child: Container(
                          height: MediaQuery.of(context).size.height / 4,
                          child: charts.TimeSeriesChart(
                            valueListCO2,
                            animate: animate,
                            //animate: true,
                            // Set the default renderer to a bar renderer.
                            // This can also be one of the custom renderers of the time series chart.
                            defaultRenderer:
                                new charts.BarRendererConfig<DateTime>(
                              maxBarWidthPx: 30,
                              cornerStrategy: charts.ConstCornerStrategy(2),
                            ),
                            //defaultRenderer: new charts.BarLabelDecorator(''),
                            // It is recommended that default interactions be turned off if using bar
                            // renderer, because the line point highlighter is the default for time
                            // series chart.
                            defaultInteractions: false,
                            // If default interactions were removed, optionally add select nearest
                            // and the domain highlighter that are typical for bar charts.
                            //animationDuration: Duration.zero,
                            behaviors: [
                              new charts.SelectNearest(),
                              new charts.DomainHighlighter(),
                              new charts.ChartTitle(
                                'CO2 (ppm)',
                                behaviorPosition: charts.BehaviorPosition.start,
                                titleOutsideJustification:
                                    charts.OutsideJustification.middleDrawArea,
                                titleStyleSpec: charts.TextStyleSpec(
                                  fontSize: 12,
                                ),
                              ),
                              new charts.ChartTitle(
                                'Timp',
                                behaviorPosition:
                                    charts.BehaviorPosition.bottom,
                                titleOutsideJustification:
                                    charts.OutsideJustification.middleDrawArea,
                                titleStyleSpec: charts.TextStyleSpec(
                                  fontSize: 12,
                                ),
                              ),
                              //new charts.InitialHintBehavior(maxHintTranslate: 4.0),
                              new charts.PanAndZoomBehavior(),
                              new charts.SlidingViewport(),
                            ],
                            domainAxis: new charts.DateTimeAxisSpec(
                              //viewport: new charts.DateTimeExtents(start: DateTime.now().toUtc().subtract(Duration(hours: 5)), end: DateTime.now().toUtc()),
                              //showAxisLine: false,
                              //renderSpec: new charts.NoneRenderSpec(),
                              tickFormatterSpec: new charts
                                      .AutoDateTimeTickFormatterSpec(
                                  /*day: new charts.TimeFormatterSpec(
                                  format: 'EEE', transitionFormat: 'EEE',
                                  noonFormat: 'EEE'
                                ),*/
                                  /*hour: new charts.TimeFormatterSpec(
                                  format: 'H', transitionFormat: 'H'
                                ),*/
                                  /*minute: new charts.TimeFormatterSpec(
                                  format: 'm', transitionFormat: 'H:m',
                                ),*/
                                  ),
                              //tickProviderSpec: charts.AutoDateTimeTickProviderSpec(includeTime: true),
                              //tickProviderSpec: charts.DayTickProviderSpec(increments: [1]),
                            ),
                          ),
                        ),
                      ),

                      SizedBox(
                        height: 20.0,
                      ),

                      //grafic pm25 & vant
                      Center(
                        child: Text(
                            'Grafic de PM2.5 (ug/m3) & Viteza Vântului (m/s) vs Timp'),
                      ),
                      SizedBox(
                        height: 5.0,
                      ),
                      Card(
                        child: Container(
                          height: MediaQuery.of(context).size.height / 4,
                          child: charts.TimeSeriesChart(
                            valueListPM25Vant,
                            animate: animate,
                            //barGroupingType: charts.BarGroupingType.grouped,
                            primaryMeasureAxis: new charts.NumericAxisSpec(
                              tickProviderSpec:
                                  new charts.BasicNumericTickProviderSpec(
                                      desiredTickCount: 3),
                            ),
                            secondaryMeasureAxis: new charts.NumericAxisSpec(
                              tickProviderSpec:
                                  new charts.BasicNumericTickProviderSpec(
                                      desiredTickCount: 3),
                            ),
                            // Set the default renderer to a bar renderer.
                            // This can also be one of the custom renderers of the time series chart.
                            defaultRenderer:
                                new charts.BarRendererConfig<DateTime>(),
                            // It is recommended that default interactions be turned off if using bar
                            // renderer, because the line point highlighter is the default for time
                            // series chart.
                            defaultInteractions: false,
                            // If default interactions were removed, optionally add select nearest
                            // and the domain highlighter that are typical for bar charts.
                            behaviors: [
                              new charts.SelectNearest(),
                              new charts.DomainHighlighter(),
                              new charts.ChartTitle(
                                'PM2.5 (ug/m3)',
                                behaviorPosition: charts.BehaviorPosition.start,
                                titleOutsideJustification:
                                    charts.OutsideJustification.middleDrawArea,
                                titleStyleSpec: charts.TextStyleSpec(
                                  fontSize: 12,
                                ),
                              ),
                              new charts.ChartTitle(
                                'Vânt (m/s)',
                                behaviorPosition: charts.BehaviorPosition.end,
                                titleOutsideJustification:
                                    charts.OutsideJustification.middleDrawArea,
                                titleStyleSpec: charts.TextStyleSpec(
                                  fontSize: 12,
                                ),
                              ),
                              new charts.ChartTitle(
                                'Timp',
                                behaviorPosition:
                                    charts.BehaviorPosition.bottom,
                                titleOutsideJustification:
                                    charts.OutsideJustification.middleDrawArea,
                                titleStyleSpec: charts.TextStyleSpec(
                                  fontSize: 12,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),

                      SizedBox(
                        height: 20.0,
                      ),

                      //grafic temperatura
                      Center(
                        child: Text('Grafic de Temperatură vs Timp'),
                      ),
                      SizedBox(
                        height: 5.0,
                      ),
                      Card(
                        child: Container(
                          height: MediaQuery.of(context).size.height / 4,
                          child: charts.TimeSeriesChart(
                            valueListTemparatura,
                            animate: animate,
                            // Set the default renderer to a bar renderer.
                            // This can also be one of the custom renderers of the time series chart.
                            defaultRenderer:
                                new charts.BarRendererConfig<DateTime>(
                              maxBarWidthPx: 30,
                            ),
                            // It is recommended that default interactions be turned off if using bar
                            // renderer, because the line point highlighter is the default for time
                            // series chart.
                            defaultInteractions: false,
                            // If default interactions were removed, optionally add select nearest
                            // and the domain highlighter that are typical for bar charts.
                            behaviors: [
                              new charts.SelectNearest(),
                              new charts.DomainHighlighter(),
                              new charts.ChartTitle(
                                'Temperatură',
                                behaviorPosition: charts.BehaviorPosition.start,
                                titleOutsideJustification:
                                    charts.OutsideJustification.middleDrawArea,
                                titleStyleSpec: charts.TextStyleSpec(
                                  fontSize: 12,
                                ),
                              ),
                              new charts.ChartTitle(
                                'Timp',
                                behaviorPosition:
                                    charts.BehaviorPosition.bottom,
                                titleOutsideJustification:
                                    charts.OutsideJustification.middleDrawArea,
                                titleStyleSpec: charts.TextStyleSpec(
                                  fontSize: 12,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  );
                } else if (snapshot.hasError) {
                  return Container(
                    height: MediaQuery.of(context).size.height - 200.0,
                    child: Center(
                      child: Text('Eroare de încărcare'),
                    ),
                  );
                }
                return Container(
                  height: MediaQuery.of(context).size.height - 200.0,
                  child: Center(
                    child: CircularProgressIndicator(
                      valueColor:
                          AlwaysStoppedAnimation<Color>(Color(0xCC38A49C)),
                    ),
                  ),
                );
              },
            ),
          ),

          SizedBox(
            height: 10.0,
          ),
        ],
      ),
    );
  }
}

/// Sample time series data type.
class TimeSeriesSales {
  final DateTime time;
  final int sales;
  final color;

  TimeSeriesSales(this.time, this.sales, this.color);
}

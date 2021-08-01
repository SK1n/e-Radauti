import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'dart:async';

Future<List> fetchDataList() async{
  List<dynamic> fd;

  String url1 = 'https://checkup-7b62e.firebaseio.com/Meteo_Radauti.json';
  String url2 = 'https://checkup-7b62e.firebaseio.com/meteo_radauti.json';
  http.Response r = await http.get(url2);
  fd = json.decode(r.body);

  List<dynamic> response = [];

  response = fd;

  return response;
}

/// Create one series with sample hard coded data.
Future<List<dynamic>> createSampleDataFuture() async{
  List<dynamic> dataSales = [];
  dataSales = await fetchDataList();

  List<TimeSeriesSales> dataR_pm25 = [];
  List<TimeSeriesSales> dataR_co2 = [];
  List<TimeSeriesSales> dataR_vant = [];
  List<TimeSeriesSales> dataR_temperetura = [];

  for(int i = (dataSales.length - 24); i < dataSales.length; i++ ){
    dataR_pm25.add(new TimeSeriesSales(DateTime.parse(dataSales[i][0]).toLocal(), dataSales[i][9].toInt()));
  }
  for(int i = (dataSales.length - 24); i < dataSales.length; i++ ){
    dataR_co2.add(new TimeSeriesSales(DateTime.parse(dataSales[i][0]).toLocal(), dataSales[i][10].toInt()));
  }
  for(int i = dataSales.length - 24; i < dataSales.length; i++ ){
    if(dataSales[i][2].runtimeType != String ){
      dataR_vant.add(new TimeSeriesSales(DateTime.parse(dataSales[i][0]).toLocal(), dataSales[i][2].toInt()));
    }
  }
  for(int i = (dataSales.length - 24); i < dataSales.length; i++ ){
    dataR_temperetura.add(new TimeSeriesSales(DateTime.parse(dataSales[i][0]).toLocal(), dataSales[i][8].toInt()));
  }
  List<charts.Series<TimeSeriesSales, DateTime>> listSeries_pm25= [];
  //2
  for(int i = (dataSales.length - 24); i < dataSales.length; i++ ){
    var color_pm25;
    if(dataSales[i][9].toInt() <= 10){
      color_pm25 = charts.ColorUtil.fromDartColor(Color.fromRGBO(80, 240, 230, 1));
    }else if(dataSales[i][9].toInt() <= 20){
      color_pm25 = charts.ColorUtil.fromDartColor(Color.fromRGBO(80, 204, 170, 1));
    }else if(dataSales[i][9].toInt() <= 25){
      color_pm25 = charts.ColorUtil.fromDartColor(Color.fromRGBO(240, 230, 65, 1));
    }else if(dataSales[i][9].toInt() <= 50){
      color_pm25 = charts.ColorUtil.fromDartColor(Color.fromRGBO(255, 80, 80, 1));
    }else if(dataSales[i][9].toInt() <= 75){
      color_pm25 = charts.ColorUtil.fromDartColor(Color.fromRGBO(150, 0, 50, 1));
    }else{
      color_pm25 = charts.ColorUtil.fromDartColor(Color.fromRGBO(125, 33, 129, 1));
    }
    listSeries_pm25.add(new charts.Series<TimeSeriesSales, DateTime>(
      id: 'Sales',
      colorFn: (_, __) => charts.MaterialPalette.green.shadeDefault,
      domainFn: (TimeSeriesSales sales, _) => sales.time,
      measureFn: (TimeSeriesSales sales, _) => sales.sales,
      seriesColor: charts.ColorUtil.fromDartColor(Colors.red.shade700),
      fillColorFn: (_, __) => color_pm25,
      data: [TimeSeriesSales(DateTime.parse(dataSales[i][0]).toLocal(), dataSales[i][9].toInt())],
    ),);
  }

  return [
    new charts.Series<TimeSeriesSales, DateTime>(
      id: 'Sales',
      colorFn: (_, __) => charts.MaterialPalette.green.shadeDefault,
      domainFn: (TimeSeriesSales sales, _) => sales.time,
      measureFn: (TimeSeriesSales sales, _) => sales.sales,
      seriesColor: charts.ColorUtil.fromDartColor(Colors.red.shade700),
      fillColorFn: (_, __) =>
      charts.MaterialPalette.blue.shadeDefault.lighter,
      data: dataR_pm25,
    ),
    new charts.Series<TimeSeriesSales, DateTime>(
      id: 'Sales',
      colorFn: (_, __) => charts.MaterialPalette.green.shadeDefault,
      domainFn: (TimeSeriesSales sales, _) => sales.time,
      measureFn: (TimeSeriesSales sales, _) => sales.sales,
      seriesColor: charts.ColorUtil.fromDartColor(Colors.red.shade700),
      fillColorFn: (_, __) =>
      charts.MaterialPalette.blue.shadeDefault.lighter,
      data: dataR_co2,
    ),
    new charts.Series<TimeSeriesSales, DateTime>(
      id: 'Sales',
      colorFn: (_, __) => charts.MaterialPalette.green.shadeDefault,
      domainFn: (TimeSeriesSales sales, _) => sales.time,
      measureFn: (TimeSeriesSales sales, _) => sales.sales,
      seriesColor: charts.ColorUtil.fromDartColor(Colors.red.shade700),
      fillColorFn: (_, __) =>
      charts.MaterialPalette.blue.shadeDefault.lighter,
      data: dataR_vant,
    ),
    new charts.Series<TimeSeriesSales, DateTime>(
      id: 'Sales',
      colorFn: (_, __) => charts.MaterialPalette.green.shadeDefault,
      domainFn: (TimeSeriesSales sales, _) => sales.time,
      measureFn: (TimeSeriesSales sales, _) => sales.sales,
      seriesColor: charts.ColorUtil.fromDartColor(Colors.red.shade700),
      fillColorFn: (_, __) =>
      charts.MaterialPalette.blue.shadeDefault.lighter,
      data: dataR_temperetura,
    ),
    new charts.Series<TimeSeriesSales, DateTime>(
      id: 'Sales',
      colorFn: (_, __) => charts.MaterialPalette.green.shadeDefault,
      domainFn: (TimeSeriesSales sales, _) => sales.time,
      measureFn: (TimeSeriesSales sales, _) => sales.sales,
      seriesColor: charts.ColorUtil.fromDartColor(Colors.red.shade700),
      fillColorFn: (_, __) =>
      charts.MaterialPalette.deepOrange.shadeDefault.darker,
      data: dataR_vant,
    ),
    listSeries_pm25
  ];

}

class AirQualityChartsPage extends StatelessWidget {
  bool animate = false;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[

          SizedBox(height: 30.0,),

          //grafice
          Container(
            child: FutureBuilder(
              future: createSampleDataFuture(),
              builder: (context, snapshot){
                if(snapshot.hasData){

                  charts.Series<TimeSeriesSales, DateTime> value_pm25 ;
                  charts.Series<TimeSeriesSales, DateTime> value_co2 ;
                  charts.Series<TimeSeriesSales, DateTime> value_vant_2 ;
                  charts.Series<TimeSeriesSales, DateTime> value_temperatura ;
                  List<charts.Series<TimeSeriesSales, DateTime>> valueList_pm25 = [] ;
                  List<charts.Series<TimeSeriesSales, DateTime>> valueList_co2 = [] ;
                  List<charts.Series<TimeSeriesSales, DateTime>> valueList_pm25_vant = [] ;
                  List<charts.Series<TimeSeriesSales, DateTime>> valueList_temperatura = [] ;
                  List<charts.Series<TimeSeriesSales, DateTime>> valueList_pm25_2 = [];
                  value_pm25 = snapshot.data[0];
                  value_co2 = snapshot.data[1];
                  value_vant_2 = snapshot.data[4];
                  value_temperatura = snapshot.data[3];
                  valueList_pm25 = [value_pm25];
                  valueList_co2 = [value_co2];
                  valueList_pm25_vant = [value_pm25, value_vant_2..setAttribute(charts.measureAxisIdKey, 'secondaryMeasureAxisId')];
                  valueList_temperatura = [value_temperatura];
                  valueList_pm25_2 = snapshot.data[5];

                  return Column(
                    children: <Widget>[

                      //grafic pm25
                      Center(child: Text('Grafic de PM2.5 vs Timp'),),
                      SizedBox(height: 5.0,),
                      Card(
                        child: Container(
                          height: MediaQuery.of(context).size.height/4,
                          child: charts.TimeSeriesChart(
                            //valueList_pm25,
                            valueList_pm25_2,
                            animate: animate,
                            // Set the default renderer to a bar renderer.
                            // This can also be one of the custom renderers of the time series chart.
                            defaultRenderer: new charts.BarRendererConfig<DateTime>(),
                            // It is recommended that default interactions be turned off if using bar
                            // renderer, because the line point highlighter is the default for time
                            // series chart.
                            defaultInteractions: false,
                            // If default interactions were removed, optionally add select nearest
                            // and the domain highlighter that are typical for bar charts.
                            behaviors: [new charts.SelectNearest(), new charts.DomainHighlighter(),
                              new charts.ChartTitle(
                                'PM2.5',
                                behaviorPosition: charts.BehaviorPosition.start,
                                titleOutsideJustification: charts.OutsideJustification.middleDrawArea,
                                titleStyleSpec: charts.TextStyleSpec(fontSize: 12,),
                              ),
                              new charts.ChartTitle(
                                'Timp',
                                behaviorPosition: charts.BehaviorPosition.bottom,
                                titleOutsideJustification: charts.OutsideJustification.middleDrawArea,
                                titleStyleSpec: charts.TextStyleSpec(fontSize: 12,),
                              ),
                              new charts.RangeAnnotation([
                                new charts.LineAnnotationSegment(
                                  25, charts.RangeAnnotationAxisType.measure,
                                  endLabel: 'Valoarea limită UE',
                                  color: charts.MaterialPalette.green.shadeDefault.darker,),
                              ]),
                            ],
                          ),
                        ),
                      ),

                      SizedBox(height: 20.0,),

                      //grafic co2
                      Center(child: Text('Grafic de CO2 vs Timp'),),
                      SizedBox(height: 5.0,),
                      Card(
                        child: Container(
                          height: MediaQuery.of(context).size.height/4,
                          child: charts.TimeSeriesChart(
                            valueList_co2,
                            animate: animate,
                            // Set the default renderer to a bar renderer.
                            // This can also be one of the custom renderers of the time series chart.
                            defaultRenderer: new charts.BarRendererConfig<DateTime>(),
                            // It is recommended that default interactions be turned off if using bar
                            // renderer, because the line point highlighter is the default for time
                            // series chart.
                            defaultInteractions: false,
                            // If default interactions were removed, optionally add select nearest
                            // and the domain highlighter that are typical for bar charts.
                            behaviors: [new charts.SelectNearest(), new charts.DomainHighlighter(),
                              new charts.ChartTitle(
                                'CO2',
                                behaviorPosition: charts.BehaviorPosition.start,
                                titleOutsideJustification: charts.OutsideJustification.middleDrawArea,
                                titleStyleSpec: charts.TextStyleSpec(fontSize: 12,),
                              ),
                              new charts.ChartTitle(
                                'Timp',
                                behaviorPosition: charts.BehaviorPosition.bottom,
                                titleOutsideJustification: charts.OutsideJustification.middleDrawArea,
                                titleStyleSpec: charts.TextStyleSpec(fontSize: 12,),
                              ),
                            ],
                          ),
                        ),
                      ),

                      SizedBox(height: 20.0,),

                      //grafic pm25 & vant
                      Center(child: Text('Grafic de PM2.5 & Viteza Vântului vs Timp'),),
                      SizedBox(height: 5.0,),
                      Card(
                        child: Container(
                          height: MediaQuery.of(context).size.height/4,
                          child: charts.TimeSeriesChart(
                            valueList_pm25_vant,
                            animate: animate,
                            //barGroupingType:,
                            primaryMeasureAxis: new charts.NumericAxisSpec(
                              tickProviderSpec: new charts.BasicNumericTickProviderSpec(desiredTickCount: 3),
                            ),
                            secondaryMeasureAxis: new charts.NumericAxisSpec(
                              tickProviderSpec: new charts.BasicNumericTickProviderSpec(desiredTickCount: 3),
                            ),
                            // Set the default renderer to a bar renderer.
                            // This can also be one of the custom renderers of the time series chart.
                            defaultRenderer: new charts.BarRendererConfig<DateTime>(),
                            // It is recommended that default interactions be turned off if using bar
                            // renderer, because the line point highlighter is the default for time
                            // series chart.
                            defaultInteractions: false,
                            // If default interactions were removed, optionally add select nearest
                            // and the domain highlighter that are typical for bar charts.
                            behaviors: [new charts.SelectNearest(), new charts.DomainHighlighter(),
                              new charts.ChartTitle(
                                'PM2.5',
                                behaviorPosition: charts.BehaviorPosition.start,
                                titleOutsideJustification: charts.OutsideJustification.middleDrawArea,
                                titleStyleSpec: charts.TextStyleSpec(fontSize: 12,),
                              ),
                              new charts.ChartTitle(
                                'Vânt',
                                behaviorPosition: charts.BehaviorPosition.end,
                                titleOutsideJustification: charts.OutsideJustification.middleDrawArea,
                                titleStyleSpec: charts.TextStyleSpec(fontSize: 12,),
                              ),
                              new charts.ChartTitle(
                                'Timp',
                                behaviorPosition: charts.BehaviorPosition.bottom,
                                titleOutsideJustification: charts.OutsideJustification.middleDrawArea,
                                titleStyleSpec: charts.TextStyleSpec(fontSize: 12,),
                              ),
                            ],
                          ),
                        ),
                      ),

                      SizedBox(height: 20.0,),

                      //grafic temperatura
                      Center(child: Text('Grafic de Temperatură vs Timp'),),
                      SizedBox(height: 5.0,),
                      Card(
                        child: Container(
                          height: MediaQuery.of(context).size.height/4,
                          child: charts.TimeSeriesChart(
                            valueList_temperatura,
                            animate: animate,
                            // Set the default renderer to a bar renderer.
                            // This can also be one of the custom renderers of the time series chart.
                            defaultRenderer: new charts.BarRendererConfig<DateTime>(),
                            // It is recommended that default interactions be turned off if using bar
                            // renderer, because the line point highlighter is the default for time
                            // series chart.
                            defaultInteractions: false,
                            // If default interactions were removed, optionally add select nearest
                            // and the domain highlighter that are typical for bar charts.
                            behaviors: [new charts.SelectNearest(), new charts.DomainHighlighter(),
                              new charts.ChartTitle(
                                'Temperatură',
                                behaviorPosition: charts.BehaviorPosition.start,
                                titleOutsideJustification: charts.OutsideJustification.middleDrawArea,
                                titleStyleSpec: charts.TextStyleSpec(fontSize: 12,),
                              ),
                              new charts.ChartTitle(
                                'Timp',
                                behaviorPosition: charts.BehaviorPosition.bottom,
                                titleOutsideJustification: charts.OutsideJustification.middleDrawArea,
                                titleStyleSpec: charts.TextStyleSpec(fontSize: 12,),
                              ),
                            ],
                          ),
                        ),
                      ),

                    ],
                  );


                }else if(snapshot.hasError){
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
                      valueColor: AlwaysStoppedAnimation<Color>(Color(0xCC38A49C)),
                    ),
                  ),
                );
              },
            ),
          ),

          SizedBox(height: 10.0,),
        ],
      ),
    );

  }

}

/// Sample time series data type.
class TimeSeriesSales {
  final DateTime time;
  final int sales;

  TimeSeriesSales(this.time, this.sales);
}

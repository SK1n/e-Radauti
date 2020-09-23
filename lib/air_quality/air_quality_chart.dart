import 'package:flutter/material.dart';
import 'package:flutterapperadauti/air_quality/air_quality_chart_model.dart';
import 'package:charts_flutter/flutter.dart' as charts;

class AirQualityChart extends StatelessWidget {
  final List<AirQualityChartModel> data;
  AirQualityChart({@required this.data});
  @override
  Widget build(BuildContext context) {
    List<charts.Series<AirQualityChartModel, String>> series = [
      charts.Series(
          id: 'Calitatea aerului',
          data: data,
          domainFn: (AirQualityChartModel series, _) =>
              series.valueType.toString(),
          measureFn: (AirQualityChartModel series, _) => series.val,
          colorFn: (AirQualityChartModel series, _) => series.barColor),
    ];
    return Container(
      height: 400,
      padding: EdgeInsets.all(20),
      child: Card(
        child: Column(
          children: [
            Expanded(
              child: charts.BarChart(
                series,
                animate: true,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

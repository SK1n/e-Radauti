import 'package:flutter/material.dart';
import 'package:flutterapperadauti/data/models/air_quality/air_quality_color_model.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class CreateChart extends StatelessWidget {
  final List<LineSeries<ChartSampleData, DateTime>> data;
  final String axisTitle;
  final String dateFormat;
  final String chartTitle;
  final String labelFormat;
  final String interactiveTooltipFormat;
  final Legend legend;
  const CreateChart({
    super.key,
    required this.data,
    required this.axisTitle,
    this.dateFormat = r'HH:mm',
    required this.chartTitle,
    this.labelFormat = r'{value}',
    this.interactiveTooltipFormat = 'point.x : point.y',
    required this.legend,
  });

  Card _buildDefaultDateTimeAxisChart() {
    return Card(
      elevation: 2,
      child: SfCartesianChart(
          legend: legend,
          plotAreaBorderWidth: 0,
          title: ChartTitle(text: chartTitle.tr),
          primaryXAxis: DateTimeAxis(
            title: AxisTitle(text: "time".tr),
            majorGridLines: const MajorGridLines(width: 0),
            dateFormat: DateFormat(dateFormat),
            interval: 2,
          ),
          primaryYAxis: NumericAxis(
            interval: 5,
            labelFormat: labelFormat,
            title: AxisTitle(text: axisTitle),
            axisLine: const AxisLine(width: 0),
            majorTickLines: const MajorTickLines(size: 0),
          ),
          series: data,
          trackballBehavior: TrackballBehavior(
              enable: true,
              activationMode: ActivationMode.singleTap,
              tooltipSettings:
                  InteractiveTooltip(format: interactiveTooltipFormat))),
    );
  }

  @override
  Widget build(BuildContext context) {
    return _buildDefaultDateTimeAxisChart();
  }
}

class ChartSampleData {
  final double yValue;
  final DateTime x;
  final AirQualityColorModel? color;

  ChartSampleData({
    required this.x,
    required this.yValue,
    this.color,
  });
}

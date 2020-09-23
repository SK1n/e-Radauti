import 'package:flutter/foundation.dart';
import 'package:charts_flutter/flutter.dart' as charts;

class AirQualityChartModel {
  final double val;
  final String valueType;
  final charts.Color barColor;

  AirQualityChartModel(
      {@required this.val, @required this.valueType, @required this.barColor});
}

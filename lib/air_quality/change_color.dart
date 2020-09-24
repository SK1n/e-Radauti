import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart';

var changeColorInstance = ChangeColor();

class ChangeColor {
  charts.Color co2;
  charts.Color humidity;
  charts.Color pm25;

  charts.Color changeColorCo2(value) {
    if (value > 250 && value < 450) {
      return charts.ColorUtil.fromDartColor(Colors.green[300]);
    } else if (value > 450 && value <= 1000) {
      return charts.ColorUtil.fromDartColor(Colors.green[200]);
    } else if (value > 1000 && value <= 2000) {
      return charts.ColorUtil.fromDartColor(Colors.yellow[200]);
    } else if (value > 2000 && value <= 5000) {
      return charts.ColorUtil.fromDartColor(Colors.red[200]);
    } else if (value > 5000 && value <= 40000) {
      return charts.ColorUtil.fromDartColor(Colors.red[300]);
    } else if (value > 40000) {
      return charts.ColorUtil.fromDartColor(Colors.red[500]);
    } else {
      return charts.ColorUtil.fromDartColor(Colors.green[300]);
    }
  }

  charts.Color changeColorHumidity(value) {
    if (value > 20 && value <= 35) {
      return charts.ColorUtil.fromDartColor(Colors.blue[100]);
    } else if (value > 35 && value <= 60) {
      return charts.ColorUtil.fromDartColor(Colors.blue[200]);
    } else if (value > 60) {
      return charts.ColorUtil.fromDartColor(Colors.blue[300]);
    } else {
      return charts.ColorUtil.fromDartColor(Colors.blue[50]);
    }
  }

  charts.Color changeColorPm25(value) {
    if (value > 0 && value <= 12) {
      return charts.ColorUtil.fromDartColor(Colors.pink[50]);
    } else if (value > 12 && value <= 35.4) {
      return charts.ColorUtil.fromDartColor(Colors.pink[100]);
    } else if (value > 35.4 && value <= 55.4) {
      return charts.ColorUtil.fromDartColor(Colors.pink[200]);
    } else {
      return charts.ColorUtil.fromDartColor(Colors.pink[300]);
    }
  }
}

import 'package:flutter/material.dart';

var changeColorInstance = ChangeColor();

class ChangeColor {
  String changeTextQuality(value) {
    if (value > 0 && value <= 12) {
      return "Buna";
    } else if (value > 12 && value <= 35.4) {
      return "Moderat";
    } else if (value > 35.4 && value <= 55.4) {
      return 'Rea';
    } else {
      return 'Grava';
    }
  }

  Color changeColorQuality(value) {
    if (value > 0 && value <= 12) {
      return Colors.green[300];
    } else if (value > 12 && value <= 35.4) {
      return Colors.yellow[200];
    } else if (value > 35.4 && value <= 55.4) {
      return Colors.red[200];
    } else {
      return Colors.red[500];
    }
  }
}

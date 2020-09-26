import 'package:flutter/material.dart';

var changeColorInstance = ChangeColor();

class ChangeColor {
  String changeTextQuality(value) {
    if (value > 0 && value <= 12) {
      return "Bună";
    } else if (value > 12 && value <= 35.4) {
      return "Moderată";
    } else if (value > 35.4 && value <= 55.4) {
      return 'Rea';
    } else if (value > 55.4 && value <= 150) {
      return 'Nesănătoasă';
    } else if (value > 150 && value <= 250) {
      return 'Foarte nesănătoasă';
    } else {
      return 'Gravă';
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

import 'package:flutter/material.dart';

var changeColorInstance = ChangeColor();

class ChangeColor {
  RichText changeTextQuality(value) {
    if (value > 0 && value <= 12) {
      return RichText(
          text: TextSpan(
              text: 'Calitatea aerului: \n\n',
              style: TextStyle(color: Colors.black),
              children: [
            TextSpan(
                text: 'Bună',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
          ]));
    } else if (value > 12 && value <= 35.4) {
      return RichText(
          text: TextSpan(
              text: 'Calitatea aerului: \n\n',
              style: TextStyle(color: Colors.black),
              children: [
            TextSpan(
                text: 'Moderată',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
          ]));
    } else if (value > 35.4 && value <= 55.4) {
      return RichText(
          text: TextSpan(
              text: 'Calitatea aerului: \n\n',
              style: TextStyle(color: Colors.black),
              children: [
            TextSpan(
                text: 'Rea',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
          ]));
    } else if (value > 55.4 && value <= 150) {
      return RichText(
          text: TextSpan(
              text: 'Calitatea aerului: \n\n',
              style: TextStyle(color: Colors.black),
              children: [
            TextSpan(
                text: 'Nesănătoasă',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
          ]));
    } else if (value > 150 && value <= 250) {
      return RichText(
          text: TextSpan(
              text: 'Calitatea aerului: \n\n',
              style: TextStyle(color: Colors.black),
              children: [
            TextSpan(
                text: 'Foarte nesănătoasă',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
          ]));
    } else {
      return RichText(
          text: TextSpan(
              text: 'Calitatea aerului: \n\n',
              style: TextStyle(color: Colors.black),
              children: [
            TextSpan(
                text: 'Gravă',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24)),
          ]));
    }
  }

//Reminder: if you change any of this values, please also change it in legend.dart
//otherwise the colors won't match
  Color changeColorQuality(value) {
    if (value > 0 && value <= 12) {
      return Colors.green;
    } else if (value > 12 && value <= 35.4) {
      return Colors.yellow;
    } else if (value > 35.4 && value <= 55.4) {
      return Colors.orange;
    } else {
      return Colors.red;
    }
  }
}

import 'package:flutter/material.dart';

var changeColorInstance = ChangeColor();

class ChangeColor {
  RichText changeTextQuality(value) {
    if (value > 0 && value <= 10) {
      return RichText(
          textAlign: TextAlign.center,
          text: TextSpan(
              text: 'Calitatea aerului: \n\n',
              style: TextStyle(color: Colors.black),
              children: [
                TextSpan(
                    text: 'Bună',
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
              ]));
    } else if (value > 10 && value <= 20) {
      return RichText(
          textAlign: TextAlign.center,
          text: TextSpan(
              text: 'Calitatea aerului: \n\n',
              style: TextStyle(color: Colors.black),
              children: [
                TextSpan(
                    text: 'Acceptabilă',
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
              ]));
    } else if (value > 20 && value <= 25) {
      return RichText(
          textAlign: TextAlign.center,
          text: TextSpan(
              text: 'Calitatea aerului: \n\n',
              style: TextStyle(color: Colors.black),
              children: [
                TextSpan(
                    text: 'Moderată',
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
              ]));
    } else if (value > 25 && value <= 50) {
      return RichText(
          textAlign: TextAlign.center,
          text: TextSpan(
              text: 'Calitatea aerului: \n\n',
              style: TextStyle(color: Colors.black),
              children: [
                TextSpan(
                    text: 'Rea',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    )),
              ]));
    } else if (value > 50 && value <= 75) {
      return RichText(
          textAlign: TextAlign.center,
          text: TextSpan(
              text: 'Calitatea aerului: \n\n',
              style: TextStyle(color: Colors.black),
              children: [
                TextSpan(
                    text: 'Foarte rea',
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
              ]));
    } else {
      return RichText(
          textAlign: TextAlign.center,
          text: TextSpan(
              text: 'Calitatea aerului: \n\n',
              style: TextStyle(color: Colors.black),
              children: [
                TextSpan(
                    text: 'Extrem de rea',
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 24)),
              ]));
    }
  }

  Color changeColorQuality(value) {
    if (value > 0 && value <= 10) {
      return Color.fromRGBO(80, 240, 230, 1);
      //return Colors.green;
    } else if (value > 10 && value <= 20) {
      return Color.fromRGBO(80, 204, 170, 1);
    } else if (value > 20 && value <= 25) {
      return Color.fromRGBO(240, 230, 65, 1);
    } else if (value > 25 && value <= 50) {
      return Color.fromRGBO(255, 80, 80, 1);
    } else if (value > 50 && value <= 75) {
      return Color.fromRGBO(150, 0, 50, 1);
    } else if (value > 75) {
      return Color.fromRGBO(125, 33, 129, 1);
    } else {
      return Colors.red;
    }
  }
}

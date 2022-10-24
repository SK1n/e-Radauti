import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:fluttericon/font_awesome5_icons.dart';
import 'package:get/get.dart';

class ColorLegendWidget extends StatelessWidget {
  const ColorLegendWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        boxDetails(const Color.fromARGB(255, 78, 236, 226),
            'Nivelul de PM2,5 este bun (0 - 10 \u03BCg/m\u00B3)'),
        boxDetails(const Color.fromARGB(255, 13, 95, 73),
            'Nivelul de PM2,5 este acceptabil (10 - 20 \u03BCg/m\u00B3)'),
        boxDetails(const Color.fromARGB(255, 236, 228, 63),
            'Nivelul de PM2,5 este moderat (20 - 25 \u03BCg/m\u00B3)'),
        boxDetails(const Color.fromARGB(255, 238, 74, 74),
            'Nivelul de PM2,5 este rău (25 - 50 \u03BCg/m\u00B3)'),
        boxDetails(const Color.fromARGB(255, 167, 25, 25),
            'Nivelul de PM2,5 este foarte rău (50 - 75 \u03BCg/m\u00B3)'),
        boxDetails(const Color.fromARGB(255, 126, 5, 5),
            'Nivelul de PM2,5 este extrem de rău (75 - 800 \u03BCg/m\u00B3)'),
      ],
    );
  }

  Row boxDetails(Color color, String text) {
    return Row(
      children: [
        TextButton(
          onPressed: null,
          child: Icon(
            FontAwesome5.square,
            color: color,
            //You also have to change the color in value_adapter.dart
            //in case you change the colors
          ),
        ),
        Expanded(
          child: SizedBox(
            width: Get.width,
            child: AutoSizeText(
              text,
              maxLines: 2,
            ),
          ),
        ),
      ],
    );
  }
}

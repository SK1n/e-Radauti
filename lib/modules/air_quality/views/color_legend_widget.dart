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
        boxDetails(
            const Color.fromARGB(255, 78, 236, 226), 'color-meaning-blue'.tr),
        boxDetails(
            const Color.fromARGB(255, 13, 95, 73), 'color-meaning-green'.tr),
        boxDetails(
            const Color.fromARGB(255, 236, 228, 63), 'color-meaning-yellow'.tr),
        boxDetails(
            const Color.fromARGB(255, 238, 74, 74), 'color-meaning-pink'.tr),
        boxDetails(
            const Color.fromARGB(255, 167, 25, 25), 'color-meaning-red'.tr),
        boxDetails(
            const Color.fromARGB(255, 126, 5, 5), 'color-meaning-red-dark'.tr),
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


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
            const Color.fromARGB(255, 80, 240, 230), 'color-meaning-blue'.tr),
        boxDetails(
            const Color.fromARGB(255, 80, 204, 170), 'color-meaning-green'.tr),
        boxDetails(
            const Color.fromARGB(255, 240, 230, 65), 'color-meaning-yellow'.tr),
        boxDetails(
            const Color.fromARGB(255, 255, 80, 80), 'color-meaning-pink'.tr),
        boxDetails(
            const Color.fromARGB(255, 150, 0, 50), 'color-meaning-red'.tr),
        boxDetails(const Color.fromARGB(255, 125, 33, 129),
            'color-meaning-red-dark'.tr),
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
            child: Text(
              text,
              maxLines: 2,
            ),
          ),
        ),
      ],
    );
  }
}

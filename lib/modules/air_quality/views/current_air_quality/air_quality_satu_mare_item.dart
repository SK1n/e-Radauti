import 'package:flutter/material.dart';
import 'package:flutterapperadauti/data/models/air_quality/air_quality_item_model.dart';
import 'package:flutterapperadauti/modules/air_quality/controllers/air_quality_controller.dart';
import 'package:flutterapperadauti/utils/extensions/text_luminance.dart';
import 'package:fluttericon/entypo_icons.dart';
import 'package:fluttericon/meteocons_icons.dart';
import 'dart:math' as math;
import 'package:get/get.dart';

class AirQualitySatuMare extends StatelessWidget {
  final AirQualityItemModel data;
  const AirQualitySatuMare(this.data, {super.key});

  @override
  Widget build(BuildContext context) {
    final AirQualityController airQualityController = Get.find();
    Color bgColor = Color.fromARGB(
        255, data.centerColor.r, data.centerColor.g, data.centerColor.b);
    return Column(
      children: [
        Card(
          elevation: 5,
          child: Container(
            padding: const EdgeInsets.all(10),
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Text(
                          '${data.dateTime}\n${'radauti-iesire-dornesti'.tr}'),
                    ),
                    Expanded(
                      child: Text(
                        '${data.dornestiTemp}°C | ${data.dornestiHm}%',
                        textAlign: TextAlign.end,
                      ),
                    ),
                  ],
                ),
                const Divider(),
                IntrinsicHeight(
                  child: Card(
                    child: Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: Color.fromARGB(
                          255,
                          data.dornestiColor.r,
                          data.dornestiColor.g,
                          data.dornestiColor.b,
                        ),
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            child: Container(
                              decoration: BoxDecoration(
                                color: Color.fromARGB(
                                  255,
                                  data.dornestiColor.r,
                                  data.dornestiColor.g,
                                  data.dornestiColor.b,
                                ),
                              ),
                              child: Image.asset(
                                airQualityController.bindQualityImage(
                                  data.dornestiImage.toInt(),
                                ),
                                width: 40,
                                height: 40,
                                color: bgColor.computeLuminance() < 0.5
                                    ? Colors.white
                                    : Colors.black,
                              ),
                            ),
                          ),
                          VerticalDivider(
                            width: 10,
                            thickness: 2,
                            color: bgColor.computeLuminance() < 0.5
                                ? Colors.white
                                : Colors.black,
                          ),
                          Expanded(
                            flex: 2,
                            child: Column(
                              children: [
                                Text(
                                  data.dornestiQuality
                                      .toLowerCase()
                                      .replaceAll(" ", "-")
                                      .tr,
                                  style: const TextStyle(fontSize: 20),
                                ).luminance(bgColor),
                                Text('${data.dornestiPm} PM2.5')
                                    .luminance(bgColor),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
        Card(
          elevation: 2,
          child: Column(
            children: [
              ListTile(
                leading: TextButton.icon(
                  icon: const Icon(
                    Meteocons.wind,
                  ),
                  label: Text(
                    "${"wind".tr} ${data.dornestiWindSpeed} m/s",
                    textAlign: TextAlign.left,
                    maxLines: 2,
                    style: const TextStyle(fontSize: 16.0),
                  ),
                  onPressed: () {},
                ),
                trailing: Transform.rotate(
                  angle: data.dornestiWindDirection.toDouble() * math.pi / 180,
                  child: Image.asset(
                      'assets/wind/direction_${Get.isDarkMode ? 'white' : 'black'}.png'),
                ),
              ),
              ListTile(
                leading: TextButton.icon(
                  onPressed: () {},
                  icon: const Icon(
                    Entypo.gauge,
                  ),
                  label: Text(
                    '${data.dornestiPression / 100} mBar',
                    maxLines: 2,
                    style: const TextStyle(fontSize: 16.0),
                  ),
                ),
                // trailing: TextButton.icon(
                //   onPressed: () {},
                //   icon: const Icon(
                //     LineariconsFree.flag,
                //   ),
                //   label: Text(data.direction!.tr),
                // ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

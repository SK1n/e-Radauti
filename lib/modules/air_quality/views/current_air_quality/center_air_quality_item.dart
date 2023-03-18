
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterapperadauti/data/models/air_quality/air_quality_item_model.dart';
import 'package:flutterapperadauti/modules/air_quality/controllers/air_quality_controller.dart';
import 'package:flutterapperadauti/utils/extensions/text_luminance.dart';
import 'package:fluttericon/entypo_icons.dart';
import 'package:fluttericon/meteocons_icons.dart';
import 'package:get/get.dart';

class CenterAirQualityItem extends StatelessWidget {
  final AirQualityItemModel data;
  const CenterAirQualityItem(this.data, {super.key});

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
                      child: Text('${data.dateTime}\n${'centru-radauti'.tr}'),
                    ),
                    Expanded(
                      child: Text(
                        '${data.centerTemp}°C | ${data.centerHm}%',
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
                        color: bgColor,
                        // Colors.black
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            child: Container(
                              decoration: BoxDecoration(
                                color: bgColor,
                              ),
                              child: Image.asset(
                                  airQualityController.bindQualityImage(
                                      data.centerImage.toInt()),
                                  width: 40,
                                  height: 40,
                                  color: bgColor.computeLuminance() < 0.5
                                      ? Colors.white
                                      : Colors.black),
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
                                    data.centerQuality
                                        .toLowerCase()
                                        .replaceAll(" ", "-")
                                        .tr,
                                    style: const TextStyle(fontSize: 20),
                                  ).luminance(bgColor),
                                  Text('${data.centerPm} PM2.5')
                                      .luminance(bgColor),
                                ],
                              )),
                          VerticalDivider(
                            width: 10,
                            thickness: 2,
                            color: bgColor.computeLuminance() < 0.5
                                ? Colors.white
                                : Colors.black,
                          ),
                          Expanded(
                              child: Column(
                            children: [
                              Text(
                                data.centerCo.toString(),
                                style: const TextStyle(fontSize: 20),
                              ).luminance(bgColor),
                              const Text('CO2').luminance(bgColor)
                            ],
                          ))
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
                    "${"wind".tr} ${data.roMeteoWindSpeed} m/s",
                    textAlign: TextAlign.left,
                    maxLines: 2,
                    style: const TextStyle(fontSize: 16.0),
                  ),
                  onPressed: () {},
                ),
                trailing: Text(
                  '${"direction".tr} ${data.roMeteoWindDirection.tr}',
                  maxLines: 2,
                  style: const TextStyle(fontSize: 16.0),
                ),
              ),
              ListTile(
                leading: TextButton.icon(
                  onPressed: () {},
                  icon: const Icon(
                    Entypo.gauge,
                  ),
                  label: Text(
                    '${data.roMeteoPression} mBar',
                    maxLines: 2,
                    style: const TextStyle(fontSize: 16.0),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

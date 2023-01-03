import 'package:flutter/material.dart';
import 'package:flutterapperadauti/data/models/satu_mare/satu_mare_item_model.dart';
import 'package:flutterapperadauti/data/models/satu_mare/satu_mare_model.dart';
import 'package:flutterapperadauti/modules/air_quality/controllers/air_quality_controller.dart';
import 'package:flutterapperadauti/utils/helpers/get_data_firebase.dart';
import 'package:flutterapperadauti/utils/shared_widgets/futuristic.dart';
import 'package:fluttericon/entypo_icons.dart';
import 'package:fluttericon/linearicons_free_icons.dart';
import 'package:fluttericon/meteocons_icons.dart';
import 'package:fluttericon/rpg_awesome_icons.dart';
import 'package:fluttericon/typicons_icons.dart';
import 'dart:math' as math;
import 'package:get/get.dart';

class AirQualitySatuMareItem extends StatelessWidget with GetDataFirebase {
  const AirQualitySatuMareItem({super.key});

  @override
  Widget build(BuildContext context) {
    final AirQualityController airQualityController = Get.find();
    return Futuristic(
      initialBuilder: (_, __) => Container(),
      futureBuilder: () => airQualityController.getData(
          convert: SatuMareModel.fromJson, document: 'AirSatuMare'),
      dataBuilder: (context, snapshot) {
        SatuMareModel data = snapshot as SatuMareModel;
        SatuMareItemModel item = data.item![0];
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
                              '${item.fDate}\n${'radauti-iesire-dornesti'.tr}'),
                        ),
                        Expanded(
                          child: Text(
                            '${item.temp}°C | ${item.hm}%',
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
                                  item.a!, item.r!, item.g!, item.b!)),
                          child: Row(
                            children: [
                              Expanded(
                                child: Container(
                                  decoration: BoxDecoration(
                                      color: Color.fromARGB(
                                          item.a!, item.r!, item.g!, item.b!)),
                                  child: Image.asset(
                                    'assets/faces/${item.quality}.png',
                                    width: 40,
                                    height: 40,
                                  ),
                                ),
                              ),
                              const VerticalDivider(
                                width: 10,
                                thickness: 2,
                              ),
                              Expanded(
                                flex: 2,
                                child: Column(
                                  children: [
                                    Text(
                                      item.quality!
                                          .toLowerCase()
                                          .replaceAll(" ", "-")
                                          .tr,
                                      style: const TextStyle(fontSize: 20),
                                    ),
                                    Text('${item.pm} PM2.5'),
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
                        "${"wind".tr} ${item.wind!} m/s",
                        textAlign: TextAlign.left,
                        maxLines: 2,
                        style: const TextStyle(fontSize: 16.0),
                      ),
                      onPressed: () {},
                    ),
                    trailing: TextButton.icon(
                      icon: Transform.rotate(
                        angle:
                            item.directionDegrees!.toDouble() * math.pi / 180,
                        child: Image.asset(
                            'assets/wind/direction_${Get.isDarkMode ? 'white' : 'black'}.png'),
                      ),
                      label: Text(
                        '${"direction".tr} ${item.direction!.tr}',
                        maxLines: 2,
                        style: const TextStyle(fontSize: 16.0),
                      ),
                      onPressed: () {},
                    ),
                  ),
                  ListTile(
                    leading: TextButton.icon(
                      onPressed: () {},
                      icon: const Icon(
                        Entypo.gauge,
                      ),
                      label: Text(
                        '${item.pression} mBar',
                        maxLines: 2,
                        style: const TextStyle(fontSize: 16.0),
                      ),
                    ),
                    trailing: TextButton.icon(
                      onPressed: () {},
                      icon: const Icon(
                        LineariconsFree.flag,
                      ),
                      label: Text(item.direction!.tr),
                    ),
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}

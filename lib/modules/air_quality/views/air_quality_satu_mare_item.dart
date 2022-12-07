import 'package:flutter/material.dart';
import 'package:flutterapperadauti/data/models/satu_mare/satu_mare_item_model.dart';
import 'package:flutterapperadauti/data/models/satu_mare/satu_mare_model.dart';
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
    return Futuristic(
      futureBuilder: () =>
          getData(convert: SatuMareModel.fromJson, document: 'AirSatuMare'),
      dataBuilder: (context, snapshot) {
        SatuMareModel data = snapshot.data;
        SatuMareItemModel item = data.item![0];

        return Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(
                '${"radauti-iesire-dornesti".tr}\n${item.fDate}',
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Card(
              elevation: 3,
              child: Column(
                children: [
                  Container(
                    color: Color.fromARGB(item.a!, item.r!, item.g!, item.b!),
                    padding: const EdgeInsets.only(top: 10, bottom: 10),
                    child: IntrinsicHeight(
                      child: Row(
                        children: <Widget>[
                          Expanded(
                            flex: 1,
                            child: Align(
                              alignment: Alignment.center,
                              child: Text(
                                item.quality!
                                    .toLowerCase()
                                    .replaceAll(" ", "-")
                                    .tr,
                                style: const TextStyle(color: Colors.white),
                              ),
                            ),
                          ),
                          VerticalDivider(
                            thickness: 1,
                            color: context.theme.canvasColor,
                          ),
                          Expanded(
                            flex: 1,
                            child: Align(
                              alignment: Alignment.center,
                              child: Column(
                                children: [
                                  const Text(
                                    'PM2,5',
                                    style: TextStyle(
                                        fontSize: 14, color: Colors.white),
                                  ),
                                  Text(
                                    '${item.pm}',
                                    style: const TextStyle(
                                        fontSize: 24, color: Colors.white),
                                  ),
                                  const Text(
                                    '\u03BCg/m\u00B3',
                                    style: TextStyle(
                                        fontSize: 18, color: Colors.white),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 0, bottom: 0),
                    child: ListTile(
                      leading: TextButton.icon(
                        icon: const Icon(
                          Typicons.temperatire,
                          size: 30,
                        ),
                        label: Text('${item.temp}°C',
                            style: const TextStyle(
                              fontSize: 24,
                            )),
                        onPressed: () {
                          DoNothingAction();
                        },
                      ),
                      trailing: TextButton.icon(
                        icon: const Icon(
                          RpgAwesome.droplet,
                          size: 30,
                        ),
                        label: Text('${item.hm}%',
                            style: const TextStyle(
                              fontSize: 24,
                            )),
                        onPressed: () {},
                      ),
                    ),
                  ),
                ],
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

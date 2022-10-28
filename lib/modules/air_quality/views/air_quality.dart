import 'package:flutter/material.dart';
import 'package:flutterapperadauti/data/models/air_quality/air_quality_item_model.dart';
import 'package:flutterapperadauti/data/models/air_quality/air_quality_model.dart';
import 'package:flutterapperadauti/modules/air_quality/views/air_quality_satu_mare_item.dart';
import 'package:flutterapperadauti/modules/air_quality/views/legend.dart';
import 'package:flutterapperadauti/utils/helpers/get_data_firebase.dart';
import 'package:fluttericon/entypo_icons.dart';
import 'package:fluttericon/linearicons_free_icons.dart';
import 'package:fluttericon/meteocons_icons.dart';
import 'package:flutterapperadauti/utils/shared_widgets/futuristic.dart';
import 'package:fluttericon/rpg_awesome_icons.dart';
import 'package:fluttericon/typicons_icons.dart';
import 'dart:math' as math;
import 'package:get/get.dart';

class AirQuality extends StatelessWidget with GetDataFirebase {
  const AirQuality({super.key});
  @override
  Widget build(BuildContext context) {
    return Futuristic(
      futureBuilder: () =>
          getData(document: 'Air', convert: AirQualityModel.fromJson),
      dataBuilder: (context, snapshot) {
        AirQualityModel data = snapshot.data;
        AirQualityItemModel? item = data.item?[0];
        return CustomScrollView(
          slivers: [
            SliverPadding(
              padding: const EdgeInsets.all(8.0),
              sliver: SliverList(
                delegate: SliverChildListDelegate(
                  [
                    Text(
                      'CENTRU RĂDĂUȚI\n${item!.fDate!}',
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Card(
                      elevation: 3,
                      child: Column(
                        children: [
                          Container(
                            color: Color.fromARGB(
                                item.a!, item.r!, item.g!, item.b!),
                            padding: const EdgeInsets.only(top: 10, bottom: 10),
                            child: IntrinsicHeight(
                              child: Row(
                                children: <Widget>[
                                  Expanded(
                                    flex: 1,
                                    child: Align(
                                      alignment: Alignment.center,
                                      child: Text(
                                        item.quality!,
                                        style: const TextStyle(
                                            color: Colors.white),
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
                                                fontSize: 14,
                                                color: Colors.white),
                                          ),
                                          Text(
                                            '${item.pm}',
                                            style: const TextStyle(
                                                fontSize: 24,
                                                color: Colors.white),
                                          ),
                                          const Text(
                                            '\u03BCg/m\u00B3',
                                            style: TextStyle(
                                                fontSize: 18,
                                                color: Colors.white),
                                          ),
                                        ],
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
                                          const Text('CO2',
                                              style: TextStyle(
                                                  fontSize: 14,
                                                  color: Colors.white)),
                                          Text(
                                            '${item.co}',
                                            style: const TextStyle(
                                                fontSize: 24,
                                                color: Colors.white),
                                          ),
                                          const Text(
                                            'ppm',
                                            style: TextStyle(
                                                fontSize: 18,
                                                color: Colors.white),
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
                                label: Text('${item.tp}°C',
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
                                "Vânt ${item.windMs!} m/s",
                                textAlign: TextAlign.left,
                                maxLines: 2,
                                style: const TextStyle(fontSize: 16.0),
                              ),
                              onPressed: () {},
                            ),
                            trailing: TextButton.icon(
                              icon: Transform.rotate(
                                angle: item.directionDeg!.toDouble() *
                                    math.pi /
                                    180,
                                child: Image.asset(
                                    'assets/wind/direction_${Get.isDarkMode ? 'white' : 'black'}.png'),
                              ),
                              label: Text(
                                'Direcția ${item.direction}',
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
                                '${item.fPression} mBar',
                                maxLines: 2,
                                style: const TextStyle(fontSize: 16.0),
                              ),
                            ),
                            trailing: TextButton.icon(
                              onPressed: () {},
                              icon: const Icon(
                                LineariconsFree.flag,
                              ),
                              label: Text(item.direction!),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const AirQualitySatuMareItem(),
                    const AirQualityLegend(),
                  ],
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}

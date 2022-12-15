import 'package:flutter/material.dart';
import 'package:flutterapperadauti/data/models/air_quality/air_quality_item_model.dart';
import 'package:flutterapperadauti/data/models/air_quality/air_quality_model.dart';
import 'package:flutterapperadauti/modules/air_quality/views/air_quality_center_view.dart';
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
                    const AirQualityCenterView(),
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
                                "${"wind".tr} ${item!.windMs!} m/s",
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
                                '${"direction"} ${item.direction!.tr}',
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
                              label: Text(item.direction!.tr),
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

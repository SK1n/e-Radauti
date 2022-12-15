import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutterapperadauti/data/models/air_quality/air_quality_item_model.dart';
import 'package:flutterapperadauti/data/models/air_quality/air_quality_model.dart';
import 'package:flutterapperadauti/utils/helpers/get_data_firebase.dart';
import 'package:flutterapperadauti/utils/shared_widgets/futuristic.dart';
import 'package:fluttericon/rpg_awesome_icons.dart';
import 'package:fluttericon/typicons_icons.dart';
import 'package:get/get_utils/get_utils.dart';

class AirQualityCenterView extends StatelessWidget with GetDataFirebase {
  const AirQualityCenterView({super.key});

  @override
  Widget build(BuildContext context) {
    return Futuristic(
      futureBuilder: () =>
          getData(document: 'Air', convert: AirQualityModel.fromJson),
      dataBuilder: (context, snapshot) {
        AirQualityModel data = snapshot.data;
        AirQualityItemModel? item = data.item?[0];
        return Card(
          child: Column(
            children: [
              Text(
                '${"centru-radauti".tr}\n${item!.fDate!}',
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Container(
                color: Color.fromARGB(item.a!, item.r!, item.g!, item.b!),
                child: IntrinsicHeight(
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        flex: 1,
                        child: Align(
                          alignment: Alignment.center,
                          child: Text(
                            item.quality!.toLowerCase().replaceAll(" ", "-").tr,
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
                                      fontSize: 14, color: Colors.white)),
                              Text(
                                '${item.co}',
                                style: const TextStyle(
                                    fontSize: 24, color: Colors.white),
                              ),
                              const Text(
                                'ppm',
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
              ListTile(
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
            ],
          ),
        );
      },
    );
  }
}

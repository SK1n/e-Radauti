import 'package:flutter/material.dart';
import 'package:flutterapperadauti/data/models/air_quality/air_quality_item_model.dart';
import 'package:flutterapperadauti/data/models/air_quality/air_quality_model.dart';
import 'package:flutterapperadauti/modules/air_quality/controllers/air_quality_controller.dart';
import 'package:flutterapperadauti/utils/shared_widgets/futuristic.dart';
import 'package:fluttericon/rpg_awesome_icons.dart';
import 'package:fluttericon/typicons_icons.dart';
import 'package:get/get.dart';
import 'package:get/get_utils/get_utils.dart';

class AirQualityCenterView extends StatelessWidget {
  const AirQualityCenterView({super.key});

  @override
  Widget build(BuildContext context) {
    final AirQualityController airQualityController = Get.find();
    return Card(
      elevation: 10,
      child: Futuristic(
        futureBuilder: () => airQualityController.getData(
          convert: AirQualityModel.fromJson,
          document: 'Air',
        ),
        dataBuilder: (context, snapshot) {
          AirQualityModel data = snapshot as AirQualityModel;
          AirQualityItemModel? item = data.item?[0];
          return Column(
            children: [
              Text(
                '${"centru-radauti".tr.toUpperCase()}\n${item!.fDate!}',
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Card(
                child: Container(
                  color: Color.fromARGB(item.a!, item.r!, item.g!, item.b!),
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
                              textAlign: TextAlign.center,
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
          );
        },
        initialBuilder: (BuildContext context, void Function() func) =>
            Container(),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutterapperadauti/data/models/air_quality/air_quality_item_model.dart';
import 'package:flutterapperadauti/data/models/air_quality/air_quality_model.dart';
import 'package:flutterapperadauti/modules/air_quality/controllers/air_quality_controller.dart';
import 'package:flutterapperadauti/utils/shared_widgets/futuristic.dart';
import 'package:get/get.dart';
import 'package:get/get_utils/get_utils.dart';

class AirQualityCenterView extends StatelessWidget {
  const AirQualityCenterView({super.key});

  @override
  Widget build(BuildContext context) {
    final AirQualityController airQualityController = Get.find();
    return Futuristic(
      futureBuilder: () => airQualityController.getData(
        convert: AirQualityModel.fromJson,
        document: 'Air',
      ),
      dataBuilder: (context, snapshot) {
        AirQualityModel data = snapshot as AirQualityModel;
        AirQualityItemModel? item = data.item?[0];
        return Card(
          elevation: 5,
          child: Container(
            padding: const EdgeInsets.all(10),
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Text('${item!.fDate}\n${'centru-radauti'.tr}'),
                    ),
                    Expanded(
                      child: Text(
                        '${item.tp}°C | ${item.hm}%',
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
                              )),
                          const VerticalDivider(
                            width: 10,
                            thickness: 2,
                          ),
                          Expanded(
                              child: Column(
                            children: [
                              Text(
                                item.co.toString(),
                                style: const TextStyle(fontSize: 20),
                              ),
                              const Text('CO2')
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
        );
      },
      initialBuilder: (BuildContext context, void Function() func) =>
          Container(),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_loadingindicator/flutter_loadingindicator.dart';
import 'package:flutterapperadauti/controllers/get_data_from_firebase_controller.dart';
import 'package:flutterapperadauti/modules/air_quality/screens/air_quality/controllers/air_quality_controller.dart';
import 'package:flutterapperadauti/modules/air_quality/screens/air_quality/legend.dart';
import 'package:flutterapperadauti/modules/air_quality/screens/air_quality/utils/value_adapter.dart';
import 'package:flutterapperadauti/modules/air_quality/screens/air_quality/utils/windDirection.dart';
import 'package:flutterapperadauti/modules/air_quality/screens/air_quality/utils/windDirectionLocation.dart';
import 'package:fluttericon/entypo_icons.dart';
import 'package:fluttericon/linearicons_free_icons.dart';
import 'package:fluttericon/meteocons_icons.dart';
import 'package:fluttericon/rpg_awesome_icons.dart';
import 'package:fluttericon/typicons_icons.dart';
import 'package:flutterapperadauti/utils/futuristic.dart';
import 'package:get/get.dart';

extension on String {
  firstSubstring() {
    return this.substring(0, this.indexOf(','));
  }
}

class AirQualityPage extends StatelessWidget {
  const AirQualityPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final GetDataFromFirebaseController _getDataFromFirebaseController =
        Get.find();
    final AirQualityController _airQualityController = Get.find();
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          Futuristic(
            futureBuilder: () =>
                _getDataFromFirebaseController.getDataFromFirebase('Air'),
            busyBuilder: (_) {
              if (!EasyLoading.isShow) {
                EasyLoading.show();
              }
              return Container();
            },
            errorBuilder: (_, error, retry) {
              EasyLoading.showError("Eroare");
              return TextButton(
                  onPressed: () => retry, child: Text('Incearca din nou!'));
            },
            dataBuilder: (_, snapshot) {
              if (EasyLoading.isShow) {
                EasyLoading.dismiss();
              }
              dynamic data = snapshot.data['air'][0];

              int index1 = data['wind'].toString().indexOf(',');
              int index2 = data['wind'].toString().indexOf(':');
              int index3 = data['pression'].toString().indexOf(' ');
              List windSplit = [
                data['wind'].toString().firstSubstring(),
                data['wind'].toString().substring(0, index1).trim(),
                data['wind'].toString().substring(index2 + 1).trim()
              ];
              String pression =
                  data['pression'].toString().substring(0, index3);
              return Container(
                width: MediaQuery.of(context).size.width,
                padding: EdgeInsets.only(bottom: 10, top: 10),
                child: Column(
                  children: [
                    Text(
                      'CENTRU RĂDĂUȚI',
                      style: TextStyle(
                        fontSize: 20,
                        color: Color(0xFF000000),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      _airQualityController.getDate(data['airTS'].toString()),
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    Container(
                      padding: EdgeInsets.only(top: 10, bottom: 10),
                      child: Card(
                        elevation: 3,
                        child: Column(
                          children: [
                            Container(),
                            Container(
                              color: changeColorInstance
                                  .changeColorQuality(data['pm25']),
                              padding: EdgeInsets.only(top: 10, bottom: 10),
                              child: Row(
                                children: <Widget>[
                                  Expanded(
                                    flex: 1,
                                    child: Align(
                                      alignment: Alignment.center,
                                      child: Column(
                                        children: [
                                          changeColorInstance
                                              .changeTextQuality(data['pm25']),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    flex: 1,
                                    child: Align(
                                      alignment: Alignment.center,
                                      child: Column(
                                        children: [
                                          Text(
                                            'PM2,5',
                                            style: TextStyle(fontSize: 14),
                                          ),
                                          Text(
                                            '${data['pm25'].toString()}',
                                            style: TextStyle(fontSize: 24),
                                          ),
                                          Text(
                                            '\u03BCg/m\u00B3',
                                            style: TextStyle(fontSize: 18),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    flex: 1,
                                    child: Align(
                                      alignment: Alignment.center,
                                      child: Column(
                                        children: [
                                          Text('CO2',
                                              style: TextStyle(fontSize: 14)),
                                          Text('${data['co2'].toString()}',
                                              style: TextStyle(fontSize: 24)),
                                          Text('ppm',
                                              style: TextStyle(fontSize: 18)),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: 0, bottom: 0),
                              child: ListTile(
                                leading: TextButton.icon(
                                  icon: Icon(
                                    Typicons.temperatire,
                                    size: 30,
                                    color: Colors.black,
                                  ),
                                  label: Text('${data['tp'].toString()}°C',
                                      style: TextStyle(
                                        fontSize: 24,
                                        color: Colors.black,
                                      )),
                                  onPressed: () {
                                    DoNothingAction();
                                  },
                                ),
                                trailing: TextButton.icon(
                                  icon: Icon(
                                    RpgAwesome.droplet,
                                    size: 30,
                                    color: Colors.black,
                                  ),
                                  label: Text('${data['hm'].toString()}%',
                                      style: TextStyle(
                                        fontSize: 24,
                                        color: Colors.black,
                                      )),
                                  onPressed: () {},
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Text(
                      'STAȚIA METEO',
                      style: TextStyle(
                        fontSize: 20,
                        color: Color(0xFF000000),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'Str. Ștefan cel Mare Nr. 132',
                      style: TextStyle(
                        fontSize: 16,
                        color: Color(0xFF000000),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Card(
                      elevation: 2,
                      child: Column(
                        children: [
                          Container(
                            child: ListTile(
                              leading: TextButton.icon(
                                icon: Icon(
                                  Meteocons.wind,
                                  color: Colors.black,
                                ),
                                label: new Text(
                                  "Vânt: \n" + windSplit[0],
                                  textAlign: TextAlign.left,
                                  maxLines: 2,
                                  style: const TextStyle(
                                      color: Colors.black, fontSize: 16.0),
                                ),
                                onPressed: () {},
                              ),
                              trailing: TextButton.icon(
                                icon: windDirection(
                                  windSplit[1],
                                ),
                                label: Text(
                                  'Direcția: \n${windSplit[1]}',
                                  maxLines: 2,
                                  style: const TextStyle(
                                      color: Colors.black, fontSize: 16.0),
                                ),
                                onPressed: () {},
                              ),
                            ),
                          ),
                          Container(
                            child: ListTile(
                              leading: TextButton.icon(
                                onPressed: () {},
                                icon: Icon(
                                  Entypo.gauge,
                                  color: Colors.black,
                                ),
                                label: Text(
                                  '${pression.toString()}\nmBar',
                                  maxLines: 2,
                                  style: const TextStyle(
                                      color: Colors.black, fontSize: 16.0),
                                ),
                              ),
                              trailing: TextButton.icon(
                                onPressed: () {},
                                icon: Icon(
                                  LineariconsFree.flag,
                                  color: Colors.black,
                                ),
                                label: windDirectionLocation(
                                  windSplit[1],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    AirQualityLegend(),
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutterapperadauti/air_quality/airquality_model.dart';
import 'package:dio/dio.dart';
import 'package:dio_http_cache/dio_http_cache.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutterapperadauti/air_quality/value_adapter.dart';
import 'package:flutterapperadauti/air_quality/legend.dart';
import 'package:intl/intl.dart';

import '../menu_page.dart';

class AirQualityPage extends StatefulWidget {
  @override
  _AirQualityPageState createState() => _AirQualityPageState();
}

class _AirQualityPageState extends State<AirQualityPage> {
  List<AirQualityModel> airqualityList;
  Map<String, dynamic> jsonResponse;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  var co2value;
  charts.Color barColorCo2;
  bool isLoading = false;

  Future<AirQualityModel> _getAirQuality() async {
    var dio = Dio();
    Response dioResponse;

    try {
      dio.interceptors.add(
          DioCacheManager(CacheConfig(baseUrl: "https://www.airvisual.com"))
              .interceptor);
      dioResponse = await dio.get(
          "https://www.airvisual.com/api/v2/node/5ded3e13994dfe107f7013a0",
          options: buildCacheOptions(Duration(minutes: 10)));
      debugPrint('dioResponse:' + dioResponse.data.toString());
    } catch (e) {
      print('catch error: $e');
    }
    return AirQualityModel.fromJson(dioResponse.data["current"]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _scaffoldKey,
        appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 255, 255, 255),
          title: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            Icon(
              Icons.bubble_chart,
              color: Color(0x55FB6340),
              size: 30,
            ),
            Padding(
              padding: EdgeInsets.only(left: 10),
            ),
            Text('Calitatea aerului'),
          ]),
          leading: Container(
            child: FlatButton(
              child: Icon(Ionicons.ios_arrow_back),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
          actions: <Widget>[
            Container(
              alignment: Alignment.topRight,
              margin: EdgeInsets.only(top: 0.0, right: 0.0),
              child: IconButton(
                icon: Icon(
                  Icons.menu,
                  size: 24,
                  color: Colors.black,
                ),
                onPressed: () => _scaffoldKey.currentState.openDrawer(),
              ),
            ),
          ],
        ),
        drawer: NavDrawer2(),
        body: SingleChildScrollView(
          child: FutureBuilder(
            future: _getAirQuality(),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (snapshot.hasData) {
                var date = snapshot.data.airTS.toString();
                var inputFormat = DateFormat('yyyy-MM-dd HH:mm');
                var inputDate = inputFormat.parse(
                    '${date.replaceAll('T', ' ').replaceAll('Z', ' ').replaceRange(17, null, '')}');
                inputDate = inputDate.add(Duration(hours: 2));
                var outputFormat = DateFormat('dd/MM/yyyy HH:mm');
                var outputDate = outputFormat.format(inputDate);
                return Container(
                  padding: EdgeInsets.all(10),
                  child: Column(
                    children: [
                      Text(
                        'CENTRU RĂDĂUȚI',
                        style: TextStyle(
                          fontSize: 24,
                          color: Color(0xFF000000),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        '${outputDate.toString()}',
                        style: TextStyle(
                            fontSize: 34, fontWeight: FontWeight.bold),
                      ),
                      Container(
                        padding: EdgeInsets.all(10),
                        child: Card(
                          child: Column(
                            children: [
                              Container(
                                color: changeColorInstance
                                    .changeColorQuality(snapshot.data.pm25),
                                child: Row(
                                  children: [
                                    Container(
                                      padding:
                                          EdgeInsets.only(top: 10, bottom: 10),
                                      width:
                                          (MediaQuery.of(context).size.width -
                                                  40) /
                                              2.8,
                                      child: Column(
                                        children: [
                                          changeColorInstance.changeTextQuality(
                                              snapshot.data.pm25),
                                          /*Text(
                                                    'Calitatea aerului:'),
                                                Text(
                                                    '${changeColorInstance.changeTextQuality(snapshot.data.pm25)}'),*/
                                        ],
                                      ),
                                    ),
                                    Container(
                                      padding:
                                          EdgeInsets.only(top: 10, bottom: 10),
                                      width:
                                          (MediaQuery.of(context).size.width -
                                                  40) /
                                              3.3,
                                      child: Column(
                                        children: [
                                          Text(
                                            'PM2.5',
                                            style: TextStyle(fontSize: 14),
                                          ),
                                          Text(
                                            '${snapshot.data.pm25.toString()}',
                                            style: TextStyle(fontSize: 24),
                                          ),
                                          Text(
                                            'ug/m3',
                                            style: TextStyle(fontSize: 18),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Container(
                                      padding:
                                          EdgeInsets.only(top: 10, bottom: 10),
                                      width:
                                          (MediaQuery.of(context).size.width -
                                                  40) /
                                              3.3,
                                      child: Column(
                                        children: [
                                          Text('CO2',
                                              style: TextStyle(fontSize: 14)),
                                          Text(
                                              '${snapshot.data.co2.toString()}',
                                              style: TextStyle(fontSize: 24)),
                                          Text('ppm',
                                              style: TextStyle(fontSize: 18)),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(top: 10, bottom: 10),
                                child: Row(
                                  children: [
                                    Icon(
                                      Ionicons.ios_thermometer,
                                      size: 30,
                                      color: Color(0xFF979797),
                                    ),
                                    Text(
                                        '${snapshot.data.temperature.toString()}°C',
                                        style: TextStyle(fontSize: 24)),
                                    Padding(padding: EdgeInsets.only(left: 50)),
                                    Icon(
                                      Ionicons.ios_water,
                                      size: 30,
                                      color: Color(0xFF979797),
                                    ),
                                    Text(
                                        '${snapshot.data.humidity.toString()}%',
                                        style: TextStyle(fontSize: 24)),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      AirQualityLegend(),
                    ],
                  ),
                );
              } else {
                return Center(
                  child: CupertinoActivityIndicator(),
                );
              }
            },
          ),
        ));
  }
}

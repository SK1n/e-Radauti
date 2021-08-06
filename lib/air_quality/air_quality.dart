import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutterapperadauti/air_quality/airquality_model.dart';
import 'package:dio/dio.dart';
import 'package:dio_http_cache/dio_http_cache.dart';
import 'package:flutterapperadauti/air_quality/value_adapter.dart';
import 'package:flutterapperadauti/air_quality/legend.dart';
import 'package:flutterapperadauti/air_quality/windDirection.dart';
import 'package:flutterapperadauti/air_quality/windDirectionLocation.dart';
import 'package:flutterapperadauti/air_quality/wind_model.dart';
import 'package:flutterapperadauti/widgets/src/appBarModelNew.dart';
import 'package:flutterapperadauti/widgets/src/loading_screen_ui.dart';
import 'package:intl/intl.dart';

import '../widgets/src/nav_drawer.dart';

class AirQualityPage extends StatefulWidget {
  @override
  _AirQualityPageState createState() => _AirQualityPageState();
}

class _AirQualityPageState extends State<AirQualityPage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

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
      debugPrint('dioResponseAirQuality:' + dioResponse.data.toString());
    } catch (e) {
      print('catch error: $e');
    }
    return AirQualityModel.fromJson(dioResponse.data["current"]);
  }

  Future<WindModel> _getWindPropriety() async {
    var dio = Dio();
    Response dioResponse;

    try {
      dio.interceptors.add(
          DioCacheManager(CacheConfig(baseUrl: "http://www.meteoromania.ro"))
              .interceptor);
      dioResponse = await dio.get(
          "http://www.meteoromania.ro/wp-json/meteoapi/v2/starea-vremii",
          options: buildCacheOptions(Duration(minutes: 10)));
      debugPrint('dioResponseWind:' + dioResponse.data.toString());
    } catch (e) {
      print('catch error: $e');
    }
    return WindModel.fromJson(dioResponse.data["features"][2]["properties"]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      drawer: NavDrawer(),
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) {
          return [
            AppBarUi(
              content: 'Calitatea aertului',
              leading: Icons.bubble_chart,
              scaffoldKey: _scaffoldKey,
            )
          ];
        },
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              FutureBuilder(
                future: _getAirQuality(),
                builder: (BuildContext context, AsyncSnapshot snapshot) {
                  if (snapshot.hasError) {
                    return Container(
                      height: MediaQuery.of(context).size.height,
                      child: Center(
                        child:
                            Text('A apărut o eroare de conexiune la internet!'),
                      ),
                    );
                  }
                  if (snapshot.hasData) {
                    var date = snapshot.data.airTS.toString();
                    var inputFormat = DateFormat('yyyy-MM-dd HH:mm');
                    var inputDate = inputFormat
                        .parseUTC(
                            '${date.replaceAll('T', ' ').replaceAll('Z', ' ').replaceRange(17, null, '')}')
                        .toLocal();
                    //inputDate = inputDate.add(Duration(hours: 2));
                    var outputFormat = DateFormat('dd/MM/yyyy HH:mm');
                    var outputDate = outputFormat.format(inputDate);
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
                            '${outputDate.toString()}',
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
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
                                        .changeColorQuality(snapshot.data.pm25),
                                    padding:
                                        EdgeInsets.only(top: 10, bottom: 10),
                                    child: Row(
                                      children: <Widget>[
                                        Expanded(
                                          flex: 1,
                                          child: Align(
                                            alignment: Alignment.center,
                                            child: Column(
                                              children: [
                                                changeColorInstance
                                                    .changeTextQuality(
                                                        snapshot.data.pm25),
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
                                                  style:
                                                      TextStyle(fontSize: 14),
                                                ),
                                                Text(
                                                  '${snapshot.data.pm25.toString()}',
                                                  style:
                                                      TextStyle(fontSize: 24),
                                                ),
                                                Text(
                                                  '\u03BCg/m\u00B3',
                                                  style:
                                                      TextStyle(fontSize: 18),
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
                                                    style: TextStyle(
                                                        fontSize: 14)),
                                                Text(
                                                    '${snapshot.data.co2.toString()}',
                                                    style: TextStyle(
                                                        fontSize: 24)),
                                                Text('ppm',
                                                    style: TextStyle(
                                                        fontSize: 18)),
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
                                          Ionicons.ios_thermometer,
                                          size: 30,
                                          color: Colors.black,
                                        ),
                                        label: Center(
                                            child: Text(
                                                '${snapshot.data.temperature.toString()}°C',
                                                style: TextStyle(
                                                  fontSize: 24,
                                                  color: Colors.black,
                                                ))),
                                        onPressed: () {},
                                      ),
                                      trailing: TextButton.icon(
                                        icon: Icon(
                                          Ionicons.ios_water,
                                          size: 30,
                                          color: Colors.black,
                                        ),
                                        label: Text(
                                            '${snapshot.data.humidity.toString()}%',
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
                          FutureBuilder(
                            future: _getWindPropriety(),
                            // ignore: missing_return
                            builder:
                                (BuildContext context, AsyncSnapshot snapshot) {
                              if (snapshot.hasError) {
                                return Container(
                                  height: MediaQuery.of(context).size.height,
                                  child: Center(
                                    child: Text(
                                        'A apărut o eroare de conexiune la internet!'),
                                  ),
                                );
                              }
                              if (snapshot.hasData) {
                                int index1 =
                                    snapshot.data.wind.toString().indexOf(',');
                                int index2 =
                                    snapshot.data.wind.toString().indexOf(':');
                                int index3 = snapshot.data.pression
                                    .toString()
                                    .indexOf(' ');
                                List windSplit = [
                                  snapshot.data.wind
                                      .toString()
                                      .substring(0, index1)
                                      .trim(),
                                  snapshot.data.wind
                                      .toString()
                                      .substring(index2 + 1)
                                      .trim()
                                ];
                                String pression = snapshot.data.pression
                                    .toString()
                                    .substring(0, index3);
                                debugPrint(windSplit[1]);
                                return Card(
                                  elevation: 2,
                                  child: Column(
                                    children: [
                                      Container(
                                        child: ListTile(
                                          leading: TextButton.icon(
                                            icon: Icon(
                                              WeatherIcons.wi_windy,
                                              color: Colors.black,
                                            ),
                                            label: Center(
                                              child: new Text(
                                                "Vânt: \n" + windSplit[0],
                                                maxLines: 2,
                                                style: const TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 16.0),
                                              ),
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
                                                  color: Colors.black,
                                                  fontSize: 16.0),
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
                                              WeatherIcons.wi_barometer,
                                              color: Colors.black,
                                            ),
                                            label: Text(
                                              '${pression.toString()}\nmBar',
                                              maxLines: 2,
                                              style: const TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 16.0),
                                            ),
                                          ),
                                          trailing: TextButton.icon(
                                            onPressed: () {},
                                            icon: Icon(
                                              WeatherIcons
                                                  .wi_small_craft_advisory,
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
                                );
                              } else {
                                return LoadingScreen();
                              }
                            },
                          ),
                          AirQualityLegend(),
                        ],
                      ),
                    );
                  } else {
                    return LoadingScreen();
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

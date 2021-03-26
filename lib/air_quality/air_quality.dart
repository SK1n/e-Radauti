import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutterapperadauti/air_quality/airquality_model.dart';
import 'package:dio/dio.dart';
import 'package:dio_http_cache/dio_http_cache.dart';
import 'package:flutterapperadauti/air_quality/value_adapter.dart';
import 'package:flutterapperadauti/air_quality/legend.dart';
import 'package:flutterapperadauti/air_quality/windDirection.dart';
import 'package:flutterapperadauti/air_quality/wind_model.dart';
import 'package:flutterapperadauti/widgets/src/appBarModel.dart';
import 'package:intl/intl.dart';

import '../widgets/src/nav_drawer.dart';

class AirQualityPage extends StatefulWidget {
  @override
  _AirQualityPageState createState() => _AirQualityPageState();
}

class _AirQualityPageState extends State<AirQualityPage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  bool isLoading = false;
  bool isLoadingAir = true;
  bool isLoadingWind = true;

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
      appBar: AppBarModel().loadAppBar(
          context, 'Calitatea aerului', Icons.bubble_chart, _scaffoldKey),
      drawer: NavDrawer(),
      body: isLoadingAir & isLoadingWind
          ? SingleChildScrollView(
              child: CustomScrollView(shrinkWrap: true, slivers: [
                SliverList(
                  delegate: SliverChildListDelegate(
                    [
                      FutureBuilder(
                        future: _getAirQuality(),
                        builder:
                            (BuildContext context, AsyncSnapshot snapshot) {
                          if (snapshot.hasData) {
                            isLoadingAir = false;
                            var date = snapshot.data.airTS.toString();
                            var inputFormat = DateFormat('yyyy-MM-dd HH:mm');
                            var inputDate = inputFormat.parse(
                                '${date.replaceAll('T', ' ').replaceAll('Z', ' ').replaceRange(17, null, '')}');
                            inputDate = inputDate.add(Duration(hours: 2));
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
                                      fontSize: 24,
                                      color: Color(0xFF000000),
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(
                                    '${outputDate.toString()}',
                                    style: TextStyle(
                                        fontSize: 34,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Container(
                                    padding:
                                        EdgeInsets.only(top: 10, bottom: 10),
                                    child: Card(
                                      elevation: 3,
                                      child: Column(
                                        children: [
                                          Container(
                                            color: changeColorInstance
                                                .changeColorQuality(
                                                    snapshot.data.pm25),
                                            child: Row(
                                              children: [
                                                Container(
                                                  padding: EdgeInsets.only(
                                                      top: 10, bottom: 10),
                                                  width: (MediaQuery.of(context)
                                                              .size
                                                              .width -
                                                          40) /
                                                      2.8,
                                                  child: Column(
                                                    children: [
                                                      changeColorInstance
                                                          .changeTextQuality(
                                                              snapshot
                                                                  .data.pm25),
                                                      /*Text(
                                                        'Calitatea aerului:'),
                                                    Text(
                                                        '${changeColorInstance.changeTextQuality(snapshot.data.pm25)}'),*/
                                                    ],
                                                  ),
                                                ),
                                                Container(
                                                  padding: EdgeInsets.only(
                                                      top: 10, bottom: 10),
                                                  width: (MediaQuery.of(context)
                                                              .size
                                                              .width -
                                                          40) /
                                                      3.3,
                                                  child: Column(
                                                    children: [
                                                      Text(
                                                        'PM2.5',
                                                        style: TextStyle(
                                                            fontSize: 14),
                                                      ),
                                                      Text(
                                                        '${snapshot.data.pm25.toString()}',
                                                        style: TextStyle(
                                                            fontSize: 24),
                                                      ),
                                                      Text(
                                                        'ug/m3',
                                                        style: TextStyle(
                                                            fontSize: 18),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                Container(
                                                  padding: EdgeInsets.only(
                                                      top: 10, bottom: 10),
                                                  width: (MediaQuery.of(context)
                                                              .size
                                                              .width -
                                                          40) /
                                                      3.3,
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
                                                )
                                              ],
                                            ),
                                          ),
                                          Padding(
                                            padding: EdgeInsets.only(
                                                top: 10, bottom: 10),
                                            child: Row(
                                              children: [
                                                Icon(
                                                  Ionicons.ios_thermometer,
                                                  size: 30,
                                                  color: Color(0xFF979797),
                                                ),
                                                Text(
                                                    '${snapshot.data.temperature.toString()}°C',
                                                    style: TextStyle(
                                                        fontSize: 24)),
                                                Padding(
                                                    padding: EdgeInsets.only(
                                                        left: 50)),
                                                Icon(
                                                  Ionicons.ios_water,
                                                  size: 30,
                                                  color: Color(0xFF979797),
                                                ),
                                                Text(
                                                    '${snapshot.data.humidity.toString()}%',
                                                    style: TextStyle(
                                                        fontSize: 24)),
                                              ],
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                  FutureBuilder(
                                    future: _getWindPropriety(),
                                    // ignore: missing_return
                                    builder: (BuildContext context,
                                        AsyncSnapshot snapshot) {
                                      if (snapshot.hasData) {
                                        int index1 = snapshot.data.wind
                                            .toString()
                                            .indexOf(',');
                                        int index2 = snapshot.data.wind
                                            .toString()
                                            .indexOf(':');
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

                                        isLoadingWind = false;
                                        return Card(
                                          elevation: 2,
                                          child: Column(
                                            children: [
                                              Container(
                                                child: ListTile(
                                                  leading: FlatButton.icon(
                                                    icon: Icon(
                                                        WeatherIcons.wi_windy),
                                                    label: Center(
                                                      child: Text(
                                                        windSplit[0],
                                                        maxLines: 2,
                                                      ),
                                                    ),
                                                    onPressed: () {},
                                                  ),
                                                  title: FlatButton.icon(
                                                    icon: windDirection(
                                                      windSplit[1],
                                                    ),
                                                    label: Text(
                                                      '${windSplit[1]}',
                                                      maxLines: 2,
                                                    ),
                                                    onPressed: () {},
                                                  ),
                                                  trailing: FlatButton.icon(
                                                    onPressed: () {},
                                                    icon: Icon(WeatherIcons
                                                        .wi_barometer),
                                                    label: Text(
                                                      '${pression.toString()}',
                                                      maxLines: 2,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        );
                                      } else {
                                        isLoadingWind = true;
                                        return Container();
                                      }
                                    },
                                  ),
                                  Text(
                                    'Valorile sunt afișate prin intermediul Aplicației e-Rădăuți',
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: Color(0xFF000000),
                                    ),
                                  ),
                                  AirQualityLegend(),
                                ],
                              ),
                            );
                          } else {
                            isLoadingAir = true;
                            return Container();
                          }
                        },
                      ),
                      AirQualityLegend(),
                    ],
                  ),
                ),
              ]),
            )
          : Container(
              alignment: Alignment.center,
              child: CupertinoActivityIndicator(),
            ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutterapperadauti/air_quality/airquality_model.dart';
import 'package:dio/dio.dart';
import 'package:dio_http_cache/dio_http_cache.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutterapperadauti/air_quality/value_adapter.dart';
import 'package:flutterapperadauti/air_quality/legend.dart';

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
          options: buildCacheOptions(Duration(hours: 1)));
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
          automaticallyImplyLeading: false,
          leading: Container(
            padding: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
            margin: const EdgeInsets.fromLTRB(15.0, 5.0, 0.0, 5.0),
            child: Image.asset("assets/logo_images/app_logo.png"),
          ),
          actions: <Widget>[
            Container(
              alignment: Alignment.topRight,
              margin: EdgeInsets.only(top: 0.0, right: 0.0),
              // EdgeInsets.only(top: 20.0, right: 10.0),
              child: IconButton(
                icon: Icon(
                  Icons.menu,
                  size: 24,
                  color: Colors.black,
                ), //Colors.white
                onPressed: () => _scaffoldKey.currentState.openDrawer(),
              ),
            ),
          ],
        ),
        drawer: NavDrawer2(),
        body: isLoading
            ? Center(
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(Color(0xFF38A49C)),
                ),
              )
            : SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      padding: EdgeInsets.only(bottom: 15, top: 20),
                      child: Row(
                        children: <Widget>[
                          Container(
                            alignment: Alignment.centerLeft,
                            child: IconButton(
                              icon: Icon(
                                Icons.keyboard_arrow_left,
                                color: Color(0xFF979797),
                              ),
                              //_left Icons.arrow_back
                              onPressed: () {
                                Navigator.pop(context);
                              },
                            ),
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width - 80,
                            child: new Stack(
                              alignment: AlignmentDirectional.center,
                              children: <Widget>[
                                Stack(
                                  children: <Widget>[
                                    Container(
                                      child: Padding(
                                        padding: EdgeInsets.fromLTRB(
                                            0.0, 0.0, 0.0, 0.0), //10.0 //25.0
                                        child: Icon(
                                          Icons.bubble_chart,
                                          color: Color(0x55FB6340),
                                          size: 30,
                                        ),
                                      ),
                                    ),
                                    Container(
                                      child: Padding(
                                        padding: EdgeInsets.fromLTRB(
                                            35.0, 0.0, 0.0, 0.0), //10.0 //25.0
                                        child: Text(
                                          'Calitatea aerului',
                                          style: TextStyle(
                                            color: Color(
                                                0xFF000000), //Color(0xFFFFFFFF),
                                            fontWeight: FontWeight.bold,
                                            fontSize: 19,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      child: FutureBuilder(
                        future: _getAirQuality(),
                        builder:
                            (BuildContext context, AsyncSnapshot snapshot) {
                          if (snapshot.data == null) {
                            return Container(child: Text(' '));
                          } else {
                            isLoading = true;
                            return Container(
                              padding: EdgeInsets.all(10),
                              child: Column(
                                children: [
                                  Text('CENTRU RĂDĂUȚI',style: TextStyle(fontSize: 24, color: Color(0xFF000000), fontWeight: FontWeight.bold,),),
                                  Text('${snapshot.data.datasiora.toString().replaceAll('T', '  ').replaceAll('Z', '  ')}', style: TextStyle(fontSize: 24),),


                                  Container(
                                    padding: EdgeInsets.all(10),
                                    child: Card(
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
                                                    Align(
                                                    alignment: Alignment.topLeft,
                                                      child: Text(
                                                          ' Calitatea aerului: \n ' + '${changeColorInstance.changeTextQuality(snapshot.data.pm25)}', style: TextStyle(fontSize: 16),),

                                                    ),
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
                                                        style: TextStyle(fontSize: 14),),
                                                      Text(
                                                        '${snapshot.data.pm25.toString()}',
                                                        style: TextStyle(fontSize: 24),),
                                                      Text(
                                                        'ug/m3',
                                                        style: TextStyle(fontSize: 18),),
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
                                                          'CO2',style: TextStyle(fontSize: 14)
                                                      ),
                                                      Text(
                                                          '${snapshot.data.co2.toString()}',style: TextStyle(fontSize: 24)
                                                      ),
                                                      Text(
                                                          'ppm',style: TextStyle(fontSize: 18)
                                                      ),
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
                                                    '${snapshot.data.temperature.toString()}°C',style: TextStyle(fontSize: 24)),
                                                Padding(
                                                    padding: EdgeInsets.only(
                                                        left: 50)),
                                                Icon(
                                                  Ionicons.ios_water,
                                                  size: 30,
                                                  color: Color(0xFF979797),
                                                ),
                                                Text(
                                                    '${snapshot.data.humidity.toString()}%',style: TextStyle(fontSize: 24)),
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
                          }
                        },
                      ),
                    ),
                  ],
                ),
              ));
  }
}

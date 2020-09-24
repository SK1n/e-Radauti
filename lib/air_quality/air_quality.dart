import 'package:flutter/material.dart';
import 'package:flutterapperadauti/air_quality/air_quality_chart.dart';
import 'package:flutterapperadauti/air_quality/air_quality_chart_model.dart';
import 'package:flutterapperadauti/air_quality/airquality_model.dart';
import 'package:dio/dio.dart';
//import 'package:flutter_icons/flutter_icons.dart';
import 'package:dio_http_cache/dio_http_cache.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutterapperadauti/air_quality/change_color.dart';
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
  List<AirQualityChartModel> data = [];
  var co2value;
  charts.Color barColorCo2;

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
        body: SingleChildScrollView(
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
                  padding: EdgeInsets.only(left: 20, right: 20),
                  child:
                  Text('Pe această pagină puteți urmări valorile măsurate de către aparatul AirVisual instalat în centrul Municipiului Rădăuți (Piața Garoafelor).\n\nValorile se actualizează o dată pe oră și corespund concentrației de CO2 (în ppm - părți pe milion), concentrației de PM2.5 (în ug/m3 - micrograme pe metru cub), temperaturii și umidității relative a aerului, în procente (%).\n\nPentru o analiză mai completă a datelor, descărcați aplicația AirVisual.',
                      style: TextStyle(
                      color: Color(
                      0xFF000000), //Color(0xFFFFFFFF),
                //fontWeight: FontWeight.bold,
                fontSize: 16,
              ), )

              ),
              Container(
                child: FutureBuilder(
                  future: _getAirQuality(),
                  builder: (BuildContext context, AsyncSnapshot snapshot) {
                    if (snapshot.data == null) {
                      return Center(
                        child: CircularProgressIndicator(
                          valueColor:
                              AlwaysStoppedAnimation<Color>(Color(0xFF38A49C)),
                        ),
                      );
                      } else {
                      co2value = snapshot.data.co2;

                      debugPrint(
                          'function response: ${changeColorInstance.changeColorHumidity(snapshot.data.humidity)}');
                      data = [
                        AirQualityChartModel(
                          val: snapshot.data.humidity.toDouble(),
                          valueType:
                              'Umiditate\n${snapshot.data.humidity.toString()} %',
                          barColor: changeColorInstance
                              .changeColorHumidity(snapshot.data.humidity),
                        ),
/*                        AirQualityChartModel(
                          val: co2value,
                          valueType: "CO2\n${snapshot.data.co2.toString()}",
                          barColor: changeColorInstance
                              .changeColorCo2(snapshot.data.humidity),
                        ),*/

                        AirQualityChartModel(
                            val: snapshot.data.pm25.toDouble(),
                            valueType:
                                'PM2.5\n${snapshot.data.pm25.toString()} ug/m3',
                            barColor: changeColorInstance
                                .changeColorPm25(snapshot.data.pm25)),
                      ];

                      return Container(
                          padding: EdgeInsets.only(left: 10, top: 10),
                          child: Container(
                            child: Column(
                              children: [
                                AirQualityChart(data: data),
                                Text(
                                    'Temperatura aerului este: ${snapshot.data.temperature.toString()}°C'),
                                /*AirQualityLegend()*/
                              ],
                            ),
                          ));
                    }
                  },
                ),
              ),
              Container(
                child: FutureBuilder(
                  future: _getAirQuality(),
                  builder: (BuildContext context, AsyncSnapshot snapshot) {
                    if (snapshot.data == null) {
                      return Center(
                        child: CircularProgressIndicator(
                          valueColor:
                          AlwaysStoppedAnimation<Color>(Color(0xFF38A49C)),
                        ),
                      );
                    } else {
                      co2value = snapshot.data.co2;
                      debugPrint(
                          'function response: ${changeColorInstance.changeColorCo2(snapshot.data.co2)} ppm');
                      data = [
/*                        AirQualityChartModel(
                          val: snapshot.data.humidity.toDouble(),
                          valueType:
                          'Umiditate\n${snapshot.data.humidity.toString()}',
                          barColor: changeColorInstance
                              .changeColorHumidity(snapshot.data.humidity),
                        ),*/
                        AirQualityChartModel(
                          val: co2value,
                          valueType: "CO2\n${snapshot.data.co2.toString()} ppm",
                          barColor: changeColorInstance
                              .changeColorCo2(snapshot.data.co2),
                        ),
/*                        AirQualityChartModel(
                            val: snapshot.data.pm25.toDouble(),
                            valueType:
                            'PM2.5\n${snapshot.data.pm25.toString()} ug/m3',
                            barColor: changeColorInstance
                                .changeColorPm25(snapshot.data.humidity)),*/
                      ];
                      return Container(
                          padding: EdgeInsets.only(left: 10, top: 10),
                          child: Container(
                            child: Column(
                              children: [
                                AirQualityChart(data: data),
                                /*Text(
                                    'Temperatura actuala este: ${snapshot.data.temperature.toString()}°C'),*/
                                AirQualityLegend()
                              ],
                            ),
                          ));
                    }
                  },
                ),
              )
            ],
          ),
        ));
  }
}

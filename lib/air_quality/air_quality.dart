import 'package:flutter/material.dart';
import 'package:flutterapperadauti/air_quality/air_quality_chart.dart';
import 'package:flutterapperadauti/air_quality/air_quality_chart_model.dart';
import 'package:flutterapperadauti/air_quality/airquality_model.dart';
import 'package:dio/dio.dart';
import 'package:dio_http_cache/dio_http_cache.dart';
import 'package:charts_flutter/flutter.dart' as charts;

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
          options: buildCacheOptions(Duration(days: 1)));
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
        body: Container(
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
                co2value = snapshot.data.co2 / 10;
                if (snapshot.data.co2 > 250 && snapshot.data.co2 < 450) {
                  barColorCo2 =
                      charts.ColorUtil.fromDartColor(Colors.green[200]);
                } else if (snapshot.data.co2 > 450 &&
                    snapshot.data.co2 <= 1000) {
                  barColorCo2 =
                      charts.ColorUtil.fromDartColor(Colors.green[100]);
                } else if (snapshot.data.co2 > 1000 &&
                    snapshot.data.co2 <= 2000) {
                  barColorCo2 =
                      charts.ColorUtil.fromDartColor(Colors.yellow[300]);
                } else if (snapshot.data.co2 > 2000 &&
                    snapshot.data.co2 <= 5000) {
                  barColorCo2 = charts.ColorUtil.fromDartColor(Colors.red[100]);
                } else if (snapshot.data.co2 > 5000 &&
                    snapshot.data.co2 <= 40000) {
                  barColorCo2 = charts.ColorUtil.fromDartColor(Colors.red[200]);
                } else if (snapshot.data.co2 > 40000) {
                  barColorCo2 = charts.ColorUtil.fromDartColor(Colors.red[300]);
                } else {
                  barColorCo2 =
                      charts.ColorUtil.fromDartColor(Colors.greenAccent[200]);
                }
                data = [
                  AirQualityChartModel(
                    val: snapshot.data.humidity.toDouble(),
                    valueType:
                        'Umiditate\n${snapshot.data.humidity.toString()}',
                    barColor: charts.ColorUtil.fromDartColor(Colors.blue),
                  ),
                  AirQualityChartModel(
                    val: co2value,
                    valueType: "CO2\n${snapshot.data.co2.toString()}",
                    barColor: barColorCo2,
                  ),
                  AirQualityChartModel(
                      val: snapshot.data.pm25.toDouble(),
                      valueType:
                          'PM2.5\n${snapshot.data.pm25.toString()} ug/m3',
                      barColor: charts.ColorUtil.fromDartColor(
                          Colors.lightGreen[300])),
                  AirQualityChartModel(
                      val: snapshot.data.temperature.toDouble(),
                      valueType: '°C\n${snapshot.data.temperature.toString()}',
                      barColor:
                          charts.ColorUtil.fromDartColor(Colors.lime[300])),
                ];
                return Container(
                  padding: EdgeInsets.only(left: 10, top: 10),
                  child: AirQualityChart(data: data),

                  /*Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AirQualityChart(data: data),
                        Text(
                          'Temperature în centrul Rădăuțiului este momentan: ${snapshot.data.temperature.toString()}',
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      Text(
                        'Umiditatea relativă este: ${snapshot.data.humidity.toString()}',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text(
                        'Concentrația de PM2.5: ${snapshot.data.pm25.toString()} ug/m3 ',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text(
                        'Concentrația de CO2 este: ${snapshot.data.co2.toString()} ppm ',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),*/
                );
              }
            },
          ),
        ));
  }
}

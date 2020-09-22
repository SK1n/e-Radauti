import 'package:flutter/material.dart';
import 'package:flutterapperadauti/air_quality/airquality_model.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

import '../menu_page.dart';

class AirQualityPage extends StatefulWidget {
  @override
  _AirQualityPageState createState() => _AirQualityPageState();
}

class _AirQualityPageState extends State<AirQualityPage> {
  List<AirQualityModel> airqualityList;
  Map<String, dynamic> jsonResponse;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  Future<List<AirQualityModel>> _getAirQuality() async {
    var response = await http.get(
        "https://www.airvisual.com/api/v2/node/5ded3e13994dfe107f7013a0");
    this.setState(() {
      jsonResponse = json.decode(response.body);
    });
    airqualityList = List<AirQualityModel>();
    jsonResponse.forEach((key, value) {
      // print(key);
      airqualityList = (jsonResponse['historical']['current'] as List)
          .map<AirQualityModel>((j) => AirQualityModel.fromJson(j))
          .toList();
      //AirQualityModel airquality = AirQualityModel.fromJson(value);
      //airqualityList.add(airquality);
    });

    // print(airqualityList);
    return airqualityList;
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
                return new ListView.builder(
                    itemCount: airqualityList == null ? 0:1,//0 : 1, //airqualityList.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Container(
                          padding: EdgeInsets.only(top: 10),
                          child: Column(
                            children: [
                              Container(
                                padding: EdgeInsets.only(left: 10),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('Temperature în centrul Rădăuțiului este momentan: \n'+
                                        airqualityList[index].temperature.toString() + '\$deg C \n',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text('Umiditatea relativă este: \n'+
                                        airqualityList[index].humidity.toString() + '% \n',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),

                                    Text('Concentrația de PM2.5: \n'+
                                      airqualityList[index].pm25.toString() + 'ug/m3 \n',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),

                                    Text('Concentrația de CO2 este: \n'+
                                        airqualityList[index].co2.toString() + 'ppm \n',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),

                                  ],
                                ),
                              ),

                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 15.0),
                                child: Container(
                                  height: 1.0,
                                  color: Color.fromRGBO(0, 0, 0, 1),
                                ),
                              ),
                            ],
                          ));
                    });
              }

            },
          ),

        ));
  }
}

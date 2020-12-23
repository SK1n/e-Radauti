import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterapperadauti/appBarModel.dart';
import 'package:flutterapperadauti/menu_page.dart';
import 'package:flutterapperadauti/transport/Taxi.dart';

class HomePageTransport extends StatelessWidget {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBarModel()
          .loadAppBar(context, 'Transport', Icons.train, _scaffoldKey),
      drawer: NavDrawer2(),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(
                left: 25,
                right: 25,
                bottom: 10,
                top: 15,
              ),
              child: GestureDetector(
                child: Row(
                  children: <Widget>[
                    Column(
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            Container(
                              child: Icon(
                                Icons.local_taxi,
                                color: Color(0xFF979797),
                              ),
                            ),
                            //),
                            Container(
                              width: MediaQuery.of(context).size.width - 120,
                              padding: EdgeInsets.only(
                                left: 10,
                              ),
                              child: Text(
                                'Taximetriști',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                              ),
                            ),
                          ],
                        ),
                        Container(
                          padding: EdgeInsets.only(
                            top: 10,
                          ),
                          width: MediaQuery.of(context).size.width - 80,
                          child: Text(
                            'Aici puteți găsi numele taximetriștilor din Rădăuți, numărul lor de telefon, tipul mașinii și numărul de înmatriculare',
                            overflow: TextOverflow.ellipsis,
                            maxLines: 5,
                            style: TextStyle(
                              color: Color(0xFF38A49C),
                              fontSize: 15,
                            ),
                          ),
                        )
                      ],
                    ),
                    Container(
                      child: Icon(
                        Icons.keyboard_arrow_right,
                        color: Color(0xFF979797),
                      ),
                    ),
                  ],
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Taxi()),
                  );
                },
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15.0),
              child: Container(
                height: 1.0,
                color: Color.fromRGBO(0, 0, 0, 0.1),
              ),
            ),
            Container(
              padding: EdgeInsets.only(
                left: 25,
                right: 25,
                bottom: 10,
                top: 15,
              ),
              child: GestureDetector(
                  child: Row(
                    children: <Widget>[
                      Column(
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              Container(
                                child: Icon(
                                  Icons.directions_railway,
                                  color: Color(0xFF979797),
                                ),
                              ),
                              //),
                              Container(
                                width: MediaQuery.of(context).size.width - 120,
                                padding: EdgeInsets.only(
                                  left: 10,
                                ),
                                child: Text(
                                  'Tren',
                                  style: TextStyle(
                                    color: Color(0xFF979797),
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Container(
                            padding: EdgeInsets.only(
                              top: 10,
                            ),
                            width: MediaQuery.of(context).size.width - 80,
                            child: Text(
                              'În curând',
                              overflow: TextOverflow.ellipsis,
                              maxLines: 5,
                              style: TextStyle(
                                color: Color(0xFF979797),
                                fontSize: 15,
                              ),
                            ),
                          )
                        ],
                      ),
                      Container(
                        child: Icon(
                          Icons.keyboard_arrow_right,
                          color: Color(0xFF979797),
                        ),
                      ),
                    ],
                  ),
                  onTap: null),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15.0),
              child: Container(
                height: 1.0,
                color: Color.fromRGBO(0, 0, 0, 0.1),
              ),
            ),
            Container(
              padding: EdgeInsets.only(
                left: 25,
                right: 25,
                bottom: 10,
                top: 15,
              ),
              child: GestureDetector(
                  child: Row(
                    children: <Widget>[
                      Column(
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              Container(
                                child: Icon(
                                  Icons.directions_bus,
                                  color: Color(0xFF979797),
                                ),
                              ),
                              //),
                              Container(
                                width: MediaQuery.of(context).size.width - 120,
                                padding: EdgeInsets.only(
                                  left: 10,
                                ),
                                child: Text(
                                  'Autobuz',
                                  style: TextStyle(
                                    color: Color(0xFF979797),
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Container(
                            padding: EdgeInsets.only(
                              top: 10,
                            ),
                            width: MediaQuery.of(context).size.width - 80,
                            child: Text(
                              'În curând',
                              overflow: TextOverflow.ellipsis,
                              maxLines: 5,
                              style: TextStyle(
                                color: Color(0xFF979797),
                                fontSize: 15,
                              ),
                            ),
                          )
                        ],
                      ),
                      Container(
                        child: Icon(
                          Icons.keyboard_arrow_right,
                          color: Color(0xFF979797),
                        ),
                      ),
                    ],
                  ),
                  onTap: null),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15.0),
              child: Container(
                height: 1.0,
                color: Color.fromRGBO(0, 0, 0, 0.1),
              ),
            ),

            /*Padding(
              padding:EdgeInsets.symmetric(horizontal:15.0),
              child:Container(
                height:1.0,
                color:Color.fromRGBO(0, 0, 0, 0.1),),),*/
          ],
        ),
      ),
    );
  }
}

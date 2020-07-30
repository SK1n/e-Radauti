import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutterapperadauti/TownHall/leaders.dart';
import 'package:flutterapperadauti/TownHall/local_council.dart';

class TownHallMain extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('E-Radauti'),
        backgroundColor: Color.fromARGB(255, 54, 190, 166),
        actions: <Widget>[
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              width: MediaQuery.of(context).size.width,
              padding: EdgeInsets.all(0),
              child: Image.asset("assets/images/primaria.jpg",width: MediaQuery.of(context).size.width,),
            ),
            GestureDetector(
              child: Container(
                padding: EdgeInsets.only(bottom: 10),
                child: Column(
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Container(
                          width: 80,
                          height: 80,
                          child: FlatButton(
                            child: SvgPicture.asset("assets/images/circle_69E781.svg"),
                          ),
                        ),
                        Column(
                          children: <Widget>[
                            Container(
                              width: MediaQuery.of(context).size.width-80,
                              child: Text(
                                "Conducere",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width - 80,
                              child: Text(
                                  "Informatii despre primar, viceprimar si atributiile fiecaruia",
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 5
                              ),
                            ),
                          ],
                        )

                      ],
                    ),
                  ],
                ),
              ),
              onTap: () {Navigator.push(context, MaterialPageRoute(builder: (context) => Leaders()),);},
            ), ///Conducere
            Padding(
              padding:EdgeInsets.symmetric(horizontal:10.0),
              child:Container(
                height:1.0,
                color:Color.fromRGBO(0, 0, 0, 0.1),),),
            GestureDetector(
              child: Container(
                padding: EdgeInsets.only(bottom: 10),
                child: Column(
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Container(
                          width: 80,
                          height: 80,
                          child: FlatButton(
                            child: SvgPicture.asset("assets/images/circle_194C80.svg"),
                          ),
                        ),
                        Column(
                          children: <Widget>[
                            Container(
                              width: MediaQuery.of(context).size.width-80,
                              child: Text(
                                "Consiliul Local",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width - 80,
                              child: Text(
                                  "Consilierii locali si atributiile lor. \nContacteaza-ti reprezentantul",
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 5
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ],
                ),
              ),
              onTap: () {Navigator.push(context, MaterialPageRoute(builder: (context) => LocalCouncil()),);},
            ), ///Conducere
            Padding(
              padding:EdgeInsets.symmetric(horizontal:10.0),
              child:Container(
                height:1.0,
                color:Color.fromRGBO(0, 0, 0, 0.1),),),
          ],
        ),
      ),
    );
  }
}
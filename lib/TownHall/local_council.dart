import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LocalCouncil extends StatelessWidget {
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
                                "Consilieri locali si atributiile lor.\n Contacteaza-ti reprezentantul.",
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
            Padding(
              padding:EdgeInsets.symmetric(horizontal:10.0),
              child:Container(
                height:1.0,
                color:Color.fromRGBO(0, 0, 0, 0.1),),),
            Container(
              padding: EdgeInsets.only(left: 10,top: 10, bottom: 10),
              child: Column(
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Column(
                        children: <Widget>[
                          Container(
                            height: 91,
                            width: 91,
                            child: CircleAvatar(
                              radius: 50,
                              backgroundImage: AssetImage("assets/images/CovaliTiberiu.png"),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.only(top: 10),
                            height: 50,
                            width: 50,
                            child: Image.asset("assets/images/pnl.png"),
                          ),
                        ],
                      ),
                      Container(
                        child: Column(
                          children: <Widget>[
                            Container(
                              padding: EdgeInsets.only(left: 10),
                              width: MediaQuery.of(context).size.width - 101,
                              child: Text(
                                "Covali Tiberiu",
                                style: TextStyle(
                                  color: Colors.blue,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20
                                ),
                              ),
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width - 101,
                              padding: EdgeInsets.only(left: 10),
                              child: Text(
                                "Consilier Local"
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.only(left: 10),
                              width: MediaQuery.of(context).size.width - 101,
                              child: Text(
                                "Comisii",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  decoration: TextDecoration.underline,
                                ),
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.only(left: 10, top: 10),
                              width: MediaQuery.of(context).size.width -101,
                              child: Text(
                                "Comisia pentru amenajarea teritoriului și urbanism, realizarea lucrărilor publice, protecția mediului și turism, conservarea monumentelor istorice și de arhitectură"
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.only(left: 10, top: 10),
                              width: MediaQuery.of(context).size.width - 101,
                              child: Text(
                                "Informatii aditionale",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  decoration: TextDecoration.underline,
                                ),
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.only(left: 10),
                              width: MediaQuery.of(context).size.width -101,
                              child: Text(
                                  "Declariatie de avere. \nDeclaratie de interese"
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                  Container(
                    padding: EdgeInsets.only(top: 10,right: 10),
                    width: MediaQuery.of(context).size.width,
                    child: FlatButton(
                      child: Text(
                        "Contacteaza"
                      ),
                      textColor: Colors.white,
                      color: Colors.blue,
                      splashColor: Colors.blueAccent,
                      onPressed: () {
                      },
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding:EdgeInsets.symmetric(horizontal:10.0),
              child:Container(
                height:1.0,
                color:Color.fromRGBO(0, 0, 0, 0.1),),),
            Container(
              padding: EdgeInsets.only(left: 10,top: 10, bottom: 10),
              child: Column(
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Column(
                        children: <Widget>[
                          Container(
                            height: 91,
                            width: 91,
                            child: CircleAvatar(
                              radius: 50,
                              backgroundImage: AssetImage("assets/images/MehedinMaria.png"),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.only(top: 10),
                            height: 50,
                            width: 50,
                            child: Image.asset("assets/images/ProRo.jpg"),
                          ),
                        ],
                      ),
                      Container(
                        child: Column(
                          children: <Widget>[
                            Container(
                              padding: EdgeInsets.only(left: 10),
                              width: MediaQuery.of(context).size.width - 101,
                              child: Text(
                                "Mehedin Maria",
                                style: TextStyle(
                                    color: Colors.blue,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20
                                ),
                              ),
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width - 101,
                              padding: EdgeInsets.only(left: 10),
                              child: Text(
                                  "Consilier Local"
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.only(left: 10),
                              width: MediaQuery.of(context).size.width - 101,
                              child: Text(
                                "Comisii",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  decoration: TextDecoration.underline,
                                ),
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.only(left: 10, top: 10),
                              width: MediaQuery.of(context).size.width -101,
                              child: Text(
                                  "Comisia pentru amenajarea teritoriului și urbanism, realizarea lucrărilor publice, protecția mediului și turism, conservarea monumentelor istorice și de arhitectură"
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.only(left: 10, top: 10),
                              width: MediaQuery.of(context).size.width - 101,
                              child: Text(
                                "Informatii aditionale",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  decoration: TextDecoration.underline,
                                ),
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.only(left: 10),
                              width: MediaQuery.of(context).size.width -101,
                              child: Text(
                                  "Declariatie de avere. \nDeclaratie de interese"
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                  Container(
                    padding: EdgeInsets.only(top: 10,right: 10),
                    width: MediaQuery.of(context).size.width,
                    child: FlatButton(
                      child: Text(
                          "Contacteaza"
                      ),
                      textColor: Colors.white,
                      color: Colors.blue,
                      splashColor: Colors.blueAccent,
                      onPressed: () {
                      },
                    ),
                  ),
                ],
              ),
            ),
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
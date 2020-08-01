import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:url_launcher/url_launcher.dart' as UrlLauncher;

class Leaders extends StatelessWidget {
  _launchURL(url) async {
    if (await UrlLauncher.canLaunch(url)) {
      await UrlLauncher.launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
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
                      Container(
                        height: 91,
                        width: 91,
                        child: CircleAvatar(
                          radius: 50,
                          backgroundImage: AssetImage("assets/images/NistorTatar.png"),
                        ),
                      ),
                      Container(
                        child: Column(
                          children: <Widget>[
                            Container(
                              padding: EdgeInsets.only(left: 10),
                              width: MediaQuery.of(context).size.width - 101,
                              child: Text(
                                "Nistor Tatar",
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
                                "Primar \nMunicipiul Radauti"
                              ),
                            ),
                            Row(
                              children: <Widget>[
                                FlatButton(
                                  child: Icon(Ionicons.logo_facebook),
                                  onPressed: () {
                                    _launchURL("facebook.com");
                                  },
                                ),
                                FlatButton(
                                  child: Icon(Ionicons.logo_whatsapp),
                                ),
                                FlatButton(
                                  child: Icon(Ionicons.ios_mail),
                                  onPressed: () {
                                    UrlLauncher.launch("mailto:email1@gmail.com");
                                  },
                                ),
                              ],
                            ),
                            Container(
                              padding: EdgeInsets.only(left: 10),
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
                                "Declaratie de avere. \nDeclaratie de interese."
                              ),
                            )
                          ],
                        ),
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
                      Container(
                        height: 91,
                        width: 91,
                        child: CircleAvatar(
                          radius: 50,
                          backgroundImage: AssetImage("assets/images/NistorTatar.png"),
                        ),
                      ),
                      Container(
                        child: Column(
                          children: <Widget>[
                            Container(
                              padding: EdgeInsets.only(left: 10),
                              width: MediaQuery.of(context).size.width - 101,
                              child: Text(
                                "Nistor Tatar",
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
                                  "Primar \nMunicipiul Radauti"
                              ),
                            ),
                            Row(
                              children: <Widget>[
                                FlatButton(
                                  child: Icon(Ionicons.logo_facebook),
                                  onPressed: () {
                                  },
                                ),
                                FlatButton(
                                  child: Icon(Ionicons.logo_whatsapp),
                                ),
                                FlatButton(
                                  child: Icon(Ionicons.ios_mail),
                                ),
                              ],
                            ),
                            Container(
                              padding: EdgeInsets.only(left: 10),
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
                                  "Declaratie de avere. \nDeclaratie de interese."
                              ),
                            )
                          ],
                        ),
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
          ],
        ),
      ),
    );
  }
}
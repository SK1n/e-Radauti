import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutterapperadauti/menu_page.dart';
import 'package:url_launcher/url_launcher.dart' as UrlLauncher;

class Leaders extends StatelessWidget {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  _launchURL(url) async {
    if (await UrlLauncher.canLaunch(url)) {
      await UrlLauncher.launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 255, 255, 255),
        leading: Container(
          padding: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
          margin: const EdgeInsets.fromLTRB(15.0, 5.0, 0.0, 5.0),
          child: Image.asset("assets/logo_images/app_logo.png"),
        ),
        actions: <Widget>[
          Container(
            alignment: Alignment.topRight,
            margin: EdgeInsets.only(top: 0.0, right: 0.0), // EdgeInsets.only(top: 20.0, right: 10.0),
            child: IconButton(
              icon: Icon(Icons.menu,
                size: 24,
                color: Colors.black, ), //Colors.white
              onPressed: () => _scaffoldKey.currentState.openDrawer(), //_scaffoldKey.currentState.openDrawer(),
            ),
          ),
        ],
      ),
      drawer: NavDrawer2(),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                Container(
                  alignment: Alignment.centerLeft,
                  child: IconButton(
                    icon: Icon(Icons.keyboard_arrow_left, color: Color(0xFF979797),), //_left Icons.arrow_back
                    onPressed: (){
                      Navigator.pop(context);
                    },
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width-80,
                  child: new Stack(
                    alignment: AlignmentDirectional.center,
                    children: <Widget>[
                      Stack(
                        children: <Widget>[
                          Icon(Icons.location_city, color: Color(0x55FB6340),),
                          SizedBox(width: 5,),
                          Container(
                            child: Padding(
                              padding: EdgeInsets.fromLTRB(30.0, 4.0, 0.0, 0.0), //10.0 //25.0
                              child: Text(
                                'Primărie',
                                style: TextStyle(
                                  color: Color(0xFF000000), //Color(0xFFFFFFFF),
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
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
                                "Primar"
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
                          backgroundImage: AssetImage("assets/images/NicolauBogdan.jpg"),
                        ),
                      ),
                      Container(
                        child: Column(
                          children: <Widget>[
                            Container(
                              padding: EdgeInsets.only(left: 10),
                              width: MediaQuery.of(context).size.width - 101,
                              child: Text(
                                "Bogdan Adrian Nicoau",
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
                                  "Viceprimar"
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
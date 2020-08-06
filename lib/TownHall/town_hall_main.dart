import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutterapperadauti/TownHall/leaders.dart';
import 'package:flutterapperadauti/TownHall/local_council.dart';
import 'package:flutterapperadauti/menu_page.dart';

class TownHallMain extends StatelessWidget {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
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
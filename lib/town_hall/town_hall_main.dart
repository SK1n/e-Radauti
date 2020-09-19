import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutterapperadauti/town_hall/leaders.dart';
import 'package:flutterapperadauti/town_hall/local_council.dart';
import 'package:flutterapperadauti/town_hall/council_meetings.dart';
import 'package:flutterapperadauti/town_hall/local_legislation.dart';
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
            Container(
              padding: EdgeInsets.only(top: 20, bottom: 10,),
              child: Row(
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
                    width: MediaQuery.of(context).size.width - 80,
                    child: new Stack(
                      alignment: AlignmentDirectional.center,
                      children: <Widget>[
                        Stack(
                          children: <Widget>[
                            Icon(Icons.location_city, color: Color(0x55FB6340), size: 30,),
                            Container(
                              child: Padding(
                                padding: EdgeInsets.fromLTRB(35.0, 6.0, 0.0, 0.0,), //10.0 //25.0
                                child: Text(
                                  'Administrație locală',
                                  style: TextStyle(
                                    color: Color(0xFF000000), //Color(0xFFFFFFFF),
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
              padding: EdgeInsets.only(bottom: 30,),
              width: MediaQuery.of(context).size.width - 30,
              child: Image.asset(
                "assets/images/primaria.jpg",
                fit: BoxFit.cover,
              ),
            ),
            GestureDetector(
              child: Container(
                padding: EdgeInsets.only(left: 25, right: 25, bottom: 10, top: 10,),
                child: Row(
                  children: <Widget>[
                    Column(
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            Container(
                              height: 30,
                              width: 30,
                              child: SvgPicture.asset("assets/images/circle_69E781.svg"),
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width - 120,
                              padding: EdgeInsets.only(left: 10,),
                              child: Text(
                                "Conducere",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                              ),
                            ),
                          ],
                        ),
                        Container(
                          padding: EdgeInsets.only(top: 10,),
                          width: MediaQuery.of(context).size.width - 80,
                          child: Text(
                            "Informații despre primar, viceprimar și atribuțiile fiecăruia.",
                            overflow: TextOverflow.ellipsis,
                            maxLines: 5,
                            style: TextStyle(
                              color: Color(0xFF38A49C),
                              fontSize: 15,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Container(
                      child: Icon(Icons.keyboard_arrow_right, color: Color(0xFF979797),),
                    ),
                  ],
                ),
              ),
              onTap: () {Navigator.push(context, MaterialPageRoute(builder: (context) => Leaders()),);},
            ), ///Conducere
            Padding(
              padding:EdgeInsets.symmetric(horizontal:15.0),
              child:Container(
                height:1.0,
                color:Color.fromRGBO(0, 0, 0, 0.1),),),
            GestureDetector(
              child: Container(
                padding: EdgeInsets.only(left: 25, right: 25, bottom: 10, top: 10,),
                child: Row(
                  children: <Widget>[
                    Column(
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            Container(
                              height: 30,
                              width: 30,
                              child: SvgPicture.asset("assets/images/circle_194C80.svg"),
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width - 120,
                              padding: EdgeInsets.only(left: 10,),
                              child: Text(
                                "Consiliul Local",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                              ),
                            ),
                          ],
                        ),
                        Container(
                          padding: EdgeInsets.only(top: 10,),
                          width: MediaQuery.of(context).size.width - 80,
                          child: Text(
                            "Consilierii locali și atribuțiile lor. \nContactează-ți reprezentantul.",
                            overflow: TextOverflow.ellipsis,
                            maxLines: 5,
                            style: TextStyle(
                              color: Color(0xFF38A49C),
                              fontSize: 15,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Container(
                      child: Icon(Icons.keyboard_arrow_right, color: Color(0xFF979797),),
                    ),
                  ],
                ),
              ),
              onTap: () {Navigator.push(context, MaterialPageRoute(builder: (context) => LocalCouncil()),);},
            ), ///Conducere
            Padding(
              padding:EdgeInsets.symmetric(horizontal:15.0),
              child:Container(
                height:1.0,
                color:Color.fromRGBO(0, 0, 0, 0.1),),),
            GestureDetector(
              child: Container(
                padding: EdgeInsets.only(left: 25, right: 25, bottom: 10, top: 10,),
                child: Row(
                  children: <Widget>[
                    Column(
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            Container(
                              height: 30,
                              width: 30,
                              child: SvgPicture.asset("assets/images/circle_FFDECC.svg"),
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width - 120,
                              padding: EdgeInsets.only(left: 10,),
                              child: Text(
                                "Ședințe de Consiliu local",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                              ),
                            ),
                          ],
                        ),
                        Container(
                          padding: EdgeInsets.only(top: 10,),
                          width: MediaQuery.of(context).size.width - 80,
                          child: Text(
                            "Vizualizează live ședințele de consiliu local.",
                            overflow: TextOverflow.ellipsis,
                            maxLines: 5,
                            style: TextStyle(
                              color: Color(0xFF38A49C),
                              fontSize: 15,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Container(
                      child: Icon(Icons.keyboard_arrow_right, color: Color(0xFF979797),),
                    ),
                  ],
                ),
              ),
              onTap: () {Navigator.push(context, MaterialPageRoute(builder: (context) => CouncilMeetings()),);},
            ), ///Conducere
            Padding(
              padding:EdgeInsets.symmetric(horizontal:15.0),
              child:Container(
                height:1.0,
                color:Color.fromRGBO(0, 0, 0, 0.1),),),
            GestureDetector(
              child: Container(
                padding: EdgeInsets.only(left: 25, right: 25, bottom: 30, top: 10,),
                child: Row(
                  children: <Widget>[
                    Column(
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            Container(
                              height: 30,
                              width: 30,
                              child: SvgPicture.asset("assets/images/circle_EB7D16.svg"),
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width - 120,
                              padding: EdgeInsets.only(left: 10,),
                              child: Text(
                                "Hotărâri de Consiliu Local",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                              ),
                            ),
                          ],
                        ),
                        Container(
                          padding: EdgeInsets.only(top: 10,),
                          width: MediaQuery.of(context).size.width - 80,
                          child: Text(
                            "Descoperă hotărârile de consiliu local adoptate și proiectele acestora.",
                            overflow: TextOverflow.ellipsis,
                            maxLines: 5,
                            style: TextStyle(
                              color: Color(0xFF38A49C),
                              fontSize: 15,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Container(
                      child: Icon(Icons.keyboard_arrow_right, color: Color(0xFF979797),),
                    ),
                  ],
                ),
              ),
              onTap: () {Navigator.push(context, MaterialPageRoute(builder: (context) => LocalLegislation()),);}, //null,
            ), ///Conducere
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
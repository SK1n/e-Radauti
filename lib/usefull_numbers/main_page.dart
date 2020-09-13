import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutterapperadauti/menu_page.dart';
import 'package:flutterapperadauti/usefull_numbers/public_institutions.dart';
import 'package:flutterapperadauti/usefull_numbers/miscellaneous.dart';
import 'package:flutterapperadauti/usefull_numbers/local_authorities.dart';
import 'package:flutterapperadauti/usefull_numbers/contractors.dart';

class HomePageNumbers extends StatelessWidget {
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
              padding: EdgeInsets.only(top: 20, bottom: 15,),
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
                            Icon(Icons.perm_phone_msg, color: Color(0x55FB6340), size: 30,),
                            Container(
                              child: Padding(
                                padding: EdgeInsets.fromLTRB(35.0, 6.0, 0.0, 0.0,), //10.0 //25.0
                                child: Text(
                                  'Numere utile',
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
              padding: EdgeInsets.only(left: 25, right: 25, bottom: 10, top: 15,),
              child: GestureDetector(
                child: Row(
                  children: <Widget>[
                    Column(
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            Container(
                              height: 30,
                              width: 30,
                              child: SvgPicture.asset('assets/images/circle_FFDECC.svg'),
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width - 120,
                              padding: EdgeInsets.only(left: 10,),
                              child: Text('Autorități locale',
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
                          child: Text('Date de contact pentru principalele instituții de protecție civilă '
                              '(a consumatorilui, copilului, animalelor, mediului, etc.)',
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
                      child: Icon(Icons.keyboard_arrow_right, color: Color(0xFF979797),),
                    ),
                  ],
                ),
                onTap: () {Navigator.push(context, MaterialPageRoute(builder: (context) => LocalAuthorities()),);},
              ),
            ),
            Padding(
              padding:EdgeInsets.symmetric(horizontal:15.0),
              child:Container(
                height:1.0,
                color:Color.fromRGBO(0, 0, 0, 0.1),),),
            Container(
              padding: EdgeInsets.only(left: 25, right: 25, bottom: 10, top: 10,),
              child: GestureDetector(
                child: Row(
                  children: <Widget>[
                    Column(
                      children: <Widget>[
                        Row(
                          children:<Widget>[
                            Container(
                              height: 30,
                              width: 30,
                              child: SvgPicture.asset('assets/images/circle_69E781.svg'),
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width - 120,
                              padding: EdgeInsets.only(left: 10,),
                              child: Text('Deranjamente',
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
                          child: Text('Date de contact pentru informații sau reclamații '
                              'privind serviciile de alimentare cu apă, canalizare sau servicii comunale',
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
                      child: Icon(Icons.keyboard_arrow_right, color: Color(0xFF979797),),
                    ),
                  ],
                ),
                onTap: () {Navigator.push(context, MaterialPageRoute(builder: (context) => Miscellaneous()),);},
              ),
            ),
            Padding(
              padding:EdgeInsets.symmetric(horizontal:15.0),
              child:Container(
                height:1.0,
                color:Color.fromRGBO(0, 0, 0, 0.1),),),
            Container(
              padding: EdgeInsets.only(left: 25, right: 25, bottom: 10, top: 10,),
              child: GestureDetector(
                child: Row(
                  children: <Widget>[
                    Column(
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            Container(
                              height: 30,
                              width: 30,
                              child: SvgPicture.asset('assets/images/circle_194C80.svg'),
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width - 120,
                              padding: EdgeInsets.only(left: 10,),
                              child: Text('Instituții publice',
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
                          child: Text('Date de contact pentru principalele instituții '
                              'publice locale (primărie, spital, poliție etc.)',
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
                      child: Icon(Icons.keyboard_arrow_right, color: Color(0xFF979797),),
                    ),
                  ],
                ),
                onTap: () {Navigator.push(context, MaterialPageRoute(builder: (context) => PublicInstitutions()),);},
              ),
            ),
            Padding(
              padding:EdgeInsets.symmetric(horizontal:15.0),
              child:Container(
                height:1.0,
                color:Color.fromRGBO(0, 0, 0, 0.1),),),
            Container(
              padding: EdgeInsets.only(left: 25, right: 25, bottom: 10, top: 10,),
              child: GestureDetector(
                child: Row(
                  children: <Widget>[
                    Column(
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            Container(
                              height: 30,
                              width: 30,
                              child: SvgPicture.asset('assets/images/circle_EB7D16.svg'),
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width - 120,
                              padding: EdgeInsets.only(left: 10,),
                              child: Text('Tehnicieni și alți specialiști',
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
                          padding: EdgeInsets.only(top: 10,),
                          width: MediaQuery.of(context).size.width - 80,
                          child: Text('Coming soon',
                            overflow: TextOverflow.ellipsis,
                            maxLines: 5,
                            style: TextStyle(
                              color: Color(0xFFC4C4C4),//color: Color(0xFF38A49C),
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
                onTap: null,
              ),
            ),
            Padding(
              padding:EdgeInsets.symmetric(horizontal:15.0),
              child:Container(
                height:1.0,
                color:Color.fromRGBO(0, 0, 0, 0.1),),),
          ],
        ),
      ),
    );
  }
}
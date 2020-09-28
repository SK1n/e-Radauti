import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
//import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutterapperadauti/menu_page.dart';
import 'package:url_launcher/url_launcher.dart' as UrlLauncher;


class Taxi extends StatelessWidget {
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
          padding: EdgeInsets.only(),
          child: Column(
            children: <Widget>[
              Container(
                padding: EdgeInsets.only(top: 20, bottom: 15,),
                child: Row(
                  children: <Widget>[
                    Container(
                      alignment: Alignment.centerLeft,
                      child: IconButton(
                        icon: Icon(Icons.keyboard_arrow_left, color: Color(0xFF979797),),
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
                              Icon(Icons.local_taxi, color: Color(0x55FB6340), size: 30,),
                              SizedBox(width: 5,),
                              Container(
                                child: Padding(
                                  padding: EdgeInsets.fromLTRB(35.0, 6.0, 0.0, 0.0,), //10.0 //25.0
                                  child: Text(
                                    'Taximetriști',
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
              //1

              Container(
                padding: EdgeInsets.only(left: 25, right: 25, bottom: 10, top: 10,),
                child: Column(
                  children: <Widget>[
                    //1,2
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Column(
                          children: <Widget>[
                            Container(
                              height: 30,
                              width: 30,
                              child: Icon(
                                Icons.local_taxi,
                                color: Color(0xFF979797),
                              ),
                            ),
                          ],
                        ),
                        Container(
                          padding: EdgeInsets.only(left: 10,),
                          child: Column(
                            children: <Widget>[
                              Container(
                                padding: EdgeInsets.only(bottom: 10, top: 5,),
                                width: MediaQuery.of(context).size.width - 90,
                                child: Text(
                                  'Boicu Costică',
                                  style: TextStyle(
                                    color: Color(0xFF32325D), //Color(0xFFFFFFFF),
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                  ),
                                ),
                              ),
                              Container(
                                width: MediaQuery.of(context).size.width - 90,
                                child: Text(
                                  'DACIA LOGAN',
                                  style: TextStyle(
                                    //fontWeight: FontWeight.bold,
                                    //decoration: TextDecoration.underline,
                                    fontSize: 15.0,
                                  ),
                                ),
                              ),
                              //2.2-1
                              Container(
                                width: MediaQuery.of(context).size.width - 90,
                                child: Text(
                                  'SV 12 NLJ',
                                  style: TextStyle(
                                    //fontWeight: FontWeight.bold,
                                    //decoration: TextDecoration.underline,
                                    fontSize: 15.0,
                                  ),
                                ),
                              ),
                              //2.2-1
                              Container(
                                width: MediaQuery.of(context).size.width - 90,
                                child: Text(
                                  '0740 348 225',
                                  style: TextStyle(
                                    fontSize: 15.0,
                                  ),
                                ),
                              ),
                              //2.2-2
                              //2.2-3
                            ],
                          ),
                        ),
                      ],
                    ),
                    //3
                    Container(
                      padding: EdgeInsets.only(top: 10,),
                      width: MediaQuery.of(context).size.width - 35,
                      child: FlatButton(
                        color: Color(0xFF38A49C),
                        textColor: Colors.white,
                        disabledColor: Colors.grey,
                        disabledTextColor: Colors.black,
                        splashColor: Color(0x8838A49C),
                        child: Text(
                          'Sună acum',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 15.0,
                          ),
                        ),
                        onPressed: () {
                          UrlLauncher.launch("tel://0740348225");
                        },
                      ),
                    ),
                    //4
                  ],
                ),
              ),
              Padding(
                padding:EdgeInsets.symmetric(horizontal:15.0),
                child:Container(
                  height:1.0,
                  color:Color.fromRGBO(0, 0, 0, 0.1),),),
              //2
              Container(
                padding: EdgeInsets.only(left: 25, right: 25, bottom: 10, top: 10,),
                child: Column(
                  children: <Widget>[
                    //1,2
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Column(
                          children: <Widget>[
                            Container(
                              height: 30,
                              width: 30,
                                child: Icon(
                                  Icons.local_taxi,
                                  color: Color(0xFF979797),
                                ),
                            ),
                          ],
                        ),
                        Container(
                          padding: EdgeInsets.only(left: 10,),
                          child: Column(
                            children: <Widget>[
                              Container(
                                padding: EdgeInsets.only(bottom: 10, top: 5,),
                                width: MediaQuery.of(context).size.width - 90,
                                child: Text(
                                  'Covașă Sorin',
                                  style: TextStyle(
                                    color: Color(0xFF32325D), //Color(0xFFFFFFFF),
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                  ),
                                ),
                              ),
                              Container(
                                width: MediaQuery.of(context).size.width - 90,
                                child: Text(
                                  'DACIA LOGAN',
                                  style: TextStyle(
                                    //fontWeight: FontWeight.bold,
                                    //decoration: TextDecoration.underline,
                                    fontSize: 15.0,
                                  ),
                                ),
                              ),
                              //2.2-1
                              Container(
                                width: MediaQuery.of(context).size.width - 90,
                                child: Text(
                                  'SV 27 COV',
                                  style: TextStyle(
                                    //fontWeight: FontWeight.bold,
                                    //decoration: TextDecoration.underline,
                                    fontSize: 15.0,
                                  ),
                                ),
                              ),
                              //2.2-1
                              Container(
                                width: MediaQuery.of(context).size.width - 90,
                                child: Text(
                                  '0742 041 403',
                                  style: TextStyle(
                                    fontSize: 15.0,
                                  ),
                                ),
                              ),
                              //2.2-2
                              //2.2-3
                            ],
                          ),
                        ),
                      ],
                    ),
                    //3
                    Container(
                      padding: EdgeInsets.only(top: 10,),
                      width: MediaQuery.of(context).size.width - 35,
                      child: FlatButton(
                        color: Color(0xFF38A49C),
                        textColor: Colors.white,
                        disabledColor: Colors.grey,
                        disabledTextColor: Colors.black,
                        splashColor: Color(0x8838A49C),
                        child: Text(
                          'Sună acum',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 15.0,
                          ),
                        ),
                        onPressed: () {
                          UrlLauncher.launch("tel://0742041403");
                        },
                      ),
                    ),
                    //4
                  ],
                ),
              ),
              Padding(
                padding:EdgeInsets.symmetric(horizontal:15.0),
                child:Container(
                  height:1.0,
                  color:Color.fromRGBO(0, 0, 0, 0.1),),),
              //3
              Container(
                padding: EdgeInsets.only(left: 25, right: 25, bottom: 10, top: 10,),
                child: Column(
                  children: <Widget>[
                    //1,2
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Column(
                          children: <Widget>[
                            Container(
                              height: 30,
                              width: 30,
                              child: Icon(
                                Icons.local_taxi,
                                color: Color(0xFF979797),
                              ),
                            ),
                          ],
                        ),
                        Container(
                          padding: EdgeInsets.only(left: 10,),
                          child: Column(
                            children: <Widget>[
                              Container(
                                padding: EdgeInsets.only(bottom: 10, top: 5,),
                                width: MediaQuery.of(context).size.width - 90,
                                child: Text(
                                  'Diaconescu Florin',
                                  style: TextStyle(
                                    color: Color(0xFF32325D), //Color(0xFFFFFFFF),
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                  ),
                                ),
                              ),
                              Container(
                                width: MediaQuery.of(context).size.width - 90,
                                child: Text(
                                  'VW TOURAN (CREM)',
                                  style: TextStyle(
                                    //fontWeight: FontWeight.bold,
                                    //decoration: TextDecoration.underline,
                                    fontSize: 15.0,
                                  ),
                                ),
                              ),
                              //2.2-1
                              Container(
                                width: MediaQuery.of(context).size.width - 90,
                                child: Text(
                                  'SV 13 NOC',
                                  style: TextStyle(
                                    //fontWeight: FontWeight.bold,
                                    //decoration: TextDecoration.underline,
                                    fontSize: 15.0,
                                  ),
                                ),
                              ),
                              //2.2-1
                              Container(
                                width: MediaQuery.of(context).size.width - 90,
                                child: Text(
                                  '0766 210 240 / 0749 97 78 12',
                                  style: TextStyle(
                                    fontSize: 15.0,
                                  ),
                                ),
                              ),
                              //2.2-2
                              //2.2-3
                            ],
                          ),
                        ),
                      ],
                    ),
                    //3
                    Container(
                      padding: EdgeInsets.only(top: 10,),
                      width: MediaQuery.of(context).size.width - 35,
                      child: FlatButton(
                        color: Color(0xFF38A49C),
                        textColor: Colors.white,
                        disabledColor: Colors.grey,
                        disabledTextColor: Colors.black,
                        splashColor: Color(0x8838A49C),
                        child: Text(
                          'Sună acum',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 15.0,
                          ),
                        ),
                        onPressed: () {
                          UrlLauncher.launch("tel://0766 210 240");
                        },
                      ),
                    ),
                    //4
                  ],
                ),
              ),
              Padding(
                padding:EdgeInsets.symmetric(horizontal:15.0),
                child:Container(
                  height:1.0,
                  color:Color.fromRGBO(0, 0, 0, 0.1),),),
              Container(
                padding: EdgeInsets.only(left: 25, right: 25, bottom: 10, top: 10,),
                child: Column(
                  children: <Widget>[
                    //1,2
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Column(
                          children: <Widget>[
                            Container(
                              height: 30,
                              width: 30,
                              child: Icon(
                                Icons.local_taxi,
                                color: Color(0xFF979797),
                              ),
                            ),
                          ],
                        ),
                        Container(
                          padding: EdgeInsets.only(left: 10,),
                          child: Column(
                            children: <Widget>[
                              Container(
                                padding: EdgeInsets.only(bottom: 10, top: 5,),
                                width: MediaQuery.of(context).size.width - 90,
                                child: Text(
                                  'Grab Ioan',
                                  style: TextStyle(
                                    color: Color(0xFF32325D), //Color(0xFFFFFFFF),
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                  ),
                                ),
                              ),
                              Container(
                                width: MediaQuery.of(context).size.width - 90,
                                child: Text(
                                  'MERCEDES E-CLASS',
                                  style: TextStyle(
                                    //fontWeight: FontWeight.bold,
                                    //decoration: TextDecoration.underline,
                                    fontSize: 15.0,
                                  ),
                                ),
                              ),
                              //2.2-1
                              Container(
                                width: MediaQuery.of(context).size.width - 90,
                                child: Text(
                                  'SV 11 NEL',
                                  style: TextStyle(
                                    //fontWeight: FontWeight.bold,
                                    //decoration: TextDecoration.underline,
                                    fontSize: 15.0,
                                  ),
                                ),
                              ),
                              //2.2-1
                              Container(
                                width: MediaQuery.of(context).size.width - 90,
                                child: Text(
                                  '0740 593 510',
                                  style: TextStyle(
                                    fontSize: 15.0,
                                  ),
                                ),
                              ),
                              //2.2-2
                              //2.2-3
                            ],
                          ),
                        ),
                      ],
                    ),
                    //3
                    Container(
                      padding: EdgeInsets.only(top: 10,),
                      width: MediaQuery.of(context).size.width - 35,
                      child: FlatButton(
                        color: Color(0xFF38A49C),
                        textColor: Colors.white,
                        disabledColor: Colors.grey,
                        disabledTextColor: Colors.black,
                        splashColor: Color(0x8838A49C),
                        child: Text(
                          'Sună acum',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 15.0,
                          ),
                        ),
                        onPressed: () {
                          UrlLauncher.launch("tel://0740593510");
                        },
                      ),
                    ),
                    //4
                  ],
                ),
              ),
              Padding(
                padding:EdgeInsets.symmetric(horizontal:15.0),
                child:Container(
                  height:1.0,
                  color:Color.fromRGBO(0, 0, 0, 0.1),),),
              Container(
                padding: EdgeInsets.only(left: 25, right: 25, bottom: 10, top: 10,),
                child: Column(
                  children: <Widget>[
                    //1,2
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Column(
                          children: <Widget>[
                            Container(
                              height: 30,
                              width: 30,
                              child: Icon(
                                Icons.local_taxi,
                                color: Color(0xFF979797),
                              ),
                            ),
                          ],
                        ),
                        Container(
                          padding: EdgeInsets.only(left: 10,),
                          child: Column(
                            children: <Widget>[
                              Container(
                                padding: EdgeInsets.only(bottom: 10, top: 5,),
                                width: MediaQuery.of(context).size.width - 90,
                                child: Text(
                                  'Lazăr Gheorghe',
                                  style: TextStyle(
                                    color: Color(0xFF32325D), //Color(0xFFFFFFFF),
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                  ),
                                ),
                              ),
                              Container(
                                width: MediaQuery.of(context).size.width - 90,
                                child: Text(
                                  'DACIA SANDERO',
                                  style: TextStyle(
                                    //fontWeight: FontWeight.bold,
                                    //decoration: TextDecoration.underline,
                                    fontSize: 15.0,
                                  ),
                                ),
                              ),
                              //2.2-1
                              Container(
                                width: MediaQuery.of(context).size.width - 90,
                                child: Text(
                                  'SV 62 LAZ',
                                  style: TextStyle(
                                    //fontWeight: FontWeight.bold,
                                    //decoration: TextDecoration.underline,
                                    fontSize: 15.0,
                                  ),
                                ),
                              ),
                              //2.2-1
                              Container(
                                width: MediaQuery.of(context).size.width - 90,
                                child: Text(
                                  '0741 283 879',
                                  style: TextStyle(
                                    fontSize: 15.0,
                                  ),
                                ),
                              ),
                              //2.2-2
                              //2.2-3
                            ],
                          ),
                        ),
                      ],
                    ),
                    //3
                    Container(
                      padding: EdgeInsets.only(top: 10,),
                      width: MediaQuery.of(context).size.width - 35,
                      child: FlatButton(
                        color: Color(0xFF38A49C),
                        textColor: Colors.white,
                        disabledColor: Colors.grey,
                        disabledTextColor: Colors.black,
                        splashColor: Color(0x8838A49C),
                        child: Text(
                          'Sună acum',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 15.0,
                          ),
                        ),
                        onPressed: () {
                          UrlLauncher.launch("tel://0741283879");
                        },
                      ),
                    ),
                    //4
                  ],
                ),
              ),
              Padding(
                padding:EdgeInsets.symmetric(horizontal:15.0),
                child:Container(
                  height:1.0,
                  color:Color.fromRGBO(0, 0, 0, 0.1),),),
              Container(
                padding: EdgeInsets.only(left: 25, right: 25, bottom: 10, top: 10,),
                child: Column(
                  children: <Widget>[
                    //1,2
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Column(
                          children: <Widget>[
                            Container(
                              height: 30,
                              width: 30,
                              child: Icon(
                                Icons.local_taxi,
                                color: Color(0xFF979797),
                              ),
                            ),
                          ],
                        ),
                        Container(
                          padding: EdgeInsets.only(left: 10,),
                          child: Column(
                            children: <Widget>[
                              Container(
                                padding: EdgeInsets.only(bottom: 10, top: 5,),
                                width: MediaQuery.of(context).size.width - 90,
                                child: Text(
                                  'Mihalescu Toni',
                                  style: TextStyle(
                                    color: Color(0xFF32325D), //Color(0xFFFFFFFF),
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                  ),
                                ),
                              ),
                              Container(
                                width: MediaQuery.of(context).size.width - 90,
                                child: Text(
                                  'DACIA LOGAN',
                                  style: TextStyle(
                                    //fontWeight: FontWeight.bold,
                                    //decoration: TextDecoration.underline,
                                    fontSize: 15.0,
                                  ),
                                ),
                              ),
                              //2.2-1
                              Container(
                                width: MediaQuery.of(context).size.width - 90,
                                child: Text(
                                  'SV 12 TWL',
                                  style: TextStyle(
                                    //fontWeight: FontWeight.bold,
                                    //decoration: TextDecoration.underline,
                                    fontSize: 15.0,
                                  ),
                                ),
                              ),
                              //2.2-1
                              Container(
                                width: MediaQuery.of(context).size.width - 90,
                                child: Text(
                                  '0742 161 708',
                                  style: TextStyle(
                                    fontSize: 15.0,
                                  ),
                                ),
                              ),
                              //2.2-2
                              //2.2-3
                            ],
                          ),
                        ),
                      ],
                    ),
                    //3
                    Container(
                      padding: EdgeInsets.only(top: 10,),
                      width: MediaQuery.of(context).size.width - 35,
                      child: FlatButton(
                        color: Color(0xFF38A49C),
                        textColor: Colors.white,
                        disabledColor: Colors.grey,
                        disabledTextColor: Colors.black,
                        splashColor: Color(0x8838A49C),
                        child: Text(
                          'Sună acum',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 15.0,
                          ),
                        ),
                        onPressed: () {
                          UrlLauncher.launch("tel://0742161708");
                        },
                      ),
                    ),
                    //4
                  ],
                ),
              ),
              Padding(
                padding:EdgeInsets.symmetric(horizontal:15.0),
                child:Container(
                  height:1.0,
                  color:Color.fromRGBO(0, 0, 0, 0.1),),),
              Container(
                padding: EdgeInsets.only(left: 25, right: 25, bottom: 10, top: 10,),
                child: Column(
                  children: <Widget>[
                    //1,2
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Column(
                          children: <Widget>[
                            Container(
                              height: 30,
                              width: 30,
                              child: Icon(
                                Icons.local_taxi,
                                color: Color(0xFF979797),
                              ),
                            ),
                          ],
                        ),
                        Container(
                          padding: EdgeInsets.only(left: 10,),
                          child: Column(
                            children: <Widget>[
                              Container(
                                padding: EdgeInsets.only(bottom: 10, top: 5,),
                                width: MediaQuery.of(context).size.width - 90,
                                child: Text(
                                  'Paslariu Mihai',
                                  style: TextStyle(
                                    color: Color(0xFF32325D), //Color(0xFFFFFFFF),
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                  ),
                                ),
                              ),
                              Container(
                                width: MediaQuery.of(context).size.width - 90,
                                child: Text(
                                  'VOLKSWAGEN',
                                  style: TextStyle(
                                    //fontWeight: FontWeight.bold,
                                    //decoration: TextDecoration.underline,
                                    fontSize: 15.0,
                                  ),
                                ),
                              ),
                              //2.2-1
                              Container(
                                width: MediaQuery.of(context).size.width - 90,
                                child: Text(
                                  'SV 74 MSV',
                                  style: TextStyle(
                                    //fontWeight: FontWeight.bold,
                                    //decoration: TextDecoration.underline,
                                    fontSize: 15.0,
                                  ),
                                ),
                              ),
                              //2.2-1
                              Container(
                                width: MediaQuery.of(context).size.width - 90,
                                child: Text(
                                  '0744 622 405',
                                  style: TextStyle(
                                    fontSize: 15.0,
                                  ),
                                ),
                              ),
                              //2.2-2
                              //2.2-3
                            ],
                          ),
                        ),
                      ],
                    ),
                    //3
                    Container(
                      padding: EdgeInsets.only(top: 10,),
                      width: MediaQuery.of(context).size.width - 35,
                      child: FlatButton(
                        color: Color(0xFF38A49C),
                        textColor: Colors.white,
                        disabledColor: Colors.grey,
                        disabledTextColor: Colors.black,
                        splashColor: Color(0x8838A49C),
                        child: Text(
                          'Sună acum',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 15.0,
                          ),
                        ),
                        onPressed: () {
                          UrlLauncher.launch("tel://0744622405");
                        },
                      ),
                    ),
                    //4
                  ],
                ),
              ),
              Padding(
                padding:EdgeInsets.symmetric(horizontal:15.0),
                child:Container(
                  height:1.0,
                  color:Color.fromRGBO(0, 0, 0, 0.1),),),
              Container(
                padding: EdgeInsets.only(left: 25, right: 25, bottom: 10, top: 10,),
                child: Column(
                  children: <Widget>[
                    //1,2
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Column(
                          children: <Widget>[
                            Container(
                              height: 30,
                              width: 30,
                              child: Icon(
                                Icons.local_taxi,
                                color: Color(0xFF979797),
                              ),
                            ),
                          ],
                        ),
                        Container(
                          padding: EdgeInsets.only(left: 10,),
                          child: Column(
                            children: <Widget>[
                              Container(
                                padding: EdgeInsets.only(bottom: 10, top: 5,),
                                width: MediaQuery.of(context).size.width - 90,
                                child: Text(
                                  'Pesclevei Radu',
                                  style: TextStyle(
                                    color: Color(0xFF32325D), //Color(0xFFFFFFFF),
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                  ),
                                ),
                              ),
                              Container(
                                width: MediaQuery.of(context).size.width - 90,
                                child: Text(
                                  'DACIA DOKKER',
                                  style: TextStyle(
                                    //fontWeight: FontWeight.bold,
                                    //decoration: TextDecoration.underline,
                                    fontSize: 15.0,
                                  ),
                                ),
                              ),
                              //2.2-1
                              Container(
                                width: MediaQuery.of(context).size.width - 90,
                                child: Text(
                                  'SV 21 PCR',
                                  style: TextStyle(
                                    //fontWeight: FontWeight.bold,
                                    //decoration: TextDecoration.underline,
                                    fontSize: 15.0,
                                  ),
                                ),
                              ),
                              //2.2-1
                              Container(
                                width: MediaQuery.of(context).size.width - 90,
                                child: Text(
                                  '0741 697 725',
                                  style: TextStyle(
                                    fontSize: 15.0,
                                  ),
                                ),
                              ),
                              //2.2-2
                              //2.2-3
                            ],
                          ),
                        ),
                      ],
                    ),
                    //3
                    Container(
                      padding: EdgeInsets.only(top: 10,),
                      width: MediaQuery.of(context).size.width - 35,
                      child: FlatButton(
                        color: Color(0xFF38A49C),
                        textColor: Colors.white,
                        disabledColor: Colors.grey,
                        disabledTextColor: Colors.black,
                        splashColor: Color(0x8838A49C),
                        child: Text(
                          'Sună acum',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 15.0,
                          ),
                        ),
                        onPressed: () {
                          UrlLauncher.launch("tel://0741697725");
                        },
                      ),
                    ),
                    //4
                  ],
                ),
              ),
              Padding(
                padding:EdgeInsets.symmetric(horizontal:15.0),
                child:Container(
                  height:1.0,
                  color:Color.fromRGBO(0, 0, 0, 0.1),),),
              Container(
                padding: EdgeInsets.only(left: 25, right: 25, bottom: 10, top: 10,),
                child: Column(
                  children: <Widget>[
                    //1,2
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Column(
                          children: <Widget>[
                            Container(
                              height: 30,
                              width: 30,
                              child: Icon(
                                Icons.local_taxi,
                                color: Color(0xFF979797),
                              ),
                            ),
                          ],
                        ),
                        Container(
                          padding: EdgeInsets.only(left: 10,),
                          child: Column(
                            children: <Widget>[
                              Container(
                                padding: EdgeInsets.only(bottom: 10, top: 5,),
                                width: MediaQuery.of(context).size.width - 90,
                                child: Text(
                                  'Rose Taxi Rădăuți - Trandafir Marius',
                                  style: TextStyle(
                                    color: Color(0xFF32325D), //Color(0xFFFFFFFF),
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                  ),
                                ),
                              ),
                              Container(
                                width: MediaQuery.of(context).size.width - 90,
                                child: Text(
                                  'DACIA LOGAN',
                                  style: TextStyle(
                                    //fontWeight: FontWeight.bold,
                                    //decoration: TextDecoration.underline,
                                    fontSize: 15.0,
                                  ),
                                ),
                              ),
                              //2.2-1
                              Container(
                                width: MediaQuery.of(context).size.width - 90,
                                child: Text(
                                  'SV 01 LMM',
                                  style: TextStyle(
                                    //fontWeight: FontWeight.bold,
                                    //decoration: TextDecoration.underline,
                                    fontSize: 15.0,
                                  ),
                                ),
                              ),
                              //2.2-1
                              Container(
                                width: MediaQuery.of(context).size.width - 90,
                                child: Text(
                                  '0754 554 488',
                                  style: TextStyle(
                                    fontSize: 15.0,
                                  ),
                                ),
                              ),
                              //2.2-2
                              //2.2-3
                            ],
                          ),
                        ),
                      ],
                    ),
                    //3
                    Container(
                      padding: EdgeInsets.only(top: 10,),
                      width: MediaQuery.of(context).size.width - 35,
                      child: FlatButton(
                        color: Color(0xFF38A49C),
                        textColor: Colors.white,
                        disabledColor: Colors.grey,
                        disabledTextColor: Colors.black,
                        splashColor: Color(0x8838A49C),
                        child: Text(
                          'Sună acum',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 15.0,
                          ),
                        ),
                        onPressed: () {
                          UrlLauncher.launch("tel://0754554488");
                        },
                      ),
                    ),
                    //4
                  ],
                ),
              ),
              Padding(
                padding:EdgeInsets.symmetric(horizontal:15.0),
                child:Container(
                  height:1.0,
                  color:Color.fromRGBO(0, 0, 0, 0.1),),),
              Container(
                padding: EdgeInsets.only(left: 25, right: 25, bottom: 10, top: 10,),
                child: Column(
                  children: <Widget>[
                    //1,2
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Column(
                          children: <Widget>[
                            Container(
                              height: 30,
                              width: 30,
                              child: Icon(
                                Icons.local_taxi,
                                color: Color(0xFF979797),
                              ),
                            ),
                          ],
                        ),
                        Container(
                          padding: EdgeInsets.only(left: 10,),
                          child: Column(
                            children: <Widget>[
                              Container(
                                padding: EdgeInsets.only(bottom: 10, top: 5,),
                                width: MediaQuery.of(context).size.width - 90,
                                child: Text(
                                  'Tiperciuc Vasile',
                                  style: TextStyle(
                                    color: Color(0xFF32325D), //Color(0xFFFFFFFF),
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                  ),
                                ),
                              ),
                              Container(
                                width: MediaQuery.of(context).size.width - 90,
                                child: Text(
                                  'DACIA LOGAN',
                                  style: TextStyle(
                                    //fontWeight: FontWeight.bold,
                                    //decoration: TextDecoration.underline,
                                    fontSize: 15.0,
                                  ),
                                ),
                              ),
                              //2.2-1
                              Container(
                                width: MediaQuery.of(context).size.width - 90,
                                child: Text(
                                  'SV 04 PNZ',
                                  style: TextStyle(
                                    //fontWeight: FontWeight.bold,
                                    //decoration: TextDecoration.underline,
                                    fontSize: 15.0,
                                  ),
                                ),
                              ),
                              //2.2-1
                              Container(
                                width: MediaQuery.of(context).size.width - 90,
                                child: Text(
                                  '0745 536 280',
                                  style: TextStyle(
                                    fontSize: 15.0,
                                  ),
                                ),
                              ),
                              //2.2-2
                              //2.2-3
                            ],
                          ),
                        ),
                      ],
                    ),
                    //3
                    Container(
                      padding: EdgeInsets.only(top: 10,),
                      width: MediaQuery.of(context).size.width - 35,
                      child: FlatButton(
                        color: Color(0xFF38A49C),
                        textColor: Colors.white,
                        disabledColor: Colors.grey,
                        disabledTextColor: Colors.black,
                        splashColor: Color(0x8838A49C),
                        child: Text(
                          'Sună acum',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 15.0,
                          ),
                        ),
                        onPressed: () {
                          UrlLauncher.launch("tel://0745536280");
                        },
                      ),
                    ),
                    //4
                  ],
                ),
              ),
              Padding(
                padding:EdgeInsets.symmetric(horizontal:15.0),
                child:Container(
                  height:1.0,
                  color:Color.fromRGBO(0, 0, 0, 0.1),),),
              Container(
                padding: EdgeInsets.only(left: 25, right: 25, bottom: 10, top: 10,),
                child: Column(
                  children: <Widget>[
                    //1,2
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Column(
                          children: <Widget>[
                            Container(
                              height: 30,
                              width: 30,
                              child: Icon(
                                Icons.local_taxi,
                                color: Color(0xFF979797),
                              ),
                            ),
                          ],
                        ),
                        Container(
                          padding: EdgeInsets.only(left: 10,),
                          child: Column(
                            children: <Widget>[
                              Container(
                                padding: EdgeInsets.only(bottom: 10, top: 5,),
                                width: MediaQuery.of(context).size.width - 90,
                                child: Text(
                                  'Toderaș Viorel',
                                  style: TextStyle(
                                    color: Color(0xFF32325D), //Color(0xFFFFFFFF),
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                  ),
                                ),
                              ),
                              Container(
                                width: MediaQuery.of(context).size.width - 90,
                                child: Text(
                                  'VW PASSAT',
                                  style: TextStyle(
                                    //fontWeight: FontWeight.bold,
                                    //decoration: TextDecoration.underline,
                                    fontSize: 15.0,
                                  ),
                                ),
                              ),
                              //2.2-1
                              Container(
                                width: MediaQuery.of(context).size.width - 90,
                                child: Text(
                                  'SV 16 TOD',
                                  style: TextStyle(
                                    //fontWeight: FontWeight.bold,
                                    //decoration: TextDecoration.underline,
                                    fontSize: 15.0,
                                  ),
                                ),
                              ),
                              //2.2-1
                              Container(
                                width: MediaQuery.of(context).size.width - 90,
                                child: Text(
                                  '0745 683 668',
                                  style: TextStyle(
                                    fontSize: 15.0,
                                  ),
                                ),
                              ),
                              //2.2-2
                              //2.2-3
                            ],
                          ),
                        ),
                      ],
                    ),
                    //3
                    Container(
                      padding: EdgeInsets.only(top: 10,),
                      width: MediaQuery.of(context).size.width - 35,
                      child: FlatButton(
                        color: Color(0xFF38A49C),
                        textColor: Colors.white,
                        disabledColor: Colors.grey,
                        disabledTextColor: Colors.black,
                        splashColor: Color(0x8838A49C),
                        child: Text(
                          'Sună acum',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 15.0,
                          ),
                        ),
                        onPressed: () {
                          UrlLauncher.launch("tel://0745683668");
                        },
                      ),
                    ),
                    //4
                  ],
                ),
              ),
              Padding(
                padding:EdgeInsets.symmetric(horizontal:15.0),
                child:Container(
                  height:1.0,
                  color:Color.fromRGBO(0, 0, 0, 0.1),),),

              /*Padding(
              padding:EdgeInsets.symmetric(horizontal:15.0),
              child:Container(
                height:1.0,
                color:Color.fromRGBO(0, 0, 0, 0.1),),),*/
            ],
          ),
        )
    );
  }
}
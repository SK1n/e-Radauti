import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutterapperadauti/menu_page.dart';
import 'package:url_launcher/url_launcher.dart' as UrlLauncher;


class LocalAuthorities extends StatelessWidget {
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
                            Icon(Icons.perm_phone_msg, color: Color(0x55FB6340), size: 30,),
                            SizedBox(width: 5,),
                            Container(
                              child: Padding(
                                padding: EdgeInsets.fromLTRB(35.0, 6.0, 0.0, 0.0,), //10.0 //25.0
                                child: Text(
                                  'Autorități locale',
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
                            child: SvgPicture.asset('assets/images/circle_194C80.svg'),
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
                                'Poliția Locală',
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
                                'Contact',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  decoration: TextDecoration.underline,
                                  fontSize: 15.0,
                                ),
                              ),
                            ),
                            //2.2-1
                            Container(
                              width: MediaQuery.of(context).size.width - 90,
                              child: Text(
                                '0230 567 299',
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
                        UrlLauncher.launch("tel://0230567299");
                      },
                    ),
                  ),
                  //4
                  Container(
                    padding: EdgeInsets.only(top: 10,),
                    child: new InkWell(
                      child: new Text(
                        'Trimite unui prieten',
                        style: TextStyle(
                          fontSize: 15.0,
                          decoration: TextDecoration.underline,
                          color: Color(0xFF38A49C),
                        ),
                      ),
                      onTap: () => UrlLauncher.launch("mailto:"),
                      //onTap: () => UrlLauncher.launch("tel://0230520172"),
                      //onTap: () => UrlLauncher.launch("mailto:registratura@primarie.ro"),
                    ),
                  ),
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
                            child: SvgPicture.asset('assets/images/circle_194C80.svg'),
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
                                'Spitalul Municipal',
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
                                'Contact',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  decoration: TextDecoration.underline,
                                  fontSize: 15.0,
                                ),
                              ),
                            ),
                            //2.2-1
                            Container(
                              width: MediaQuery.of(context).size.width - 90,
                              child: Text(
                                '0230 563 281',
                                style: TextStyle(
                                  fontSize: 15.0,
                                ),
                              ),
                            ),
                            //2.2-2
                            Container(
                              width: MediaQuery.of(context).size.width - 90,
                              child: Text(
                                '0230 564 067',
                                style: TextStyle(
                                  fontSize: 15.0,
                                ),
                              ),
                            ),
                            //2.2-3
                            Container(
                              width: MediaQuery.of(context).size.width - 90,
                              child: Text(
                                'info@spitalul-radauti.ro',
                                style: TextStyle(
                                  fontSize: 15.0,
                                ),
                              ),
                            ),
                            //2.2-4
                            Container(
                              width: MediaQuery.of(context).size.width - 90,
                              child: Text(
                                'spitalradauti@yahoo.com',
                                style: TextStyle(
                                  fontSize: 15.0,
                                ),
                              ),
                            ),
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
                        UrlLauncher.launch("tel://0230563281");
                      },
                    ),
                  ),
                  //4
                  Container(
                    padding: EdgeInsets.only(top: 10,),
                    child: new InkWell(
                      child: new Text(
                        'Trimite unui prieten',
                        style: TextStyle(
                          fontSize: 15.0,
                          decoration: TextDecoration.underline,
                          color: Color(0xFF38A49C),
                        ),
                      ),
                      onTap: () => UrlLauncher.launch("mailto:"),
                      //onTap: () => UrlLauncher.launch("tel://0230520172"),
                      //onTap: () => UrlLauncher.launch("mailto:registratura@primarie.ro"),
                    ),
                  ),
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
              padding: EdgeInsets.only(left: 25, right: 25, bottom: 30, top: 10,),
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
                            child: SvgPicture.asset('assets/images/circle_194C80.svg'),
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
                                'Primărie',
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
                                'Contact',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  decoration: TextDecoration.underline,
                                  fontSize: 15.0,
                                ),
                              ),
                            ),
                            //2.2-1
                            Container(
                              width: MediaQuery.of(context).size.width - 90,
                              child: Text(
                                '0230 561 140',
                                style: TextStyle(
                                  fontSize: 15.0,
                                ),
                              ),
                            ),
                            //2.2-2
                            Container(
                              width: MediaQuery.of(context).size.width - 90,
                              child: Text(
                                'relatiipublice@primariaradauti.ro',
                                style: TextStyle(
                                  fontSize: 15.0,
                                ),
                              ),
                            ),
                            //2.2-3
                            Container(
                              width: MediaQuery.of(context).size.width - 90,
                              child: Text(
                                'secretariat@primariaradauti.ro',
                                style: TextStyle(
                                  fontSize: 15.0,
                                ),
                              ),
                            ),
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
                        UrlLauncher.launch("tel://0230561140");
                      },
                    ),
                  ),
                  //4
                  Container(
                    padding: EdgeInsets.only(top: 10,),
                    child: new InkWell(
                      child: new Text(
                        'Trimite unui prieten',
                        style: TextStyle(
                          fontSize: 15.0,
                          decoration: TextDecoration.underline,
                          color: Color(0xFF38A49C),
                        ),
                      ),
                      onTap: () => UrlLauncher.launch("mailto:"),
                      //onTap: () => UrlLauncher.launch("tel://0230520172"),
                      //onTap: () => UrlLauncher.launch("mailto:registratura@primarie.ro"),
                    ),
                  ),
                ],
              ),
            ),
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
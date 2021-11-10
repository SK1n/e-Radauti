import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutterapperadauti/widgets/src/appBarModelNew.dart';
import 'package:flutterapperadauti/widgets/src/nav_drawer.dart';
import 'package:url_launcher/url_launcher.dart' as UrlLauncher;

class Contractors extends StatelessWidget {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _scaffoldKey,
        drawer: NavDrawer(),
        body: NestedScrollView(
          headerSliverBuilder: (context, innerBoxIsScrolled) {
            return [
              AppBarUiSliver(
                content: 'Tehnicieni și specialiști',
                leading: Icons.perm_phone_msg,
                scaffoldKey: _scaffoldKey,
              )
            ];
          },
          body: SingleChildScrollView(
            padding: EdgeInsets.only(),
            child: Column(
              children: <Widget>[
                //1
                Container(
                  padding: EdgeInsets.only(
                    left: 25,
                    right: 25,
                    bottom: 10,
                    top: 15,
                  ),
                  child: Column(
                    children: <Widget>[
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Column(
                            children: <Widget>[
                              Container(
                                height: 30,
                                width: 30,
                                child: SvgPicture.asset(
                                    'assets/images/circle_194C80.svg'),
                              ),
                            ],
                          ),
                          Container(
                            padding: EdgeInsets.only(
                              left: 10,
                            ),
                            child: Column(
                              children: <Widget>[
                                Container(
                                  padding: EdgeInsets.only(
                                    bottom: 10,
                                    top: 5,
                                  ),
                                  width: MediaQuery.of(context).size.width - 90,
                                  child: Text(
                                    'Protecția Consumatorului',
                                    style: TextStyle(
                                      color: Color(
                                          0xFF32325D), //Color(0xFFFFFFFF),
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
                                      fontSize: 15,
                                    ),
                                  ),
                                ),
                                //2.2-1
                                Container(
                                  width: MediaQuery.of(context).size.width - 90,
                                  child: Text(
                                    '0230 520 172',
                                    style: TextStyle(
                                      fontSize: 15,
                                    ),
                                  ),
                                ),
                                //2.2-2
                                Container(
                                  width: MediaQuery.of(context).size.width - 90,
                                  child: Text(
                                    '0230 530 876',
                                    style: TextStyle(
                                      fontSize: 15,
                                    ),
                                  ),
                                ),
                                //2.2-3
                                Container(
                                  width: MediaQuery.of(context).size.width - 90,
                                  child: Text(
                                    'reclamatii.suceava@anpc.ro',
                                    style: TextStyle(
                                      fontSize: 15,
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
                        padding: EdgeInsets.only(
                          top: 10,
                        ),
                        width: MediaQuery.of(context).size.width - 35,
                        // ignore: deprecated_member_use
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
                              fontSize: 15,
                            ),
                          ),
                          onPressed: () {
                            UrlLauncher.launch("tel://0230520172");
                          },
                        ),
                      ),
                      //4
                      Container(
                        //width: MediaQuery.of(context).size.width - 80,
                        padding: EdgeInsets.only(top: 10),
                        child: new InkWell(
                          child: new Text(
                            'Trimite unui prieten',
                            style: TextStyle(
                              fontSize: 15,
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
                    top: 10,
                  ),
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
                                child: SvgPicture.asset(
                                    'assets/images/circle_194C80.svg'),
                              ),
                            ],
                          ),
                          Container(
                            padding: EdgeInsets.only(
                              left: 10,
                            ),
                            child: Column(
                              children: <Widget>[
                                Container(
                                  padding: EdgeInsets.only(
                                    bottom: 10,
                                    top: 5,
                                  ),
                                  width: MediaQuery.of(context).size.width - 90,
                                  child: Text(
                                    'Protecția Copilului',
                                    style: TextStyle(
                                      color: Color(
                                          0xFF32325D), //Color(0xFFFFFFFF),
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
                                    '0230 563 306',
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
                        padding: EdgeInsets.only(
                          top: 10,
                        ),
                        width: MediaQuery.of(context).size.width - 35,
                        // ignore: deprecated_member_use
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
                            UrlLauncher.launch("tel://0230563306");
                          },
                        ),
                      ),
                      //4
                      Container(
                        padding: EdgeInsets.only(
                          top: 10,
                        ),
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
                  padding: EdgeInsets.symmetric(horizontal: 15.0),
                  child: Container(
                    height: 1.0,
                    color: Color.fromRGBO(0, 0, 0, 0.1),
                  ),
                ),
                //2
                Container(
                  padding: EdgeInsets.only(
                    left: 25,
                    right: 25,
                    bottom: 10,
                    top: 10,
                  ),
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
                                child: SvgPicture.asset(
                                    'assets/images/circle_194C80.svg'),
                              ),
                            ],
                          ),
                          Container(
                            padding: EdgeInsets.only(
                              left: 10,
                            ),
                            child: Column(
                              children: <Widget>[
                                Container(
                                  padding: EdgeInsets.only(
                                    bottom: 10,
                                    top: 5,
                                  ),
                                  width: MediaQuery.of(context).size.width - 90,
                                  child: Text(
                                    'Poliția Locală',
                                    style: TextStyle(
                                      color: Color(
                                          0xFF32325D), //Color(0xFFFFFFFF),
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
                        padding: EdgeInsets.only(
                          top: 10,
                        ),
                        width: MediaQuery.of(context).size.width - 35,
                        // ignore: deprecated_member_use
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
                        padding: EdgeInsets.only(
                          top: 10,
                        ),
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
                    top: 10,
                  ),
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
                                child: SvgPicture.asset(
                                    'assets/images/circle_194C80.svg'),
                              ),
                            ],
                          ),
                          Container(
                            padding: EdgeInsets.only(
                              left: 10,
                            ),
                            child: Column(
                              children: <Widget>[
                                Container(
                                  padding: EdgeInsets.only(
                                    bottom: 10,
                                    top: 5,
                                  ),
                                  width: MediaQuery.of(context).size.width - 90,
                                  child: Text(
                                    'Protecția Animalelor',
                                    style: TextStyle(
                                      color: Color(
                                          0xFF32325D), //Color(0xFFFFFFFF),
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
                                    '0740 287 614',
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
                        padding: EdgeInsets.only(
                          top: 10,
                        ),
                        width: MediaQuery.of(context).size.width - 35,
                        // ignore: deprecated_member_use
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
                            UrlLauncher.launch("tel://0740287614");
                          },
                        ),
                      ),
                      //4
                      Container(
                        padding: EdgeInsets.only(
                          top: 10,
                        ),
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
                  padding: EdgeInsets.symmetric(horizontal: 15.0),
                  child: Container(
                    height: 1.0,
                    color: Color.fromRGBO(0, 0, 0, 0.1),
                  ),
                ),
                //3
                Container(
                  padding: EdgeInsets.only(
                    left: 25,
                    right: 25,
                    bottom: 10,
                    top: 10,
                  ),
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
                                child: SvgPicture.asset(
                                    'assets/images/circle_194C80.svg'),
                              ),
                            ],
                          ),
                          Container(
                            padding: EdgeInsets.only(
                              left: 10,
                            ),
                            child: Column(
                              children: <Widget>[
                                Container(
                                  padding: EdgeInsets.only(
                                    bottom: 10,
                                    top: 5,
                                  ),
                                  width: MediaQuery.of(context).size.width - 90,
                                  child: Text(
                                    'Protecția Mediului',
                                    style: TextStyle(
                                      color: Color(
                                          0xFF32325D), //Color(0xFFFFFFFF),
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
                                    '0230 514 056',
                                    style: TextStyle(
                                      fontSize: 15.0,
                                    ),
                                  ),
                                ),
                                //2.2-2
                                //2.2-3
                                Container(
                                  width: MediaQuery.of(context).size.width - 90,
                                  child: Text(
                                    'office@apmsv.anpm.ro',
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
                        padding: EdgeInsets.only(
                          top: 10,
                        ),
                        width: MediaQuery.of(context).size.width - 35,
                        // ignore: deprecated_member_use
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
                            UrlLauncher.launch("tel://0230514056");
                          },
                        ),
                      ),
                      //4
                      Container(
                        padding: EdgeInsets.only(
                          top: 10,
                        ),
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
                    top: 10,
                  ),
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
                                child: SvgPicture.asset(
                                    'assets/images/circle_194C80.svg'),
                              ),
                            ],
                          ),
                          Container(
                            padding: EdgeInsets.only(
                              left: 10,
                            ),
                            child: Column(
                              children: <Widget>[
                                Container(
                                  padding: EdgeInsets.only(
                                    bottom: 10,
                                    top: 5,
                                  ),
                                  width: MediaQuery.of(context).size.width - 90,
                                  child: Text(
                                    'Spitalul Municipal',
                                    style: TextStyle(
                                      color: Color(
                                          0xFF32325D), //Color(0xFFFFFFFF),
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
                        padding: EdgeInsets.only(
                          top: 10,
                        ),
                        width: MediaQuery.of(context).size.width - 35,
                        // ignore: deprecated_member_use
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
                        padding: EdgeInsets.only(
                          top: 10,
                        ),
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
                  padding: EdgeInsets.symmetric(horizontal: 15.0),
                  child: Container(
                    height: 1.0,
                    color: Color.fromRGBO(0, 0, 0, 0.1),
                  ),
                ),
                //4
                Container(
                  padding: EdgeInsets.only(
                    left: 25,
                    right: 25,
                    bottom: 10,
                    top: 10,
                  ),
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
                                child: SvgPicture.asset(
                                    'assets/images/circle_194C80.svg'),
                              ),
                            ],
                          ),
                          Container(
                            padding: EdgeInsets.only(
                              left: 10,
                            ),
                            child: Column(
                              children: <Widget>[
                                Container(
                                  padding: EdgeInsets.only(
                                    bottom: 10,
                                    top: 5,
                                  ),
                                  width: MediaQuery.of(context).size.width - 90,
                                  child: Text(
                                    'ACET',
                                    style: TextStyle(
                                      color: Color(
                                          0xFF32325D), //Color(0xFFFFFFFF),
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
                                    '0230 560 530',
                                    style: TextStyle(
                                      fontSize: 15.0,
                                    ),
                                  ),
                                ),
                                //2.2-2
                                //2.2-3
                                Container(
                                  width: MediaQuery.of(context).size.width - 90,
                                  child: Text(
                                    'agentia.radauti@acetsv.ro',
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
                        padding: EdgeInsets.only(
                          top: 10,
                        ),
                        width: MediaQuery.of(context).size.width - 35,
                        // ignore: deprecated_member_use
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
                            UrlLauncher.launch("tel://0230560530");
                          },
                        ),
                      ),
                      //4
                      Container(
                        padding: EdgeInsets.only(
                          top: 10,
                        ),
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
                    top: 10,
                  ),
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
                                child: SvgPicture.asset(
                                    'assets/images/circle_194C80.svg'),
                              ),
                            ],
                          ),
                          Container(
                            padding: EdgeInsets.only(
                              left: 10,
                            ),
                            child: Column(
                              children: <Widget>[
                                Container(
                                  padding: EdgeInsets.only(
                                    bottom: 10,
                                    top: 5,
                                  ),
                                  width: MediaQuery.of(context).size.width - 90,
                                  child: Text(
                                    'Primărie',
                                    style: TextStyle(
                                      color: Color(
                                          0xFF32325D), //Color(0xFFFFFFFF),
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
                        padding: EdgeInsets.only(
                          top: 10,
                        ),
                        width: MediaQuery.of(context).size.width - 35,
                        // ignore: deprecated_member_use
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
                        padding: EdgeInsets.only(
                          top: 10,
                        ),
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
                  padding: EdgeInsets.symmetric(horizontal: 15.0),
                  child: Container(
                    height: 1.0,
                    color: Color.fromRGBO(0, 0, 0, 0.1),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}

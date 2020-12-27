import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutterapperadauti/widgets/src/appBarModel.dart';
import 'package:flutterapperadauti/widgets/src/nav_drawer.dart';

class HomePageNumbers extends StatelessWidget {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBarModel().loadAppBar(
          context, 'Numere utile', Icons.perm_phone_msg, _scaffoldKey),
      drawer: NavDrawer(),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(
                left: 25,
                right: 25,
                bottom: 10,
                top: 15,
              ),
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
                              child: SvgPicture.asset(
                                  'assets/images/circle_FFDECC.svg'),
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width - 120,
                              padding: EdgeInsets.only(
                                left: 10,
                              ),
                              child: Text(
                                'Instituții publice',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                              ),
                            ),
                          ],
                        ),
                        Container(
                          padding: EdgeInsets.only(
                            top: 10,
                          ),
                          width: MediaQuery.of(context).size.width - 80,
                          child: Text(
                            'Date de contact pentru principalele instituții de protecție civilă '
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
                      child: Icon(
                        Icons.keyboard_arrow_right,
                        color: Color(0xFF979797),
                      ),
                    ),
                  ],
                ),
                onTap: () {
                  Navigator.pushNamed(context, '/publicInstitutions');
                },
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
                              child: SvgPicture.asset(
                                  'assets/images/circle_69E781.svg'),
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width - 120,
                              padding: EdgeInsets.only(
                                left: 10,
                              ),
                              child: Text(
                                'Deranjamente',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                              ),
                            ),
                          ],
                        ),
                        Container(
                          padding: EdgeInsets.only(
                            top: 10,
                          ),
                          width: MediaQuery.of(context).size.width - 80,
                          child: Text(
                            'Date de contact pentru informații sau reclamații '
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
                      child: Icon(
                        Icons.keyboard_arrow_right,
                        color: Color(0xFF979797),
                      ),
                    ),
                  ],
                ),
                onTap: () {
                  Navigator.pushNamed(context, '/miscellaneous');
                },
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
                              child: SvgPicture.asset(
                                  'assets/images/circle_194C80.svg'),
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width - 120,
                              padding: EdgeInsets.only(
                                left: 10,
                              ),
                              child: Text(
                                'Autorități locale',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                              ),
                            ),
                          ],
                        ),
                        Container(
                          padding: EdgeInsets.only(
                            top: 10,
                          ),
                          width: MediaQuery.of(context).size.width - 80,
                          child: Text(
                            'Date de contact pentru principalele autorități '
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
                      child: Icon(
                        Icons.keyboard_arrow_right,
                        color: Color(0xFF979797),
                      ),
                    ),
                  ],
                ),
                onTap: () {
                  Navigator.pushNamed(context, '/localAuthorities');
                },
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
                              child: SvgPicture.asset(
                                  'assets/images/circle_EB7D16.svg'),
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width - 120,
                              padding: EdgeInsets.only(
                                left: 10,
                              ),
                              child: Text(
                                'Tehnicieni și alți specialiști',
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
                          padding: EdgeInsets.only(
                            top: 10,
                          ),
                          width: MediaQuery.of(context).size.width - 80,
                          child: Text(
                            'În curând',
                            overflow: TextOverflow.ellipsis,
                            maxLines: 5,
                            style: TextStyle(
                              color:
                                  Color(0xFFC4C4C4), //color: Color(0xFF38A49C),
                              fontSize: 15,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Container(
                      child: Icon(
                        Icons.keyboard_arrow_right,
                        color: Color(0xFF979797),
                      ),
                    ),
                  ],
                ),
                onTap: null,
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
    );
  }
}

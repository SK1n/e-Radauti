import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutterapperadauti/usefull_numbers/public_institutions.dart';

class HomePageNumbers extends StatelessWidget {
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
              child: Column(
                children: <Widget>[
                  GestureDetector(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Container(
                          height: 80,
                          width: 80,
                          child: FlatButton(
                            child: SvgPicture.asset('assets/images/circle_FFDECC.svg'),
                            onPressed: null,
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Container(
                              child: Text('Numere de urgenta',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width - 80,
                              child: Text('Lorem ipsum dolor sit amet dum pendebat morsum col.',
                                overflow: TextOverflow.ellipsis,
                                maxLines: 5,
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                    onTap: null,
                  ),
                  Padding(
                    padding:EdgeInsets.symmetric(horizontal:10.0),
                    child:Container(
                      height:1.0,
                      color:Color.fromRGBO(0, 0, 0, 0.1),),),
                  GestureDetector(
                    child: Row(
                      children: <Widget>[
                        Container(
                          height: 80,
                          width: 80,
                          child: FlatButton(
                            child: SvgPicture.asset('assets/images/circle_69E781.svg'),
                            onPressed: null,
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Container(
                              child: Text('Deranjamente',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width - 80,
                              child: Text('Lorem ipsum dolor sit amet dum pendebat morsum col.',
                                overflow: TextOverflow.ellipsis,
                                maxLines: 5,
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                    onTap: null,
                  ),
                  Padding(
                    padding:EdgeInsets.symmetric(horizontal:10.0),
                    child:Container(
                      height:1.0,
                      color:Color.fromRGBO(0, 0, 0, 0.1),),
                  ),
                  GestureDetector(
                    child: Row(
                      children: <Widget>[
                        Container(
                          height: 80,
                          width: 80,
                          child: FlatButton(
                            child: SvgPicture.asset('assets/images/circle_194C80.svg'),
                            onPressed: null,
                          ),
                        ),
                        Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Container(
                                child: Text('Institutii publice',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              Container(
                                width: MediaQuery.of(context).size.width - 80,
                                child: Text('Lorem ipsum dolor sit amet dum pendebat morsum col.',
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 5,
                                ),
                              )
                            ],
                          ),
                      ],
                    ),
                    onTap: () {Navigator.push(context, MaterialPageRoute(builder: (context) => PublicInstitutions()),);},
                  ),
                  Padding(
                    padding:EdgeInsets.symmetric(horizontal:10.0),
                    child:Container(
                      height:1.0,
                      color:Color.fromRGBO(0, 0, 0, 0.1),),),
                  GestureDetector(
                    child: Row(
                      children: <Widget>[
                        Container(
                          height: 80,
                          width: 80,
                          child: FlatButton(
                            child: SvgPicture.asset('assets/images/circle_EB7D16.svg'),
                            onPressed: null,
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Container(
                              child: Text('Tehnicieni si alti specialisti',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width - 80,
                              child: Text('Lorem ipsum dolor sit amet dum pendebat morsum col.',
                                overflow: TextOverflow.ellipsis,
                                maxLines: 5,
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                    onTap: null,
                  ),
                  Padding(
                    padding:EdgeInsets.symmetric(horizontal:10.0),
                    child:Container(
                      height:1.0,
                      color:Color.fromRGBO(0, 0, 0, 0.1),),),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
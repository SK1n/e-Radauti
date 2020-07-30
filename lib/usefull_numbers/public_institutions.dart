import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:url_launcher/url_launcher.dart' as UrlLauncher;


class PublicInstitutions extends StatelessWidget {
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
        padding: EdgeInsets.only(top:20),
        child: Column(
          children: <Widget>[
            Row(
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
                      width: MediaQuery.of(context).size.width - 80,
                      child: Text(
                        'Registratura primarie',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width - 80,
                      child: Text(
                        'Contact',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ),
                    Row(
                      children: <Widget>[
                        Container(
                            child: FlatButton(
                              color: Colors.blue,
                              textColor: Colors.white,
                              disabledColor: Colors.grey,
                              disabledTextColor: Colors.black,
                              splashColor: Colors.blueAccent,
                              onPressed: () {
                                UrlLauncher.launch("tel://0230256895");
                              },
                              child: Text(
                                "0230 256 895",
                                style: TextStyle(fontSize: 10.0),
                              ),
                            )
                        ),
                        Container(
                            child: FlatButton(
                              color: Colors.orange,
                              textColor: Colors.white,
                              disabledColor: Colors.grey,
                              disabledTextColor: Colors.black,
                              splashColor: Colors.orangeAccent,
                              onPressed: () {
                                UrlLauncher.launch("tel://0230256895");
                              },
                              child: Text(
                                "0230 256 895",
                                style: TextStyle(fontSize: 10.0),
                              ),
                            )
                        ),
                        Container(
                            child: FlatButton(
                              color: Colors.deepOrange,
                              textColor: Colors.white,
                              disabledColor: Colors.grey,
                              disabledTextColor: Colors.black,
                              splashColor: Colors.deepOrangeAccent,
                              onPressed: () {
                                UrlLauncher.launch("tel://0230256895");
                              },
                              child: Text(
                                "0230 256 895",
                                style: TextStyle(fontSize: 10.0),
                              ),
                            )
                        ),
                      ],
                    ),
                    Container(
                      child: FlatButton(
                        color: Colors.green,
                        splashColor: Colors.greenAccent,
                        textColor: Colors.white,
                        disabledColor: Colors.grey,
                        disabledTextColor: Colors.black,
                        child: Text(
                          'registratura@primarie.ro'
                        ),
                        onPressed: () {
                          UrlLauncher.launch("mailto:registratura@primarie.ro");
                        },
                      ),
                    )
                  ],
                )
              ],
            ),
            Padding(
              padding:EdgeInsets.symmetric(horizontal:10.0),
              child:Container(
                height:1.0,
                color:Color.fromRGBO(0, 0, 0, 0.1),),),///The divider between items
            Padding(
              padding: EdgeInsets.only(top:10),
            ), /// Some space between items
            Row(
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
                      width: MediaQuery.of(context).size.width - 80,
                      child: Text(
                        'Registratura primarie',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width - 80,
                      child: Text(
                        'Contact',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ),
                    Row(
                      children: <Widget>[
                        Container(
                            child: FlatButton(
                              color: Colors.blue,
                              textColor: Colors.white,
                              disabledColor: Colors.grey,
                              disabledTextColor: Colors.black,
                              splashColor: Colors.blueAccent,
                              onPressed: () {
                                UrlLauncher.launch("tel://0230256895");
                              },
                              child: Text(
                                "0230 256 895",
                                style: TextStyle(fontSize: 10.0),
                              ),
                            )
                        ),
                        Container(
                            child: FlatButton(
                              color: Colors.orange,
                              textColor: Colors.white,
                              disabledColor: Colors.grey,
                              disabledTextColor: Colors.black,
                              splashColor: Colors.orangeAccent,
                              onPressed: () {
                                UrlLauncher.launch("tel://0230256895");
                              },
                              child: Text(
                                "0230 256 895",
                                style: TextStyle(fontSize: 10.0),
                              ),
                            )
                        ),
                        Container(
                            child: FlatButton(
                              color: Colors.deepOrange,
                              textColor: Colors.white,
                              disabledColor: Colors.grey,
                              disabledTextColor: Colors.black,
                              splashColor: Colors.deepOrangeAccent,
                              onPressed: () {
                                UrlLauncher.launch("tel://0230256895");
                              },
                              child: Text(
                                "0230 256 895",
                                style: TextStyle(fontSize: 10.0),
                              ),
                            )
                        ),
                      ],
                    ),
                    Container(
                      child: FlatButton(
                        color: Colors.green,
                        splashColor: Colors.greenAccent,
                        textColor: Colors.white,
                        disabledColor: Colors.grey,
                        disabledTextColor: Colors.black,
                        child: Text(
                            'registratura@primarie.ro'
                        ),
                        onPressed: () {
                          UrlLauncher.launch("mailto:registratura@primarie.ro");
                        },
                      ),
                    )
                  ],
                )
              ],
            ),
            Padding(
              padding:EdgeInsets.symmetric(horizontal:10.0),
              child:Container(
                height:1.0,
                color:Color.fromRGBO(0, 0, 0, 0.1),),),
          ],
        ),
      )
    );
  }
}
import 'package:flutter/material.dart';

import 'package:flutterapperadauti/events/ui/tabView/tabPage.dart';
import 'package:flutterapperadauti/menu_page.dart';
import 'package:expandable/expandable.dart';

class EventsMain extends StatelessWidget {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      drawer: NavDrawer2(),
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
            margin: EdgeInsets.only(top: 0.0, right: 0.0),
            // EdgeInsets.only(top: 20.0, right: 10.0),
            child: IconButton(
              icon: Icon(Icons.menu,
                size: 24,
                color: Colors.black,), //Colors.white
              onPressed: () =>
                  _scaffoldKey.currentState
                      .openDrawer(), //_scaffoldKey.currentState.openDrawer(),
            ),
          ),
        ],
      ),
      body: ExpandableTheme(
        data:
        const ExpandableThemeData(
          iconColor: Color(0xAA38A49C), //Colors.blue
          useInkWell: true,
        ),
        child: TabDemo(scaffoldState: _scaffoldKey,),
      ),
    );
  }
}
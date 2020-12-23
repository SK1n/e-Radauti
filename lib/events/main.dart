import 'package:flutter/material.dart';
import 'package:flutterapperadauti/appBarModel.dart';

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
      appBar: AppBarModel().loadAppBar(
          context, 'Evenimente', Icons.calendar_today, _scaffoldKey),
      body: ExpandableTheme(
        data: const ExpandableThemeData(
          iconColor: Color(0xAA38A49C), //Colors.blue
          useInkWell: true,
        ),
        child: TabDemo(),
      ),
    );
  }
}

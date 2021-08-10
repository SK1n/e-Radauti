import 'package:flutter/material.dart';

import 'package:flutterapperadauti/events/ui/tabView/tabPage.dart';
import 'package:flutterapperadauti/widgets/src/appBarModelNew.dart';
import 'package:flutterapperadauti/widgets/src/nav_drawer.dart';
import 'package:expandable/expandable.dart';

class EventsMain extends StatelessWidget {
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
              content: 'Evenimente',
              leading: Icons.calendar_today,
              scaffoldKey: _scaffoldKey,
            ),
          ];
        },
        body: ExpandableTheme(
          data: const ExpandableThemeData(
            iconColor: Color(0xAA38A49C),
            useInkWell: true,
          ),
          child: TabDemo(
            scaffoldState: _scaffoldKey,
          ),
        ),
      ),
    );
  }
}

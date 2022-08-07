import 'package:flutter/material.dart';
import 'package:flutterapperadauti/widgets/src/appBarModelNew.dart';
import 'package:flutterapperadauti/widgets/src/nav_drawer.dart';
import 'package:flutterapperadauti/air_quality/air_quality_tab.dart';

class AirQualityMain extends StatelessWidget {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        key: _scaffoldKey,
        drawer: NavDrawer(),
        appBar: PreferredSize(
            child: AppBarUi(
              scaffoldKey: _scaffoldKey,
              leading: Icons.bubble_chart,
              content: 'Calitatea aerului',
            ),
            preferredSize: Size(MediaQuery.of(context).size.width, 50)),
        body: AirQualityTab(),
      ),
    );
  }
}

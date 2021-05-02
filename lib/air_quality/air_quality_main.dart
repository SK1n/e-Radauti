import 'package:flutter/material.dart';
import 'package:flutterapperadauti/widgets/src/nav_drawer.dart';
import 'package:flutterapperadauti/widgets/src/appBarModel.dart';
import 'package:flutterapperadauti/air_quality/air_quality_tab.dart';

class AirQualityMain extends StatelessWidget{
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        key: _scaffoldKey,
        drawer: NavDrawer(),
        appBar: AppBarModel().loadAppBar(context, 'Calitatea aerului', Icons.bubble_chart, _scaffoldKey),
        body: TabDemo(),
      ),
    );
  }
}
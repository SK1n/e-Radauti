import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterapperadauti/widgets/src/appBarModel.dart';
import 'package:flutterapperadauti/widgets/src/nav_drawer.dart';
import 'package:timeline_tile/timeline_tile.dart';

class TimelineRoute extends StatefulWidget {
  final String slug;
  TimelineRoute({Key key, @required this.slug}) : super(key: key);

  @override
  _TimelineRouteState createState() => _TimelineRouteState();
}

class _TimelineRouteState extends State<TimelineRoute> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBarModel()
          .loadAppBar(context, '${widget.slug}', Icons.train, _scaffoldKey),
      drawer: NavDrawer(),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(10),
        child: Column(
          children: [
            TimelineTile(
              alignment: TimelineAlign.manual,
              lineXY: 0.2,
              isFirst: true,
              endChild: Container(
                constraints: BoxConstraints(minHeight: 120),
                child: Text('Prima gara!'),
              ),
              startChild: Container(
                  alignment: Alignment.centerRight, child: Text('10:00')),
            ),
            TimelineTile(
              alignment: TimelineAlign.manual,
              lineXY: 0.2,
              isLast: true,
              startChild: Container(
                child: Text('12:00'),
              ),
              endChild: Container(
                child: Text('Ultima gara!'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

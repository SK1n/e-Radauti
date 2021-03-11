import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterapperadauti/widgets/src/appBarModel.dart';
import 'package:flutterapperadauti/widgets/src/nav_drawer.dart';
import 'package:timeline_tile/timeline_tile.dart';

class TimelineRoute extends StatefulWidget {
  final String title;
  final List<String> trainRoute;
  final List<String> timeTable;
  TimelineRoute(
      {Key key,
      @required this.title,
      @required this.trainRoute,
      @required this.timeTable})
      : super(key: key);

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
            .loadAppBar(context, '${widget.title}', Icons.train, _scaffoldKey),
        drawer: NavDrawer(),
        body: Card(
          margin: EdgeInsets.all(10),
          shadowColor: Colors.grey,
          elevation: 5,
          child: ListView.builder(
            itemCount: widget.trainRoute.length,
            itemBuilder: (BuildContext context, int index) {
              if (index == 0) {
                return TimelineTile(
                  indicatorStyle: IndicatorStyle(
                    width: 40,
                    color: Colors.blueAccent,
                    iconStyle: IconStyle(
                      iconData: Icons.train_outlined,
                      color: Colors.white,
                    ),
                  ),
                  alignment: TimelineAlign.manual,
                  lineXY: 0.3,
                  isFirst: true,
                  startChild: Container(
                    alignment: Alignment.center,
                    child: Text('${widget.timeTable[index]}'),
                  ),
                  endChild: Container(
                    padding: EdgeInsets.only(left: 10),
                    alignment: Alignment.centerLeft,
                    constraints: const BoxConstraints(minHeight: 100),
                    child: Text(
                      '${widget.trainRoute[index]}',
                      style: TextStyle(fontSize: 30),
                    ),
                  ),
                );
              }
              if (index + 1 == widget.timeTable.length) {
                return TimelineTile(
                  indicatorStyle: IndicatorStyle(
                    width: 40,
                    color: Colors.orangeAccent,
                    iconStyle: IconStyle(
                      iconData: Icons.train_outlined,
                      color: Colors.white,
                    ),
                  ),
                  alignment: TimelineAlign.manual,
                  lineXY: 0.3,
                  isLast: true,
                  startChild: Container(
                    alignment: Alignment.center,
                    child: Text('${widget.timeTable[index]}'),
                  ),
                  endChild: Container(
                    padding: EdgeInsets.only(left: 10),
                    alignment: Alignment.centerLeft,
                    constraints: const BoxConstraints(minHeight: 100),
                    child: Text(
                      '${widget.trainRoute[index]}',
                      style: TextStyle(fontSize: 30),
                    ),
                  ),
                );
              }
              return TimelineTile(
                indicatorStyle: IndicatorStyle(
                  width: 40,
                  color: Colors.greenAccent,
                  iconStyle: IconStyle(
                    iconData: Icons.train_outlined,
                    color: Colors.white,
                  ),
                ),
                alignment: TimelineAlign.manual,
                lineXY: 0.3,
                startChild: Container(
                  alignment: Alignment.center,
                  child: Text('${widget.timeTable[index]}'),
                ),
                endChild: Container(
                  padding: EdgeInsets.only(left: 10),
                  alignment: Alignment.centerLeft,
                  constraints: const BoxConstraints(minHeight: 100),
                  child: Text('${widget.trainRoute[index]}'),
                ),
              );
            },
          ),
        ));
  }
}
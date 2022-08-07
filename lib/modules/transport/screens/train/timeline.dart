import 'package:flutter/material.dart';
import 'package:flutterapperadauti/widgets/src/appBarModelNew.dart';
import 'package:flutterapperadauti/widgets/src/nav_drawer.dart';
import 'package:get/get.dart';
import 'package:timeline_tile/timeline_tile.dart';

class TimelineRoute extends StatelessWidget {
  TimelineRoute({Key? key}) : super(key: key);
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    var arguments = Get.arguments;
    return Scaffold(
      key: _scaffoldKey,
      drawer: NavDrawer(),
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) {
          return [
            AppBarUiSliver(
              content: '${arguments[0]}',
              leading: Icons.train,
              scaffoldKey: _scaffoldKey,
            )
          ];
        },
        body: ListView.builder(
          itemCount: arguments[1].length,
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
                  child: Text('${arguments[2][index]}'),
                ),
                endChild: Container(
                  padding: EdgeInsets.only(left: 10),
                  alignment: Alignment.centerLeft,
                  constraints: const BoxConstraints(minHeight: 100),
                  child: Text(
                    '${arguments[1][index]}',
                    style: TextStyle(fontSize: 30),
                  ),
                ),
              );
            }
            if (index + 1 == arguments[2].length) {
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
                  child: Text('${arguments[2][index]}'),
                ),
                endChild: Container(
                  padding: EdgeInsets.only(left: 10),
                  alignment: Alignment.centerLeft,
                  constraints: const BoxConstraints(minHeight: 100),
                  child: Text(
                    '${arguments[1][index]}',
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
                child: Text('${arguments[2][index]}'),
              ),
              endChild: Container(
                padding: EdgeInsets.only(left: 10),
                alignment: Alignment.centerLeft,
                constraints: const BoxConstraints(minHeight: 100),
                child: Text('${arguments[1][index]}'),
              ),
            );
          },
        ),
      ),
    );
  }
}

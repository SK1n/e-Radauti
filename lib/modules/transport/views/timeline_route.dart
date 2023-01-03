import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterapperadauti/utils/const.dart';
import 'package:flutterapperadauti/utils/shared_widgets/app_bar_widget.dart';
import 'package:flutterapperadauti/utils/shared_widgets/nav_drawer.dart';
import 'package:get/get.dart';
import 'package:timeline_tile/timeline_tile.dart';

class TimelineRoute extends StatelessWidget {
  const TimelineRoute({super.key});
  @override
  Widget build(BuildContext context) {
    var arguments = Get.arguments;
    return CupertinoPageScaffold(
      child: CustomScrollView(
        slivers: [
          AppBarWidget(
            content: '${arguments[0]}',
            leading: Icons.train,
          ),
          SliverPadding(
            padding: const EdgeInsets.only(
              left: leftMargin,
              right: rightMargin,
            ),
            sliver: SliverToBoxAdapter(
              child: ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
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
                        padding: const EdgeInsets.only(left: 10),
                        alignment: Alignment.centerLeft,
                        constraints: const BoxConstraints(minHeight: 100),
                        child: Text(
                          '${arguments[1][index]}',
                          style: const TextStyle(fontSize: 30),
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
                        padding: const EdgeInsets.only(left: 10),
                        alignment: Alignment.centerLeft,
                        constraints: const BoxConstraints(minHeight: 100),
                        child: Text(
                          '${arguments[1][index]}',
                          style: const TextStyle(fontSize: 30),
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
                      padding: const EdgeInsets.only(left: 10),
                      alignment: Alignment.centerLeft,
                      constraints: const BoxConstraints(minHeight: 100),
                      child: Text('${arguments[1][index]}'),
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}

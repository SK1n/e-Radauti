import 'package:flutter/material.dart';
import 'package:flutterapperadauti/modules/events/events_new/events_main.dart';
import 'package:flutterapperadauti/modules/events/events_old/events_old_main.dart';
import 'package:flutterapperadauti/widgets/src/appBarModelNew.dart';
import 'package:flutterapperadauti/widgets/src/nav_drawer.dart';

class MainEventsScreen extends StatelessWidget {
  const MainEventsScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
    return DefaultTabController(
      length: 2,
      child: Scaffold(
          key: _scaffoldKey,
          appBar: PreferredSize(
            child: AppBarUi(
              pinned: true,
              content: 'Evenimente',
              leading: Icons.calendar_today,
              scaffoldKey: _scaffoldKey,
              bottom: TabBar(
                indicatorWeight: 3.0,
                indicatorColor: Colors.pinkAccent,
                tabs: [
                  Tab(
                    text: 'Noi',
                  ),
                  Tab(
                    text: 'Trecute',
                  )
                ],
              ),
            ),
            preferredSize: Size(MediaQuery.of(context).size.width, 100),
          ),
          drawer: NavDrawer(),
          body: TabBarView(
            children: [
              NewEventsScreen(),
              OldEventsScreen(),
            ],
          )),
    );
  }
}

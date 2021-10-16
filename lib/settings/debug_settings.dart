import 'package:flutter/material.dart';
import 'package:flutterapperadauti/widgets/src/appBarModelNew.dart';
import 'package:flutterapperadauti/widgets/src/nav_drawer.dart';
import 'package:is_first_run/is_first_run.dart';

class DebugSettings extends StatelessWidget {
  const DebugSettings({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

    return Scaffold(
      key: _scaffoldKey,
      appBar: PreferredSize(
          child: AppBarUi(
            content: 'Debug',
            leading: Icons.bug_report_outlined,
            scaffoldKey: _scaffoldKey,
          ),
          preferredSize: Size(MediaQuery.of(context).size.width, 50)),
      drawer: NavDrawer(),
      body: Column(
        children: [
          TextButton(
            child: Text('Show the intro views(first run)'),
            onPressed: () {
              IsFirstRun.reset();
            },
          ),
        ],
      ),
    );
  }
}

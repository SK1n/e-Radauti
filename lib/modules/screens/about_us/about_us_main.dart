import 'package:flutter/material.dart';
import 'package:flutterapperadauti/modules/screens/about_us/utils/tab_bar.dart';
import 'package:flutterapperadauti/widgets/src/appBarModelNew.dart';
import 'package:flutterapperadauti/widgets/src/nav_drawer.dart';

class AboutUsMain extends StatelessWidget {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        key: _scaffoldKey,
        drawer: NavDrawer(),
        body: NestedScrollView(
            headerSliverBuilder: (context, innerBoxIsScrolled) {
              return [
                AppBarUiSliver(
                  content: 'Despre Noi',
                  leading: Icons.add_box_outlined,
                  scaffoldKey: _scaffoldKey,
                )
              ];
            },
            body: TabDemo()),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutterapperadauti/usefull_pages/tab_bar_view/tab_bar.dart';
import 'package:flutterapperadauti/usefull_pages/usefull_pages_widget/widget_about_model.dart';
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
        floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
        floatingActionButton:
            WidgetAboutModel().widgetFloatingActionButton(context),
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

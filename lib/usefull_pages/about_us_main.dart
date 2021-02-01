import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterapperadauti/usefull_pages/tab_bar_view/tab_bar.dart';
import 'package:flutterapperadauti/usefull_pages/usefull_pages_widget/widget_about_model.dart';
import 'package:flutterapperadauti/widgets/src/nav_drawer.dart';
import 'package:flutterapperadauti/widgets/src/appBarModel.dart';

class AboutUsMain extends StatelessWidget {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        key: _scaffoldKey,
        drawer: NavDrawer(),
        appBar: AppBarModel().loadAppBar(
            context, 'Despre noi', Icons.add_box_outlined, _scaffoldKey),
        floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
        floatingActionButton: WidgetAboutModel().widgetFloatingActionButton(context),
        body: TabDemo(),
      ),
    );
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterapperadauti/usefull_pages/usefull_pages_widget/widget_partner_model.dart';
import 'package:flutterapperadauti/widgets/src/appBarModelNew.dart';
import 'package:flutterapperadauti/widgets/src/nav_drawer.dart';

class Partner extends StatelessWidget {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      drawer: NavDrawer(),
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) {
          return [
            AppBarUiSliver(
              content: 'Parteneri',
              leading: Icons.add_box_outlined,
              scaffoldKey: _scaffoldKey,
            )
          ];
        },
        body: SingleChildScrollView(
          padding: EdgeInsets.only(top: 20),
          child: Column(
            children: <Widget>[
              WidgetPartnerModel().widgetItem(
                  "assets/images/fondul_pentru_democratie.png",
                  "Fondul pentru Democrație",
                  context),
              WidgetPartnerModel().widgetItem(
                  "assets/images/code_4_romania.png", "Code4Romania", context),
              WidgetPartnerModel().widgetItem(
                  "assets/images/hard_power_radauti.png",
                  "Hard Power Services Rădăuți",
                  context),
            ],
          ),
        ),
      ),
    );
  }
}

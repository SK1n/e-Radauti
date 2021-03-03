import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterapperadauti/widgets/src/appBarModel.dart';
import 'package:flutterapperadauti/widgets/src/nav_drawer.dart';
import 'package:flutterapperadauti/widgets/src/widget_subpage_row_button_model.dart';

class TownHallMain extends StatelessWidget {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBarModel().loadAppBar(
          context, 'Administrație locală', Icons.location_city, _scaffoldKey),
      drawer: NavDrawer(),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(bottom: 30.0, top: 10.0,),
              width: MediaQuery.of(context).size.width - 30,
              child: Image.asset("assets/images/primaria.jpg", fit: BoxFit.cover,),
            ),
            WidgetSubpageRowButtonModel().widgetItem("assets/images/circle_69E781.svg", context, "Conducere", "Informații despre primar, viceprimar și secretar.", Colors.black, Color(0xFF38A49C), WidgetSubpageRowButtonModel().functionOnTap(context, '/leaders')),
            WidgetSubpageRowButtonModel().widgetItem("assets/images/circle_194C80.svg", context, "Consiliul Local", "Consilierii locali. Contactează-ți reprezentantul!", Colors.black, Color(0xFF38A49C), WidgetSubpageRowButtonModel().functionOnTap(context, '/localCouncil')),
            WidgetSubpageRowButtonModel().widgetItem("assets/images/circle_FFDECC.svg", context, "Ședințe de Consiliu local", "Vizualizează live ședințele de consiliu local.", Colors.black, Color(0xFF38A49C), WidgetSubpageRowButtonModel().functionOnTap(context, '/councilMeetings')),
            WidgetSubpageRowButtonModel().widgetItem("assets/images/circle_EB7D16.svg", context, "Hotărâri de Consiliu Local", "Descoperă hotărârile de consiliu local.", Colors.black, Color(0xFF38A49C), WidgetSubpageRowButtonModel().functionOnTap(context, '/localLegislation')),
          ],
        ),
      ),
    );
  }
}

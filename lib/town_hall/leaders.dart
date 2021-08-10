import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterapperadauti/town_hall/town_hall_widget/widget_leaders_model.dart';
import 'package:flutterapperadauti/widgets/src/appBarModelNew.dart';
import 'package:flutterapperadauti/widgets/src/nav_drawer.dart';

class Leaders extends StatelessWidget {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      drawer: NavDrawer(),
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) {
          return [
            AppBarUiSliver(
              content: 'Administrație locală',
              leading: Icons.location_city,
              scaffoldKey: _scaffoldKey,
            )
          ];
        },
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              WidgetLeadersModel().widgetItem1(context),
              WidgetLeadersModel().widgetItem(
                  "assets/images/loghin.jpg",
                  context,
                  "Bogdan Loghin",
                  "Primar \nMunicipiul Rădăuți",
                  WidgetLeadersModel().functionOnPressed1(
                      "https://www.facebook.com/BogdanLoghinPNL/"),
                  WidgetLeadersModel()
                      .functionOnPressed2("mailto:primar@primariaradauti.ro"),
                  WidgetLeadersModel().functionOnTap(
                      'https://primariaradauti.ro/wp-content/uploads/2019/12/Loghin_Bogdan_Andrei..pdf'),
                  WidgetLeadersModel().functionOnTap(
                      'https://primariaradauti.ro/wp-content/uploads/2019/12/Loghin_Bogdan_Andrei.-1.pdf')),
              WidgetLeadersModel().widgetItem(
                  "assets/images/TereviciCezar.jpg",
                  context,
                  "Țarevici Cezar-Ciprian",
                  "Viceprimar \nMunicipiul Rădăuți",
                  WidgetLeadersModel().functionOnPressed1(
                      "https://www.facebook.com/ciprian.tarevici"),
                  null,
                  WidgetLeadersModel().functionOnTap(
                      'https://primariaradauti.ro/wp-content/uploads/2020/07/Tarevici-Cezar-Ciprian.pdf'),
                  WidgetLeadersModel().functionOnTap(
                      'https://primariaradauti.ro/wp-content/uploads/2020/07/Tarevici-Ciprian.pdf')),
              WidgetLeadersModel().widgetItem(
                  "assets/images/MarinicaSofroni.jpg",
                  context,
                  "Marinică Sofroni",
                  "Secretar \nMunicipiul Rădăuți",
                  WidgetLeadersModel().functionOnPressed1(
                      "https://www.facebook.com/sofroni.marinica"),
                  WidgetLeadersModel()
                      .functionOnPressed2("mailto:secretar@primariaradauti.ro"),
                  WidgetLeadersModel().functionOnTap(
                      'https://primariaradauti.ro/wp-content/uploads/2020/07/Sofroni-Marinica-2.pdf'),
                  WidgetLeadersModel().functionOnTap(
                      'https://primariaradauti.ro/wp-content/uploads/2020/07/Sofroni-Marinica-1-1.pdf')),
            ],
          ),
        ),
      ),
    );
  }
}

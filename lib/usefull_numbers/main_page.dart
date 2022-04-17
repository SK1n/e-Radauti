import 'package:flutter/material.dart';
import 'package:flutterapperadauti/widgets/src/appBarModelNew.dart';
import 'package:flutterapperadauti/widgets/src/nav_drawer.dart';
import 'package:flutterapperadauti/widgets/src/widget_subpage_row_button_model.dart';

class HomePageNumbers extends StatelessWidget {
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
              content: 'Numere utille',
              leading: Icons.perm_phone_msg,
              scaffoldKey: _scaffoldKey,
            )
          ];
        },
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              WidgetSubpageRowButtonModel().widgetItem(
                  'assets/images/circle_FFDECC.svg',
                  context,
                  'Instituții publice',
                  'Date de contact pentru principalele instituții de protecție civilă (a consumatorului, copilului, animalelor, mediului etc.)',
                  Colors.black,
                  Color(0xFF38A49C),
                  WidgetSubpageRowButtonModel()
                      .functionOnTap(context, '/publicInstitutions')),
              WidgetSubpageRowButtonModel().widgetItem(
                  'assets/images/circle_69E781.svg',
                  context,
                  'Deranjamente',
                  'Date de contact pentru informații sau reclamații privind serviciile de alimentare cu apă, canalizare sau servicii comunale',
                  Colors.black,
                  Color(0xFF38A49C),
                  WidgetSubpageRowButtonModel()
                      .functionOnTap(context, '/miscellaneous')),
              WidgetSubpageRowButtonModel().widgetItem(
                  'assets/images/circle_194C80.svg',
                  context,
                  'Autorități locale',
                  'Date de contact pentru principalele autorități publice locale (primărie, spital, poliție etc.)',
                  Colors.black,
                  Color(0xFF38A49C),
                  WidgetSubpageRowButtonModel()
                      .functionOnTap(context, '/localAuthorities')),
              WidgetSubpageRowButtonModel().widgetItem(
                  'assets/images/circle_EB7D16.svg',
                  context,
                  'Tehnicieni și alți specialiști',
                  'În curând',
                  Color(0xFF979797),
                  Color(0xFFC4C4C4),
                  null),
            ],
          ),
        ),
      ),
    );
  }
}

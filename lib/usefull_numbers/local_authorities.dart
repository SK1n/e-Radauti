import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterapperadauti/usefull_numbers/usefull_numbers_widget/widget_child_page_model.dart';
import 'package:flutterapperadauti/widgets/src/appBarModelNew.dart';
import 'package:flutterapperadauti/widgets/src/nav_drawer.dart';

class LocalAuthorities extends StatelessWidget {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _scaffoldKey,
        drawer: NavDrawer(),
        body: NestedScrollView(
          headerSliverBuilder: (context, innerBoxIsScrolled) {
            return [
              AppBarUi(
                content: 'Autorități locale',
                leading: Icons.perm_phone_msg,
                scaffoldKey: _scaffoldKey,
              )
            ];
          },
          body: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                WidgetChildPageModel().widgetItem(
                    'assets/images/circle_194C80.svg',
                    context,
                    'Poliția Locală',
                    ['0230 567 299'],
                    "tel://0230567299"),
                WidgetChildPageModel().widgetItem(
                    'assets/images/circle_194C80.svg',
                    context,
                    'Spitalul Municipal',
                    [
                      '0230 563 281',
                      '0230 564 067',
                      'info@spitalul-radauti.ro',
                      'spitalradauti@yahoo.com'
                    ],
                    "tel://0230563281"),
                WidgetChildPageModel().widgetItem(
                    'assets/images/circle_194C80.svg',
                    context,
                    'Primărie',
                    [
                      '0230 561 140',
                      'relatiipublice@primariaradauti.ro',
                      'secretariat@primariaradauti.ro'
                    ],
                    "tel://0230561140"),
              ],
            ),
          ),
        ));
  }
}

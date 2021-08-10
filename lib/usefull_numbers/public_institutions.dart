import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterapperadauti/usefull_numbers/usefull_numbers_widget/widget_child_page_model.dart';
import 'package:flutterapperadauti/widgets/src/appBarModelNew.dart';
import 'package:flutterapperadauti/widgets/src/nav_drawer.dart';

class PublicInstitutions extends StatelessWidget {
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
                content: 'Instituții publice',
                leading: Icons.perm_phone_msg,
                scaffoldKey: _scaffoldKey,
              )
            ];
          },
          body: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                WidgetChildPageModel().widgetItem(
                    'assets/images/circle_FFDECC.svg',
                    context,
                    'Protecția Consumatorului',
                    [
                      '0230 520 172',
                      '0230 530 876',
                      'reclamatii.suceava@anpc.ro'
                    ],
                    "tel://0230520172"),
                WidgetChildPageModel().widgetItem(
                    'assets/images/circle_FFDECC.svg',
                    context,
                    'Protecția Copilului',
                    ['0230 563 306'],
                    "tel://0230563306"),
                WidgetChildPageModel().widgetItem(
                    'assets/images/circle_FFDECC.svg',
                    context,
                    'Protecția Animalelor',
                    ['0740 287 614'],
                    "tel://0740287614"),
                WidgetChildPageModel().widgetItem(
                    'assets/images/circle_FFDECC.svg',
                    context,
                    'Protecția Mediului',
                    ['0230 514 056', 'office@apmsv.anpm.ro'],
                    "tel://0230514056"),
              ],
            ),
          ),
        ));
  }
}

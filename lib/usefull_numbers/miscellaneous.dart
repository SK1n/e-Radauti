import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterapperadauti/usefull_numbers/usefull_numbers_widget/widget_child_page_model.dart';
import 'package:flutterapperadauti/widgets/src/appBarModel.dart';
import 'package:flutterapperadauti/widgets/src/nav_drawer.dart';

class Miscellaneous extends StatelessWidget {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _scaffoldKey,
        appBar: AppBarModel().loadAppBar(
            context, 'Deranjamente', Icons.perm_phone_msg, _scaffoldKey),
        drawer: NavDrawer(),
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              WidgetChildPageModel().widgetItem('assets/images/circle_69E781.svg', context, 'Servicii Comunale', ['0230 563 495','office@serviciicomunale.ro'], "tel://0230563495"),
              WidgetChildPageModel().widgetItem('assets/images/circle_69E781.svg', context, 'ACET', ['0230 560 530','agentia.radauti@acetsv.ro'], "tel://0230560530"),
            ],
          ),
        )
    );
  }
}

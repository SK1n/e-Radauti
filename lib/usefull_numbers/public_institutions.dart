import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterapperadauti/usefull_numbers/usefull_numbers_widget/widget_child_page_model.dart';
import 'package:flutterapperadauti/widgets/src/appBarModel.dart';
import 'package:flutterapperadauti/widgets/src/nav_drawer.dart';

class PublicInstitutions extends StatelessWidget {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _scaffoldKey,
        appBar: AppBarModel().loadAppBar(
            context, 'Instituții publice', Icons.perm_phone_msg, _scaffoldKey),
        drawer: NavDrawer(),
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              WidgetChildPageModel().widgetItem('assets/images/circle_FFDECC.svg', context, 'Protecția Consumatorului', ['0230 520 172','0230 530 876','reclamatii.suceava@anpc.ro'], "tel://0230520172"),
              WidgetChildPageModel().widgetItem('assets/images/circle_FFDECC.svg', context, 'Protecția Copilului', ['0230 563 306'], "tel://0230563306"),
              WidgetChildPageModel().widgetItem('assets/images/circle_FFDECC.svg', context, 'Protecția Animalelor', ['0740 287 614'], "tel://0740287614"),
              WidgetChildPageModel().widgetItem('assets/images/circle_FFDECC.svg', context, 'Protecția Mediului', ['0230 514 056','office@apmsv.anpm.ro'], "tel://0230514056"),
            ],
          ),
        ));
  }
}

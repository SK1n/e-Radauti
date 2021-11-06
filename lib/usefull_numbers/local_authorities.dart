import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterapperadauti/usefull_numbers/models/numbers_model.dart';
import 'package:flutterapperadauti/usefull_numbers/usefull_numbers_widget/widget_child_page.dart';
import 'package:flutterapperadauti/widgets/src/appBarModelNew.dart';
import 'package:flutterapperadauti/widgets/src/loading_screen_ui.dart';
import 'package:flutterapperadauti/widgets/src/nav_drawer.dart';
import 'package:provider/provider.dart';

class LocalAuthorities extends StatelessWidget {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    FetchNumbersData data = Provider.of<FetchNumbersData>(context);
    return Scaffold(
        key: _scaffoldKey,
        drawer: NavDrawer(),
        body: NestedScrollView(
            headerSliverBuilder: (context, innerBoxIsScrolled) {
              return [
                AppBarUiSliver(
                  content: 'Autorități locale',
                  leading: Icons.perm_phone_msg,
                  scaffoldKey: _scaffoldKey,
                )
              ];
            },
            body: FutureBuilder(
              future: data.getDataFromFirebase('authorities'),
              builder: (BuildContext context, AsyncSnapshot snap) {
                if (snap.hasError) {
                  return Text('A intervenit o eroare');
                }
                if (snap.hasData) {
                  return ListView.builder(
                      itemCount: data.getLength(),
                      itemBuilder: (BuildContext context, int item) {
                        return UsefullNumbersWidget(
                          title: snap.data[item].title,
                          phone: snap.data[item].phone,
                          email: snap.data[item].email,
                        );
                      });
                } else {
                  return LoadingScreen();
                }
              },
            )));
  }
}

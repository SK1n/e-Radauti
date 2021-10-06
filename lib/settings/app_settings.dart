import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutterapperadauti/widgets/src/appBarModelNew.dart';
import 'package:flutterapperadauti/widgets/src/nav_drawer.dart';

class AppSettings extends StatelessWidget {
  const AppSettings({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

    return Scaffold(
      key: _scaffoldKey,
      appBar: PreferredSize(
        child: AppBarUi(
          scaffoldKey: _scaffoldKey,
          leading: Icons.settings,
          content: 'Setari',
        ),
        preferredSize: Size(MediaQuery.of(context).size.width, 50),
      ),
      drawer: NavDrawer(),
      body: Column(
        children: [
          Card(
            child: ListTile(
              onTap: () {
                Navigator.pushNamed(context, '/settings/notifications');
              },
              leading: Icon(Icons.notification_important),
              title: Text('Notificari'),
              trailing: Icon(
                Platform.isAndroid
                    ? Icons.arrow_forward
                    : Icons.arrow_forward_ios,
              ),
            ),
          )
        ],
      ),
    );
  }
}

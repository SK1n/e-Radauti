import 'dart:io';

import 'package:flutter/material.dart';
import 'package:fluttericon/font_awesome5_icons.dart';

class NavDrawer extends StatelessWidget {
  Widget addDrawerHeaderIcon() {
    return new Container(
      padding: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
      margin: const EdgeInsets.fromLTRB(15.0, 5.0, 0.0, 5.0),
      child: new Stack(
        alignment: AlignmentDirectional.center,
        children: <Widget>[
          new Image.asset(
            "assets/logo_images/app_logo.png",
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            child: addDrawerHeaderIcon(),
          ),
          generateListTile(context, Icons.photo_filter, 'Sesizează o problemă',
              '/noticeProblem'),
          generateListTile(context, Icons.location_city, 'Administrație locală',
              '/townHall'),
          generateListTile(
              context, Icons.calendar_today, 'Evenimente', '/events'),
          generateListTile(
              context, Icons.perm_phone_msg, 'Numere utile', '/numbers'),
          generateListTile(
              context, Icons.announcement, 'Anunțuri', '/announcement'),
          generateListTile(
              context, Icons.bubble_chart, 'Calitatea aerului', '/air'),
          generateListTile(context, Icons.train, 'Transport', '/transport'),
          generateListTile(context, FontAwesome5.hand_holding_heart,
              'Voluntariat', '/volunteer'),
          generateListTile(context, Icons.info, 'Despre aplicație', null),
        ],
      ),
    );
  }

  ListTile generateListTile(context, icon, title, following) {
    return ListTile(
      leading: Icon(
        icon,
        color: Color(0x55FB6340),
      ),
      title: Text(title),
      onTap: () {
        if (following != null) {
          Navigator.pushNamed(context, following);
        } else {
          if (Platform.isIOS) {
            showAboutDialog(
                context: context,
                applicationName: 'e-Radauti',
                applicationVersion: 'Version: 2.1.0 (4)',
                applicationIcon: Image.asset(
                  'assets/logo_images/app_logo_final.png',
                  width: 24,
                  height: 24,
                ));
          } else if (Platform.isAndroid) {
            showAboutDialog(
                context: context,
                applicationName: 'e-Radauti',
                applicationVersion: 'Version: 2.5.0 (45)',
                applicationIcon: Image.asset(
                  'assets/logo_images/app_logo_final.png',
                  width: 24,
                  height: 24,
                ));
          }
        }
      },
    );
  }
}

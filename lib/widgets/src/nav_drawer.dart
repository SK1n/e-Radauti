import 'dart:io';

import 'package:flutter/material.dart';
import 'package:fluttericon/font_awesome5_icons.dart';
import 'package:flutter/services.dart';
import 'package:flutterapperadauti/state/fcm_state.dart';
import 'package:provider/provider.dart';

class NavDrawer extends StatelessWidget {
  final SnackBar snackBar = new SnackBar(content: Text('Copiat in clipboard!'));
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
    FCMState provider = Provider.of<FCMState>(context);

    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            child: addDrawerHeaderIcon(),
          ),
          generateListTile(context, Icons.photo_filter, 'Sesizează o problemă',
              '/noticeProblem', provider),
          generateListTile(context, Icons.location_city, 'Administrație locală',
              '/townHall5', provider),
          generateListTile(
              context, Icons.calendar_today, 'Evenimente', '/events', provider),
          generateListTile(context, Icons.perm_phone_msg, 'Numere utile',
              '/numbers', provider),
          generateListTile(context, Icons.announcement, 'Anunțuri',
              '/announcement', provider),
          generateListTile(context, Icons.bubble_chart, 'Calitatea aerului',
              '/air', provider),
          generateListTile(
              context, Icons.train, 'Transport', '/transport', provider),
          generateListTile(context, FontAwesome5.hand_holding_heart,
              'Voluntariat', '/volunteer', provider),
          generateListTile(
              context, Icons.settings, 'Setari', '/settings', provider),
          generateListTile(
              context, Icons.info, 'Despre aplicație', null, provider),
        ],
      ),
    );
  }

  ListTile generateListTile(context, icon, title, following, provider) {
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
                children: [
                  InkWell(
                      child: Text('Tap to copy: FCM token'),
                      onTap: () => {
                            Clipboard.setData(
                                ClipboardData(text: provider.fcm)),
                            showSnackBar(context, snackBar),
                          }),
                ],
                applicationName: 'e-Radauti',
                applicationVersion: 'Version: 2.1.2 (1)',
                applicationIcon: Image.asset(
                  'assets/logo_images/app_logo_final.png',
                  width: 24,
                  height: 24,
                ));
          } else if (Platform.isAndroid) {
            showAboutDialog(
                context: context,
                children: [
                  InkWell(
                      child: Text('Tap to copy: FCM token'),
                      onTap: () => {
                            Clipboard.setData(
                                ClipboardData(text: provider.fcm)),
                            showSnackBar(context, snackBar),
                          }),
                ],
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

  void showSnackBar(BuildContext context, SnackBar snackBar) {
    Scaffold.of(context).showSnackBar(snackBar);
  }
}

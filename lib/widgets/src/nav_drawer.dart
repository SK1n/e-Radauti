import 'package:flutter/material.dart';
import 'package:flutterapperadauti/routes/app_pages.dart';
import 'package:fluttericon/font_awesome5_icons.dart';
import 'package:get/get.dart';

class NavDrawer extends StatelessWidget {
  NavDrawer({Key? key}) : super(key: key);
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
          generateListTile(Icons.photo_filter, 'Sesizează o problemă',
              Routes.NOTICE_PROBLEM),
          generateListTile(
              Icons.location_city, 'Administrație locală', Routes.TOWN_HALL),
          generateListTile(Icons.calendar_today, 'Evenimente', Routes.EVENTS),
          generateListTile(
              Icons.perm_phone_msg, 'Numere utile', Routes.PHONE_NUMBERS),
          generateListTile(
              Icons.announcement, 'Anunțuri', Routes.ANNOUNCEMENTS),
          generateListTile(Icons.bubble_chart, 'Calitatea aerului', Routes.AIR),
          generateListTile(Icons.train, 'Transport', Routes.TRANSPORT),
          generateListTile(
              FontAwesome5.hand_holding_heart, 'Voluntariat', Routes.VOLUNTEER),
          generateListTile(Icons.settings, 'Setari', Routes.SETTINGS),
        ],
      ),
    );
  }

  ListTile generateListTile(icon, title, route) {
    return ListTile(
      leading: Icon(
        icon,
        color: Color(0x55FB6340),
      ),
      title: Text(title),
      onTap: () {
        Get.toNamed(route);
      },
    );
  }
}

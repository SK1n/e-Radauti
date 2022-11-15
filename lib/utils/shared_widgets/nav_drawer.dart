import 'package:flutter/material.dart';
import 'package:flutterapperadauti/routes/app_pages.dart';
import 'package:fluttericon/font_awesome5_icons.dart';
import 'package:get/get.dart';

class NavDrawer extends StatelessWidget {
  const NavDrawer({super.key});
  Widget addDrawerHeaderIcon() {
    return Container(
      padding: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
      margin: const EdgeInsets.fromLTRB(15.0, 5.0, 0.0, 5.0),
      child: Stack(
        alignment: AlignmentDirectional.center,
        children: <Widget>[
          Image.asset(
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
          listTile(Icons.photo_filter, 'Sesizează o problemă',
              Routes.NOTICE_PROBLEM),
          listTile(
              Icons.location_city, 'Administrație locală', Routes.TOWN_HALL),
          listTile(Icons.calendar_today, 'Evenimente', Routes.EVENTS),
          listTile(Icons.perm_phone_msg, 'Numere utile', Routes.PHONE_NUMBERS),
          listTile(Icons.announcement, 'Anunțuri', Routes.ANNOUNCEMENTS),
          listTile(Icons.bubble_chart, 'Calitatea aerului', Routes.AIR),
          listTile(Icons.train, 'Transport', Routes.TRANSPORT),
          listTile(
              FontAwesome5.hand_holding_heart, 'Voluntariat', Routes.VOLUNTEER),
          listTile(Icons.settings, 'Setari', Routes.SETTINGS),
        ],
      ),
    );
  }

  ListTile listTile(icon, title, route) {
    return ListTile(
      leading: Icon(
        icon,
      ),
      title: Text(title),
      onTap: () {
        Get.toNamed(route);
      },
    );
  }
}

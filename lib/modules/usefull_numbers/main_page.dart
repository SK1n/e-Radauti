import 'package:flutter/material.dart';
import 'package:flutterapperadauti/routes/app_pages.dart';
import 'package:flutterapperadauti/widgets/src/announcements_list_tile.dart';
import 'package:flutterapperadauti/widgets/src/appBarModelNew.dart';
import 'package:flutterapperadauti/widgets/src/nav_drawer.dart';

class HomePageNumbers extends StatelessWidget {
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
              content: 'Numere utille',
              leading: Icons.perm_phone_msg,
              scaffoldKey: _scaffoldKey,
            )
          ];
        },
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              AnnouncementsListTile(
                content: 'Deranjamente',
                subTitle:
                    'Date de contact pentru informații sau reclamații privind serviciile de alimentare cu apă, canalizare sau servicii comunale',
                leadingIcon: Icons.circle,
                leadingColor: Colors.green,
                route: Routes.LOCAL_DISTURBANCE,
              ),
              AnnouncementsListTile(
                content: 'Autorități locale',
                subTitle:
                    'Date de contact pentru principalele autorități publice locale (primărie, spital, poliție etc.)',
                leadingIcon: Icons.circle,
                leadingColor: Colors.red,
                route: Routes.LOCAL_AUTHORITIES,
              ),
              AnnouncementsListTile(
                content: 'Instituții publice',
                subTitle:
                    'Date de contact pentru principalele instituții de protecție civilă (a consumatorului, copilului, animalelor, mediului etc.)',
                leadingIcon: Icons.circle,
                leadingColor: Colors.blue,
                route: Routes.PUBLIC_INSTITUTIONS,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

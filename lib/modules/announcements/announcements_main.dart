import 'package:flutter/material.dart';
import 'package:flutterapperadauti/routes/app_pages.dart';
import 'package:flutterapperadauti/widgets/src/appBarModelNew.dart';
import 'package:flutterapperadauti/widgets/src/announcements_list_tile.dart';
import 'package:flutterapperadauti/widgets/src/nav_drawer.dart';

class Announcements extends StatelessWidget {
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
              content: 'Anunțuri',
              leading: Icons.announcement,
              scaffoldKey: _scaffoldKey,
            )
          ];
        },
        body: ListView(
          children: <Widget>[
            AnnouncementsListTile(
              content: 'Anunțuri locale',
              subTitle:
                  'Anunțuri de la principalele instituții\nAnunțuri de la servicii locale',
              leadingIcon: Icons.circle,
              leadingColor: Colors.blue,
              route: Routes.LOCAL_ANNOUNCEMENTS,
            ),
            AnnouncementsListTile(
              content: 'Locuri de Muncă',
              subTitle:
                  'Locuri de muncă preluate de pe portalul www.eradauti.ro',
              leadingIcon: Icons.circle,
              leadingColor: Colors.amberAccent[100]!,
              route: Routes.JOBS,
            ),
            AnnouncementsListTile(
              content: 'Imobiliare',
              subTitle:
                  'Anunțuri de imobiliare preluate de pe portalul www.eradauti.ro',
              leadingIcon: Icons.circle,
              leadingColor: Colors.brown[200]!,
              route: Routes.FURNITURE,
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterapperadauti/widgets/src/appBarModelNew.dart';
import 'package:flutterapperadauti/widgets/src/custom_list_tile.dart';
import 'package:flutterapperadauti/widgets/src/nav_drawer.dart';

class TownHallMain extends StatelessWidget {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      drawer: NavDrawer(),
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) {
          return [
            AppBarUi(
              content: 'Administrație locală',
              leading: Icons.location_city,
              scaffoldKey: _scaffoldKey,
            )
          ];
        },
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Container(
                padding: EdgeInsets.only(
                  bottom: 30.0,
                  top: 10.0,
                ),
                width: MediaQuery.of(context).size.width - 30,
                child: Image.asset(
                  "assets/images/primaria.jpg",
                  fit: BoxFit.cover,
                ),
              ),
              CustomListTile(
                content: 'Conducere',
                subTitle: 'Informații despre primar, viceprimar și secretar.',
                leadingIcon: Icons.circle,
                leadingColor: Colors.green[300],
                route: '/leaders',
              ),
              CustomListTile(
                content: 'Consiliul Local',
                subTitle: 'Consilierii locali. Contactează-ți reprezentantul!',
                leadingIcon: Icons.circle,
                leadingColor: Colors.blue[200],
                route: '/localCouncil',
              ),
              CustomListTile(
                content: 'Ședințe de Consiliu local',
                subTitle: 'Vizualizează live ședințele de consiliu local.',
                leadingIcon: Icons.circle,
                leadingColor: Colors.pink[50],
                route: '/councilMeetings',
              ),
              CustomListTile(
                content: 'Hotărâri de Consiliu Local',
                subTitle: 'Descoperă hotărârile de consiliu local.',
                leadingIcon: Icons.circle,
                leadingColor: Colors.orange[100],
                route: '/localLegislation',
              ),
            ],
          ),
        ),
      ),
    );
  }
}

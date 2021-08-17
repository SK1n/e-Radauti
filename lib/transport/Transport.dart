import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterapperadauti/widgets/src/appBarModelNew.dart';
import 'package:flutterapperadauti/widgets/src/custom_list_tile.dart';
import 'package:flutterapperadauti/widgets/src/nav_drawer.dart';

class HomePageTransport extends StatelessWidget {
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
              content: 'Transport',
              leading: Icons.train,
              scaffoldKey: _scaffoldKey,
            )
          ];
        },
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              CustomListTile(
                content: 'Taximetriști',
                leadingIcon: Icons.local_taxi,
                leadingColor: Color(0x55FB6340),
                route: '/taxi',
                subTitle: 'Lista taximetriștilor autorizați din Rădăuți',
              ),
              CustomListTile(
                content: 'Trenuri',
                leadingIcon: Icons.train,
                leadingColor: Color(0x55FB6340),
                route: '/train',
                subTitle: 'Lista trenurilor din Rădăuți',
              ),
              CustomListTile(
                content: 'Autobuz',
                leadingIcon: Icons.directions_bus,
                leadingColor: Color(0x55FB6340),
                route: '/bus',
                subTitle:
                    'Lista autobuzelor Rădăuți - alte localtăți din  județul Suceava',
              ),
            ],
          ),
        ),
      ),
    );
  }
}

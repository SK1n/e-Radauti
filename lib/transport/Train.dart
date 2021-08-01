import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterapperadauti/constants/trainRoutes.dart';
import 'package:flutterapperadauti/widgets/src/appBarModelNew.dart';
import 'package:flutterapperadauti/widgets/src/train_list_tile.dart';
import 'package:flutterapperadauti/widgets/src/nav_drawer.dart';

// ! If u want to change the ListTile design go to lib/widgets/src/listTile

class Train extends StatefulWidget {
  @override
  _TrainState createState() => _TrainState();
}

final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

class _TrainState extends State<Train> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      drawer: NavDrawer(),
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) {
          return [
            AppBarUi(
              content: 'Trenuri',
              leading: Icons.train,
              scaffoldKey: _scaffoldKey,
            )
          ];
        },
        body: SingleChildScrollView(
          child: Column(
            children: [
              ListTileRoute(
                timeArray: R5620TimeTable,
                title: 'Putna - Suceava',
                trainRoute: R5620Station,
                leadinIcon: Icons.train,
                subTitle: 'R5620 ( 05:04 - 07:12 )',
              ),
              ListTileRoute(
                timeArray: R5626TimeTable,
                title: 'Putna - Suceava',
                trainRoute: R5626Station,
                leadinIcon: Icons.train,
                subTitle: 'R5626 ( 13:45 - 15:54 )',
              ),
              ListTileRoute(
                timeArray: R5622TimeTable,
                title: 'Putna - Suceava',
                trainRoute: R5622Station,
                leadinIcon: Icons.train,
                subTitle: 'R5622 ( 05:56 - 08:04 )',
              ),
              ListTileRoute(
                timeArray: R5624TimeTable,
                title: 'Putna - Suceava',
                trainRoute: R5624Station,
                leadinIcon: Icons.train,
                subTitle: 'R5624  ( 10:32 - 12:40 )',
              ),
              ListTileRoute(
                timeArray: R5628TimeTable,
                title: 'Putna - Suceava',
                trainRoute: R5628Station,
                leadinIcon: Icons.train,
                subTitle: 'R5628  ( 16:28 - 18:37 )',
              ),
              ListTileRoute(
                timeArray: R5621TimeTable,
                title: 'Suceava - Putna',
                trainRoute: R5621Station,
                leadinIcon: Icons.train,
                subTitle: 'R5621 ( 07:26 - 09:35 )',
              ),
              ListTileRoute(
                timeArray: R5627TimeTable,
                title: 'Suceava - Putna',
                trainRoute: R5627Station,
                leadinIcon: Icons.train,
                subTitle: 'R5627 ( 18:45 - 20:54 )',
              ),
              ListTileRoute(
                timeArray: R5623TimeTable,
                title: 'Suceava - Putna',
                trainRoute: R5623Station,
                leadinIcon: Icons.train,
                subTitle: 'R5623 ( 08:15 - 10:25 )',
              ),
              ListTileRoute(
                timeArray: R5625TimeTable,
                title: 'Suceava - Putna',
                trainRoute: R5625Station,
                leadinIcon: Icons.train,
                subTitle: 'R5625 ( 14:10 - 16:20 )',
              ),
            ],
          ),
        ),
      ),
    );
  }
}

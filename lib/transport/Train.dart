import 'package:expandable/expandable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterapperadauti/constants/trainRoutes.dart';
import 'package:flutterapperadauti/widgets/src/listTile.dart';
import 'package:flutterapperadauti/widgets/src/nav_drawer.dart';

import '../widgets/src/appBarModel.dart';

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
      appBar: AppBarModel()
          .loadAppBar(context, 'Trenuri', Icons.train, _scaffoldKey),
      drawer: NavDrawer(),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              listTileDesign(
                  context, 'R5621', Icons.train, 'R5620', 'SubTitle'),
              listItem('R5621', R5621),
              listItem('R5626', R5626),
              listItem('R5627', R5627),
              listItem('R5622', R5622),
              listItem('R5623', R5623),
              listItem('R5624', R5624),
              listItem('R5625', R5625),
              listItem('R5628', R5628),
            ],
          ),
        ),
      ),
    );
  }

  ExpandableNotifier listItem(routeName, route) {
    return ExpandableNotifier(
      child: Column(
        children: [
          ScrollOnExpand(
            child: Expandable(
              collapsed: ExpandableButton(
                child: Container(
                  width: MediaQuery.of(context).size.width - 20,
                  child: Text(
                    '$routeName',
                    style: TextStyle(fontSize: 40),
                  ),
                ),
              ),
              expanded: ExpandableButton(
                child: Container(
                  child: Column(
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width - 20,
                        child:
                            Text('$routeName', style: TextStyle(fontSize: 40)),
                      ),
                      Container(
                        child: Text(route),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 15.0),
            child: Container(
              height: 1.0,
              color: Color.fromRGBO(0, 0, 0, 0.1),
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:expandable/expandable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterapperadauti/constants/trainRoutes.dart';

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
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              listItem('R5620', R5620),
              listItem('R5621', R5621),
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
                  child: Text('$routeName'),
                ),
              ),
              expanded: ExpandableButton(
                child: Container(
                  child: Column(
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width - 20,
                        child: Text('$routeName'),
                      ),
                      Container(
                        child: Text(route),
                      )
                    ],
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutterapperadauti/transport/models/train_model.dart';
import 'package:flutterapperadauti/widgets/src/appBarModelNew.dart';
import 'package:flutterapperadauti/widgets/src/loading_screen_ui.dart';
import 'package:flutterapperadauti/widgets/src/train_list_tile.dart';
import 'package:flutterapperadauti/widgets/src/nav_drawer.dart';
import 'package:provider/provider.dart';

// ! If u want to change the ListTile design go to lib/widgets/src/listTile

class Train extends StatefulWidget {
  @override
  _TrainState createState() => _TrainState();
}

final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

class _TrainState extends State<Train> {
  @override
  Widget build(BuildContext context) {
    FetchTrainData data = Provider.of<FetchTrainData>(context);
    return Scaffold(
      key: _scaffoldKey,
      drawer: NavDrawer(),
      body: NestedScrollView(
          headerSliverBuilder: (context, innerBoxIsScrolled) {
            return [
              AppBarUiSliver(
                content: 'Trenuri',
                leading: Icons.train,
                scaffoldKey: _scaffoldKey,
              )
            ];
          },
          body: FutureBuilder(
            future: data.getDataFromFirebase(),
            builder: (BuildContext context, AsyncSnapshot snap) {
              if (snap.hasError) {
                return Text('A intervenit o eroare');
              }
              if (snap.hasData) {
                return ListView.builder(
                    itemCount: data.getLength(),
                    itemBuilder: (BuildContext contxt, int item) {
                      return ListTileRoute(
                          leadinIcon: Icons.train,
                          title: snap.data[item].title,
                          timeArray: snap.data[item].timeTable,
                          subTitle: snap.data[item].train,
                          trainRoute: snap.data[item].stations);
                    });
              } else {
                return LoadingScreen();
              }
            },
          )),
    );
  }
}

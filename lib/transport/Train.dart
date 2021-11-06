import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterapperadauti/constants/trainRoutes.dart';
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

// SingleChildScrollView(
//           child: Column(
//             children: [
//               ListTileRoute(
//                 timeArray: R5620TimeTable,
//                 title: 'Putna - Suceava',
//                 trainRoute: R5620Station,
//                 leadinIcon: Icons.train,
//                 subTitle: 'R5620 ( 05:04 - 07:12 ) WEEKEND',
//               ),
//               ListTileRoute(
//                 timeArray: R5626TimeTable,
//                 title: 'Putna - Suceava',
//                 trainRoute: R5626Station,
//                 leadinIcon: Icons.train,
//                 subTitle: 'R5626 ( 13:45 - 15:54 ) WEEKEND',
//               ),
//               ListTileRoute(
//                 timeArray: R5622TimeTable,
//                 title: 'Putna - Suceava',
//                 trainRoute: R5622Station,
//                 leadinIcon: Icons.train,
//                 subTitle: 'R5622 ( 05:56 - 08:04 ) L-V',
//               ),
//               ListTileRoute(
//                 timeArray: R5624TimeTable,
//                 title: 'Putna - Suceava',
//                 trainRoute: R5624Station,
//                 leadinIcon: Icons.train,
//                 subTitle: 'R5624  ( 10:32 - 12:40 ) L-V',
//               ),
//               ListTileRoute(
//                 timeArray: R5628TimeTable,
//                 title: 'Putna - Suceava',
//                 trainRoute: R5628Station,
//                 leadinIcon: Icons.train,
//                 subTitle: 'R5628  ( 16:28 - 18:37 ) L-V',
//               ),
//               ListTileRoute(
//                 timeArray: R5621TimeTable,
//                 title: 'Suceava - Putna',
//                 trainRoute: R5621Station,
//                 leadinIcon: Icons.train,
//                 subTitle: 'R5621 ( 07:26 - 09:35 ) WEEKEND',
//               ),
//               ListTileRoute(
//                 timeArray: R5627TimeTable,
//                 title: 'Suceava - Putna',
//                 trainRoute: R5627Station,
//                 leadinIcon: Icons.train,
//                 subTitle: 'R5627 ( 18:45 - 20:54 ) L-V + WEEKEND',
//               ),
//               ListTileRoute(
//                 timeArray: R5623TimeTable,
//                 title: 'Suceava - Putna',
//                 trainRoute: R5623Station,
//                 leadinIcon: Icons.train,
//                 subTitle: 'R5623 ( 08:15 - 10:25 ) L-V',
//               ),
//               ListTileRoute(
//                 timeArray: R5625TimeTable,
//                 title: 'Suceava - Putna',
//                 trainRoute: R5625Station,
//                 leadinIcon: Icons.train,
//                 subTitle: 'R5625 ( 14:10 - 16:20 ) L-V',
//               ),
//             ],
//           ),
//         ),
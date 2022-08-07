import 'package:flutter/material.dart';
import 'package:flutter_loadingindicator/flutter_loadingindicator.dart';
import 'package:flutterapperadauti/controllers/get_data_from_firebase_controller.dart';
import 'package:flutterapperadauti/modules/transport/screens/train/utils/train_list_tile.dart';
import 'package:flutterapperadauti/widgets/src/appBarModelNew.dart';
import 'package:flutterapperadauti/widgets/src/nav_drawer.dart';
import 'package:flutterapperadauti/utils/futuristic.dart';
import 'package:get/get.dart';

class Train extends StatelessWidget {
  const Train({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> _scaffoldKey =
        new GlobalKey<ScaffoldState>();
    final GetDataFromFirebaseController _getDataFromFirebaseController =
        Get.find();
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
          body: Futuristic(
            futureBuilder: () =>
                _getDataFromFirebaseController.getDataFromFirebase('Train'),
            busyBuilder: (_) {
              if (!EasyLoading.isShow) {
                EasyLoading.show();
              }
              return Container();
            },
            errorBuilder: (_, error, retry) {
              EasyLoading.showError("Eroare");
              return TextButton(
                  onPressed: () => retry, child: Text('Incearca din nou!'));
            },
            dataBuilder: (_, snap) {
              if (EasyLoading.isShow) {
                EasyLoading.dismiss();
              }
              return ListView.builder(
                itemCount: _getDataFromFirebaseController
                    .getLength(snap.data['train']),
                itemBuilder: (BuildContext contxt, int item) {
                  var data = snap.data['train'][item];
                  return ListTileRoute(
                      leadinIcon: Icons.train,
                      title: data['title'],
                      timeArray: data['time_table'],
                      subTitle: data['train'],
                      trainRoute: data['stations']);
                },
              );
            },
          )),
    );
  }
}

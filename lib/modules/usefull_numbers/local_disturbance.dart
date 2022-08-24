import 'package:flutter/material.dart';
import 'package:flutter_loadingindicator/flutter_loadingindicator.dart';
import 'package:flutterapperadauti/controllers/get_data_from_firebase_controller.dart';
import 'package:flutterapperadauti/modules/usefull_numbers/utils/usefull_numbers_widget.dart';
import 'package:flutterapperadauti/widgets/src/appBarModelNew.dart';
import 'package:flutterapperadauti/widgets/src/nav_drawer.dart';
import 'package:flutterapperadauti/utils/futuristic.dart';
import 'package:get/get.dart';

class LocalDisturbance extends StatelessWidget {
  const LocalDisturbance({Key? key}) : super(key: key);
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
                  content: 'Deranjamente',
                  leading: Icons.perm_phone_msg,
                  scaffoldKey: _scaffoldKey,
                )
              ];
            },
            body: Futuristic(
              futureBuilder: () =>
                  _getDataFromFirebaseController.getDataFromFirebase('Numbers'),
              query: 'upsets',
              dataBuilder: (_, snap) {
                if (EasyLoading.isShow) {
                  EasyLoading.dismiss();
                }

                return ListView.builder(
                  itemCount: _getDataFromFirebaseController
                      .getLength(snap.data['upsets']),
                  itemBuilder: (BuildContext context, int item) {
                    var data = snap.data['upsets'][item];
                    return UsefullNumbersWidget(
                      title: data['title'],
                      phone: data['phone'],
                      email: data['email'],
                    );
                  },
                );
              },
            )));
  }
}

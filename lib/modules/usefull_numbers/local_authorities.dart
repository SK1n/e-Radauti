import 'package:flutter/material.dart';
import 'package:flutter_loadingindicator/flutter_loadingindicator.dart';
import 'package:flutterapperadauti/controllers/get_data_from_firebase_controller.dart';
import 'package:flutterapperadauti/modules/usefull_numbers/utils/usefull_numbers_widget.dart';
import 'package:flutterapperadauti/widgets/src/appBarModelNew.dart';
import 'package:flutterapperadauti/widgets/src/nav_drawer.dart';
import 'package:flutterapperadauti/utils/futuristic.dart';
import 'package:get/get.dart';

class LocalAuthorities extends StatelessWidget {
  const LocalAuthorities({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final GetDataFromFirebaseController _getDataFromFirebaseController =
        Get.find();
    final GlobalKey<ScaffoldState> _scaffoldKey =
        new GlobalKey<ScaffoldState>();
    return Scaffold(
        key: _scaffoldKey,
        drawer: NavDrawer(),
        body: NestedScrollView(
            headerSliverBuilder: (context, innerBoxIsScrolled) {
              return [
                AppBarUiSliver(
                  content: 'Autorități locale',
                  leading: Icons.perm_phone_msg,
                  scaffoldKey: _scaffoldKey,
                )
              ];
            },
            body: Futuristic(
              futureBuilder: () =>
                  _getDataFromFirebaseController.getDataFromFirebase('Numbers'),
              //authorities
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
                        .getLength(snap.data['authorities']),
                    itemBuilder: (BuildContext context, int item) {
                      var data = snap.data['authorities'][item];
                      return UsefullNumbersWidget(
                        title: data['title'],
                        phone: data['phone'],
                        email: data['email'] ?? [],
                      );
                    });
              },
            )));
  }
}

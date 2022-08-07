import 'package:card_loading/card_loading.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_loadingindicator/flutter_loadingindicator.dart';
import 'package:flutterapperadauti/controllers/download_image_controller.dart';
import 'package:flutterapperadauti/controllers/get_data_from_firebase_controller.dart';

import 'package:flutterapperadauti/widgets/src/appBarModelNew.dart';
import 'package:flutterapperadauti/widgets/src/nav_drawer.dart';
import 'package:fluttericon/entypo_icons.dart';
import 'package:fluttericon/font_awesome5_icons.dart';
import 'package:futuristic/futuristic.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart' as UrlLauncher;

class Taxi extends StatelessWidget {
  Taxi({Key? key}) : super(key: key);
  final GetDataFromFirebaseController _getDataFromFirebaseController =
      Get.find();
  final DownloadImageController _downloadImageController = Get.find();
  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> _scaffoldKey =
        new GlobalKey<ScaffoldState>();

    return Scaffold(
      key: _scaffoldKey,
      drawer: NavDrawer(),
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) {
          return [
            AppBarUiSliver(
              content: 'Taximetriști',
              leading: Icons.local_taxi,
              scaffoldKey: _scaffoldKey,
            )
          ];
        },
        body: Futuristic(
          futureBuilder: () =>
              _getDataFromFirebaseController.getDataFromFirebase('Taxi'),
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
                itemCount:
                    _getDataFromFirebaseController.getLength(snap.data['taxi']),
                itemBuilder: (BuildContext context, int item) {
                  var data = snap.data['taxi'][item];
                  return listItem(
                    url: data['image_url'],
                    driver: data['driver_name'],
                    phone: data['phone_number'],
                    car: data['car_type'],
                    plate: data['plate_number'],
                  );
                });
          },
        ),
      ),
    );
  }

  Card listItem({
    String? phone,
    String? url,
    String? plate,
    String? car,
    String? driver,
  }) {
    return Card(
      child: Row(
        children: [
          Padding(
            padding: EdgeInsets.only(right: 10),
            child: Container(
              height: 100,
              width: 100,
              child: Futuristic(
                futureBuilder: () =>
                    _downloadImageController.getDownloadUrlFromUrlRef(url!),
                busyBuilder: (_) {
                  return CardLoading(
                    height: 200,
                    margin: EdgeInsets.only(bottom: 20),
                    borderRadius: BorderRadius.all(
                      Radius.circular(10),
                    ),
                  );
                },
                errorBuilder: (_, error, retry) {
                  EasyLoading.showError("Eroare");
                  return TextButton(
                      onPressed: () => retry, child: Text('Incearca din nou!'));
                },
                dataBuilder: (_, snap) => Container(
                  width: Get.width,
                  child: Image.network(
                    snap.data.toString(),
                    scale: 1.0,
                    fit: BoxFit.fitWidth,
                    height: 200,
                  ),
                ),
              ),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: Icon(
                      Entypo.user,
                      size: 17,
                    ),
                  ),
                  Text(
                    '$driver',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: Icon(
                      FontAwesome5.car,
                      size: 17,
                    ),
                  ),
                  Text('$car'),
                ],
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: Icon(
                      Entypo.vcard,
                      size: 17,
                    ),
                  ),
                  Text('$plate'),
                ],
              ),
              InkWell(
                onTap: () {
                  UrlLauncher.launch("tel://$phone");
                },
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 8.0),
                      child: Icon(
                        Entypo.phone,
                        color: Colors.blue,
                        size: 17,
                      ),
                    ),
                    Text(
                      '$phone',
                      style: TextStyle(color: Colors.blue),
                    ),
                  ],
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}

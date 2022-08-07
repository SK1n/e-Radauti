import 'dart:async';
import 'package:card_loading/card_loading.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_loadingindicator/flutter_loadingindicator.dart';
import 'package:flutterapperadauti/controllers/download_image_controller.dart';
import 'package:flutterapperadauti/controllers/get_data_from_firebase_controller.dart';
import 'package:flutterapperadauti/widgets/src/appBarModelNew.dart';
import 'package:flutterapperadauti/widgets/src/nav_drawer.dart';
import 'package:futuristic/futuristic.dart';
import 'package:get/get.dart';
import 'package:selectable_autolink_text/selectable_autolink_text.dart';
import 'package:url_launcher/url_launcher.dart';

class LocalAnounnouncements extends StatelessWidget {
  LocalAnounnouncements({Key? key}) : super(key: key);
  final DownloadImageController _downloadImageController = Get.find();
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
              content: 'Anunțuri locale',
              leading: Icons.announcement,
              scaffoldKey: _scaffoldKey,
            )
          ];
        },
        body: Futuristic(
          futureBuilder: () => _getDataFromFirebaseController
              .getDataFromFirebase('Announcements'),
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
          dataBuilder: (_, snapshot) {
            if (EasyLoading.isShow) {
              EasyLoading.dismiss();
            }
            return ListView.builder(
                itemCount: _getDataFromFirebaseController
                    .getLength(snapshot.data['announcement']),
                itemBuilder: (BuildContext context, int item) {
                  var data = snapshot.data['announcement'][item];
                  return listItem(
                      context: context,
                      url: data['URL'],
                      date: data['date'],
                      host: data['host'],
                      title: data['title'],
                      content: data['description']);
                });
          },
        ),
      ),
    );
  }

  Card listItem({context, url, date, host, title, content}) {
    return Card(
      elevation: 5,
      child: Container(
        padding: const EdgeInsets.only(
          top: 20,
          bottom: 20,
          left: 10,
          right: 10,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Futuristic(
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
            Container(
              child: Text(
                "$date",
                style: TextStyle(
                  fontSize: 15,
                ),
              ),
            ),
            Container(
              child: Text(
                "$host",
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width - 90,
              child: Text(
                "$title",
                style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            // imageWidget(contentImage),
            Container(
              child: SelectableAutoLinkText(
                '$content',
                onTransformDisplayLink: AutoLinkUtils.shrinkUrl,
                linkStyle: TextStyle(color: Colors.pinkAccent),
                onTap: (link) async {
                  if (await canLaunch(link)) {
                    launch(link, forceSafariVC: false);
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

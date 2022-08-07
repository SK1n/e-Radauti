import 'package:card_loading/card_loading.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_loadingindicator/flutter_loadingindicator.dart';
import 'package:flutterapperadauti/controllers/download_image_controller.dart';
import 'package:flutterapperadauti/controllers/get_data_from_firebase_controller.dart';

import 'package:flutterapperadauti/widgets/src/appBarModelNew.dart';
import 'package:flutterapperadauti/widgets/src/nav_drawer.dart';
import 'package:fluttericon/entypo_icons.dart';
import 'package:flutterapperadauti/utils/futuristic.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart' as UrlLauncher;

class LocalCouncil extends StatelessWidget {
  LocalCouncil({Key? key}) : super(key: key);

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
              content: 'Consiliu Local',
              leading: Icons.location_city,
              scaffoldKey: _scaffoldKey,
            )
          ];
        },
        body: Futuristic(
          futureBuilder: () => _getDataFromFirebaseController
              .getDataFromFirebase('LocalCouncil'),
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
          dataBuilder: (BuildContext context, AsyncSnapshot snap) {
            EasyLoading.dismiss();
            return ListView.builder(
                itemCount: _getDataFromFirebaseController
                    .getLength(snap.data['localcouncil']),
                itemBuilder: (BuildContext context, int item) {
                  var data = snap.data['localcouncil'][item];
                  return LocalCouncilCard(
                    url: data['url'],
                    name: data['name'],
                    function: data['function'],
                    party: data['party'],
                    phoneNumber: data['phone_number'],
                    email: data['email'],
                  );
                });
          },
        ),
      ),
    );
  }
}

class LocalCouncilCard extends StatelessWidget {
  final String? url;
  final String? name;
  final String? function;
  final String? party;
  final String? phoneNumber;
  final String? email;
  const LocalCouncilCard({
    Key? key,
    this.url,
    this.name,
    this.function,
    this.party,
    this.phoneNumber,
    this.email,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final DownloadImageController _downloadImageController =
        Get.put<DownloadImageController>(DownloadImageController());
    return Card(
      elevation: 5,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                CircleAvatar(
                  radius: 45,
                  backgroundColor: Colors.white,
                  child: ClipOval(
                    child: Futuristic(
                      futureBuilder: () => _downloadImageController
                          .getDownloadUrlFromUrlRef(url!),
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
                            onPressed: () => retry,
                            child: Text('Incearca din nou!'));
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
                Container(
                  child: Image.asset(
                    'assets/images/$party.png',
                    width: 40,
                    height: 40,
                    fit: BoxFit.fill,
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '$name',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.blueGrey,
                  ),
                ),
                Text(
                  '$function',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                phoneNumber != null
                    ? InkWell(
                        onTap: () {
                          _launchURL('tel:$phoneNumber');
                        },
                        child: Row(
                          children: [
                            Icon(
                              Entypo.phone,
                              color: Colors.blueAccent,
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 8.0),
                              child: Text(
                                '$phoneNumber',
                                style: TextStyle(color: Colors.blueAccent),
                              ),
                            ),
                          ],
                        ),
                      )
                    : Container(),
                InkWell(
                  onTap: () {
                    _launchURL('mailto:$email');
                  },
                  child: Row(
                    children: [
                      Icon(
                        Entypo.mail,
                        color: Colors.blueAccent,
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 10.0),
                        child: Text(
                          '$email',
                          style: TextStyle(color: Colors.blueAccent),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Future getDownloadUrlFromUrlRef(BuildContext context, String imgURL) async {
    Image image;
    return await FirebaseStorage.instance
        .refFromURL(imgURL)
        .getDownloadURL()
        .then((imageUrl) {
      image = Image.network(
        imageUrl.toString(),
        fit: BoxFit.cover,
        width: 80,
        height: 80,
      );
      return image;
    });
  }

  _launchURL(url) async {
    if (await UrlLauncher.canLaunch(url)) {
      await UrlLauncher.launch(url);
    } else {
      throw 'Nu se poate încărca $url';
    }
  }
}

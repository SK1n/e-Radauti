import 'package:card_loading/card_loading.dart';
import 'package:flutter_loadingindicator/flutter_loadingindicator.dart';
import 'package:flutterapperadauti/controllers/download_image_controller.dart';
import 'package:flutterapperadauti/controllers/get_data_from_firebase_controller.dart';
import 'package:fluttericon/entypo_icons.dart';
import 'package:flutterapperadauti/utils/futuristic.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

import 'package:flutterapperadauti/widgets/src/appBarModelNew.dart';
import 'package:flutterapperadauti/widgets/src/nav_drawer.dart';
import 'package:url_launcher/url_launcher_string.dart';

class Leaders extends StatelessWidget {
  Leaders({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> _scaffoldKey =
        new GlobalKey<ScaffoldState>();
    final GetDataFromFirebaseController getDataFromFirebaseController =
        Get.find<GetDataFromFirebaseController>();
    return Scaffold(
      key: _scaffoldKey,
      drawer: NavDrawer(),
      body: NestedScrollView(
          headerSliverBuilder: (context, innerBoxIsScrolled) {
            return [
              AppBarUiSliver(
                content: 'Administrație locală',
                leading: Icons.location_city,
                scaffoldKey: _scaffoldKey,
              )
            ];
          },
          body: Futuristic(
            futureBuilder: () =>
                getDataFromFirebaseController.getDataFromFirebase('Leaders'),
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
                  itemCount: getDataFromFirebaseController
                      .getLength(snap.data['leaders']),
                  itemBuilder: (BuildContext context, int item) {
                    return WidgetLeader(
                      name: snap.data['leaders'][item]['name'],
                      wealth: snap.data['leaders'][item]['wealth'],
                      interests: snap.data['leaders'][item]['interests'],
                      function: snap.data['leaders'][item]['function'],
                      email: snap.data['leaders'][item]['email'] ?? '',
                      location: snap.data['leaders'][item]['location'],
                      urlFb: snap.data['leaders'][item]['urlFb'],
                      urlImg: snap.data['leaders'][item]['url_img'],
                    );
                  });
            },
          )),
    );
  }
}

class WidgetLeader extends StatelessWidget {
  final String? name;
  final String? wealth;
  final String? interests;
  final String email;
  final String? urlFb;
  final String? function;
  final String urlImg;
  final String? location;

  const WidgetLeader({
    Key? key,
    this.name,
    this.wealth,
    this.interests,
    required this.email,
    this.urlFb,
    this.function,
    required this.urlImg,
    this.location,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final DownloadImageController _downloadImageController =
        Get.put<DownloadImageController>(DownloadImageController());
    return Card(
      elevation: 10.0,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 8.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(0.0),
              child: CircleAvatar(
                backgroundColor: Colors.white,
                radius: 45,
                child: ClipOval(
                  child: Futuristic(
                    futureBuilder: () => _downloadImageController
                        .getDownloadUrlFromUrlRef(urlImg),
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
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '$name',
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.blueGrey,
                  ),
                ),
                Text(
                  '$function',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: InkWell(
                        child: Icon(Entypo.facebook),
                        onTap: () {
                          _launchURL('$urlFb');
                        },
                      ),
                    ),
                    email.isNotEmpty
                        ? InkWell(
                            child: Icon(Entypo.mail),
                            onTap: () {
                              _launchURL('mailto:$email');
                            },
                          )
                        : Container(),
                  ],
                ),
                Text(
                  'Informații adiționale',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      decoration: TextDecoration.underline),
                ),
                InkWell(
                  onTap: () {
                    _launchURL('$wealth');
                  },
                  child: Text(
                    'Declarație de avere',
                    style: TextStyle(
                        decoration: TextDecoration.underline,
                        color: Colors.blueAccent),
                  ),
                ),
                InkWell(
                  onTap: () {
                    _launchURL('$interests');
                  },
                  child: Text(
                    'Declarație de interese',
                    style: TextStyle(
                        decoration: TextDecoration.underline,
                        color: Colors.blueAccent),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  _launchURL(url) async {
    if (await canLaunchUrlString(url)) {
      await launchUrlString(url);
    } else {
      throw 'Nu se poate încărca $url';
    }
  }
}

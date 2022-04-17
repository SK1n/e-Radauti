import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutterapperadauti/town_hall/models/leaders_model.dart';
import 'package:fluttericon/entypo_icons.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart' as UrlLauncher;
import 'package:flutter/material.dart';

import 'package:flutterapperadauti/widgets/src/appBarModelNew.dart';
import 'package:flutterapperadauti/widgets/src/loading_screen_ui.dart';
import 'package:flutterapperadauti/widgets/src/nav_drawer.dart';

class Leaders extends StatelessWidget {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    FetchLeaderData data = Provider.of<FetchLeaderData>(context);
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
          body: FutureBuilder(
            future: data.getDataFromFirebase(),
            builder: (BuildContext context, AsyncSnapshot snap) {
              if (snap.hasError) {
                return Text('A intervenit o eroare');
              }
              if (snap.hasData) {
                return ListView.builder(
                    itemCount: data.getLength(),
                    itemBuilder: (BuildContext context, int item) {
                      return WidgetLeader(
                        name: snap.data[item].name,
                        wealth: snap.data[item].wealth,
                        interests: snap.data[item].interests,
                        function: snap.data[item].function,
                        email: snap.data[item].email,
                        location: snap.data[item].location,
                        urlFb: snap.data[item].urlFb,
                        urlImg: snap.data[item].urlImg,
                      );
                    });
              } else {
                return LoadingScreen();
              }
            },
          )),
    );
  }
}

class WidgetLeader extends StatelessWidget {
  final String? name;
  final String? wealth;
  final String? interests;
  final String? email;
  final String? urlFb;
  final String? function;
  final String urlImg;
  final String? location;

  const WidgetLeader({
    Key? key,
    this.name,
    this.wealth,
    this.interests,
    this.email,
    this.urlFb,
    this.function,
    required this.urlImg,
    this.location,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                  child: FutureBuilder(
                    future: getDownloadUrlFromUrlRef(context, urlImg),
                    builder: (BuildContext context, AsyncSnapshot snap) {
                      if (snap.hasError) {
                        return Text('A aparaut o eroare');
                      }
                      if (snap.hasData) {
                        return snap.data;
                      } else {
                        return LoadingScreen();
                      }
                    },
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
                    email!.isEmpty
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

  Future getDownloadUrlFromUrlRef(BuildContext context, String imgURL) async {
    Image image;
    await FirebaseStorage.instance.refFromURL(imgURL).getDownloadURL().then(
      (imageUrl) {
        image = Image.network(
          imageUrl.toString(),
          fit: BoxFit.cover,
          width: 80,
          height: 80,
        );
        return image;
      },
    );
  }

  _launchURL(url) async {
    if (await UrlLauncher.canLaunch(url)) {
      await UrlLauncher.launch(url);
    } else {
      throw 'Nu se poate încărca $url';
    }
  }
}

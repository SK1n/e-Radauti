import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutterapperadauti/town_hall/models/local_council_model.dart';
import 'package:flutterapperadauti/widgets/src/appBarModelNew.dart';
import 'package:flutterapperadauti/widgets/src/loading_screen_ui.dart';
import 'package:flutterapperadauti/widgets/src/nav_drawer.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart' as UrlLauncher;

class LocalCouncil extends StatelessWidget {
  const LocalCouncil({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> _scaffoldKey =
        new GlobalKey<ScaffoldState>();
    FetchLocalCouncilData data = Provider.of<FetchLocalCouncilData>(context);
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
                    var data = snap.data[item];
                    return LocalCouncilCard(
                      url: data.url,
                      name: data.name,
                      function: data.function,
                      party: data.party,
                      phoneNumber: data.phoneNumber,
                      email: data.email,
                    );
                  });
            } else {
              return LoadingScreen();
            }
          },
        ),
      ),
    );
  }
}

class LocalCouncilCard extends StatelessWidget {
  final String url;
  final String name;
  final String function;
  final String party;
  final String phoneNumber;
  final String email;
  const LocalCouncilCard({
    Key key,
    this.url,
    this.name,
    this.function,
    this.party,
    this.phoneNumber,
    this.email,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                    child: FutureBuilder(
                      future: getDownloadUrlFromUrlRef(context, url),
                      builder: (BuildContext context, AsyncSnapshot snap) {
                        if (snap.hasError) {
                          return Text('A aparut o eroare');
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
                              AntDesign.phone,
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
                        AntDesign.mail,
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
    await FirebaseStorage.instance.refFromURL(imgURL).getDownloadURL().then(
          (imageUrl) => image = Image.network(
            imageUrl.toString(),
            fit: BoxFit.cover,
            width: 80,
            height: 80,
          ),
        );
    return image;
  }

  _launchURL(url) async {
    if (await UrlLauncher.canLaunch(url)) {
      await UrlLauncher.launch(url);
    } else {
      throw 'Nu se poate încărca $url';
    }
  }
}

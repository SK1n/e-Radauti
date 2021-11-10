import 'dart:convert';
import 'dart:async';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_autolink_text/flutter_autolink_text.dart';
import 'package:flutterapperadauti/jobs/models/local_announcement_model.dart';
import 'package:flutterapperadauti/widgets/src/appBarModelNew.dart';
import 'package:flutterapperadauti/widgets/src/loading_screen_ui.dart';
import 'package:flutterapperadauti/widgets/src/nav_drawer.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_linkify/flutter_linkify.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class LocalAnounnouncements extends StatefulWidget {
  LocalAnounnouncements({Key key}) : super(key: key);
  @override
  _LocalAnnouncementsState createState() => _LocalAnnouncementsState();
}

class _LocalAnnouncementsState extends State<LocalAnounnouncements> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    FetchAnnouncementData fetchAnnouncementData =
        Provider.of<FetchAnnouncementData>(context);
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
        body: FutureBuilder(
          future: fetchAnnouncementData.getAnnouncementsFromFirebase(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                  itemCount: fetchAnnouncementData.getLength(),
                  itemBuilder: (BuildContext context, int item) {
                    return listItem(
                        context: context,
                        url: snapshot.data[item].url,
                        date: snapshot.data[item].date,
                        host: snapshot.data[item].host,
                        title: snapshot.data[item].title,
                        content: snapshot.data[item].description);
                  });
            } else if (snapshot.hasError) {
              return Container(
                height: MediaQuery.of(context).size.height,
                child: Center(
                  child:
                      Text("Este o problemă cu încărcarea anunțurilor locale."),
                ),
              );
            }
            return LoadingScreen();
          },
        ),
      ),
    );
  }

  Future getDownloadUrlFromUrlRef(BuildContext context, String imgURL) async {
    Image image;
    await FirebaseStorage.instance
        .refFromURL(imgURL)
        .getDownloadURL()
        .then((imageUrl) => image = Image.network(
              imageUrl.toString(),
              scale: 1.0,
              fit: BoxFit.fitWidth,
              height: 200,
            ));
    return image;
  }

  Future<void> _onOpen(LinkableElement link) async {
    if (await canLaunch(link.url)) {
      await launch(link.url);
    } else {
      throw 'Nu pot încărca $link';
    }
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
            FutureBuilder(
              future: getDownloadUrlFromUrlRef(context, url),
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                if (snapshot.hasData) {
                  return Container(
                    padding: EdgeInsets.only(top: 10),
                    height: 200,
                    width: double.infinity,
                    child: snapshot.data,
                  );
                } else {
                  return LoadingScreen();
                }
              },
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
              child: AutolinkText(
                text: '$content',
                textStyle: TextStyle(color: Colors.black),
                linkStyle: TextStyle(color: Colors.pinkAccent),
                humanize: false,
                onWebLinkTap: (link) => launch(link, forceSafariVC: false),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

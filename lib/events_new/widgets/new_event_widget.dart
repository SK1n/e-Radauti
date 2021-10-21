import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:expandable/expandable.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_autolink_text/flutter_autolink_text.dart';
import 'package:flutterapperadauti/widgets/src/loading_screen_ui.dart';
import 'package:folding_cell/folding_cell.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NewEventWidget extends StatelessWidget {
  final String headline;
  final String host;
  final String description;
  final String location;
  final String street;
  final int start;
  final int end;
  final String url;
  final String category;
  final FirebaseApp firebaseApp;

  const NewEventWidget({
    Key key,
    this.headline,
    this.host,
    this.description,
    this.location,
    this.street,
    this.start,
    this.end,
    this.url,
    this.category,
    this.firebaseApp,
  }) : super(key: key);

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

  String convertTimestampToDate(int timestamp) {
    var format = new DateFormat('dd/MM/yyyy HH:mm');
    var time =
        format.format(DateTime.fromMillisecondsSinceEpoch(timestamp * 1000));
    return time;
  }

  @override
  Widget build(BuildContext context) {
    return ExpandableNotifier(
      child: ScrollOnExpand(
        child: ExpandablePanel(
          collapsed: ExpandableButton(
            child: FutureBuilder(
              future: getDownloadUrlFromUrlRef(context,
                  'gs://eradauti-nativ.appspot.com/29_martie_2021.jpg'),
              builder: (_, AsyncSnapshot snapshot) {
                if (snapshot.hasData) {
                  return Card(
                    child: Column(
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width,
                          child: snapshot.data,
                        ),
                        ListTile(
                          title: Text(
                            '$headline',
                            softWrap: true,
                            maxLines: 3,
                          ),
                        ),
                      ],
                    ),
                  );
                }
                return LoadingScreen();
              },
            ),
          ),
          expanded: ExpandableButton(
            child: Column(
              children: [
                FutureBuilder(
                  future: getDownloadUrlFromUrlRef(context,
                      'gs://eradauti-nativ.appspot.com/29_martie_2021.jpg'),
                  builder: (_, AsyncSnapshot snapshot) {
                    if (snapshot.hasData) {
                      return Card(
                        child: Column(
                          children: [
                            Container(
                              width: MediaQuery.of(context).size.width,
                              child: snapshot.data,
                            ),
                            ListTile(
                              title: Text(
                                '$headline',
                                softWrap: true,
                                maxLines: 3,
                              ),
                            ),
                            ListTile(
                              leading: Icon(
                                Icons.people,
                                color: Colors.pinkAccent,
                              ),
                              title: Text('$host'),
                            ),
                            ListTile(
                              leading: Icon(
                                Icons.calendar_today,
                                color: Colors.blueAccent,
                              ),
                              title: Text('Data inceperii: ' +
                                  convertTimestampToDate(start)),
                            ),
                            ListTile(
                              leading: Icon(
                                Icons.calendar_today,
                                color: Colors.greenAccent,
                              ),
                              title: Text('Data finalizarii: ' +
                                  convertTimestampToDate(end)),
                            ),
                            ListTile(
                              leading: Icon(
                                Icons.location_pin,
                                color: Colors.redAccent,
                              ),
                              title: Text('$location \n$street'),
                            ),
                            ListTile(
                              leading: Icon(
                                Icons.message,
                                color: Colors.amberAccent,
                              ),
                              title: AutolinkText(
                                text: '$description',
                                textStyle: TextStyle(color: Colors.black),
                                linkStyle: TextStyle(color: Colors.pinkAccent),
                                humanize: true,
                                onWebLinkTap: (link) => debugPrint('$link'),
                              ),
                            )
                          ],
                        ),
                      );
                    }
                    return LoadingScreen();
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

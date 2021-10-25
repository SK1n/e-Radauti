import 'dart:ui';
import 'package:async/async.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:expandable/expandable.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_autolink_text/flutter_autolink_text.dart';
import 'package:flutterapperadauti/events_new/fetch_data.dart';
import 'package:flutterapperadauti/events_new/models/events.dart';
import 'package:flutterapperadauti/widgets/src/loading_screen_ui.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class NewEventWidget extends StatefulWidget {
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
  final Events snapshot;

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
    this.snapshot,
  }) : super(key: key);

  @override
  State<NewEventWidget> createState() => _NewEventWidgetState();
}

class _NewEventWidgetState extends State<NewEventWidget>
    with AutomaticKeepAliveClientMixin {
  final AsyncMemoizer dCMemorizer = AsyncMemoizer();
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

  String formatDateForImageOverlay(int timestamp, BuildContext context) {
    initializeDateFormatting('ro');
    var date = DateFormat('EEEEE dd/MM/yyyy HH:mm', 'ro')
        .format(DateTime.fromMillisecondsSinceEpoch(timestamp * 1000))
        .toUpperCase();
    return date;
  }

  @override
  Widget build(BuildContext context) {
    FetchData fetchData = Provider.of<FetchData>(context, listen: true);
    return ExpandableNotifier(
      child: ScrollOnExpand(
        child: ExpandablePanel(
          collapsed: ExpandableButton(
            child: FutureBuilder(
              future: dCMemorizer
                  .runOnce(() => getDownloadUrlFromUrlRef(context, widget.url)),
              builder: (_, AsyncSnapshot snapshot) {
                if (snapshot.hasData) {
                  return Card(
                    child: Column(
                      children: [
                        Stack(
                          alignment: Alignment.bottomLeft,
                          children: [
                            Container(
                              width: MediaQuery.of(context).size.width,
                              child: snapshot.data,
                            ),
                            Container(
                              color: Colors.white.withOpacity(0.8),
                              child: ListTile(
                                leading: Icon(
                                  Icons.circle,
                                  color: fetchData.getEventStatus(
                                      widget.start, widget.end),
                                ),
                                tileColor: Colors.white,
                                title: Text(
                                  formatDateForImageOverlay(
                                      widget.start, context),
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                          ],
                        ),
                        ListTile(
                          title: Text(
                            '${widget.headline}',
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
                  future: dCMemorizer.runOnce(
                      () => getDownloadUrlFromUrlRef(context, widget.url)),
                  builder: (_, AsyncSnapshot snapshot) {
                    if (snapshot.hasData) {
                      return Card(
                        child: Column(
                          children: [
                            Stack(
                              alignment: Alignment.bottomCenter,
                              children: [
                                Container(
                                  width: MediaQuery.of(context).size.width,
                                  child: snapshot.data,
                                ),
                              ],
                            ),
                            ListTile(
                              title: Text(
                                '${widget.headline}',
                                softWrap: true,
                                maxLines: 3,
                              ),
                            ),
                            ListTile(
                              leading: Icon(Icons.confirmation_number),
                              title: Text('Participanti'),
                            ),
                            ListTile(
                              leading: Icon(
                                Icons.people,
                                color: Colors.pinkAccent,
                              ),
                              title: Text('${widget.host}'),
                            ),
                            ListTile(
                              leading: Icon(
                                Icons.calendar_today,
                                color: Colors.blueAccent,
                              ),
                              title: Text('Data inceperii: ' +
                                  convertTimestampToDate(widget.start)),
                            ),
                            ListTile(
                              leading: Icon(
                                Icons.calendar_today,
                                color: Colors.greenAccent,
                              ),
                              title: Text('Data finalizarii: ' +
                                  convertTimestampToDate(widget.end)),
                            ),
                            ListTile(
                              leading: Icon(
                                Icons.location_pin,
                                color: Colors.redAccent,
                              ),
                              title:
                                  Text('${widget.location} \n${widget.street}'),
                            ),
                            ListTile(
                              leading: Icon(
                                Icons.message,
                                color: Colors.amberAccent,
                              ),
                              title: AutolinkText(
                                text: '${widget.description}',
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

  @override
  bool get wantKeepAlive => true;
}

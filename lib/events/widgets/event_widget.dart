import 'dart:io';
import 'dart:math';
import 'dart:ui';
import 'package:async/async.dart';
import 'package:timezone/data/latest.dart' as tz;
import 'package:timezone/timezone.dart' as tz;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:expandable/expandable.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_autolink_text/flutter_autolink_text.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutterapperadauti/events/fetch_data.dart';
import 'package:flutterapperadauti/events/models/events.dart';
import 'package:flutterapperadauti/widgets/src/loading_screen_ui.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class NewEventWidget extends StatefulWidget {
  final Events snapshot;
  final bool oldEvent;

  const NewEventWidget({
    Key key,
    this.snapshot,
    this.oldEvent = false,
  }) : super(key: key);

  @override
  State<NewEventWidget> createState() => _NewEventWidgetState();
}

class _NewEventWidgetState extends State<NewEventWidget>
    with AutomaticKeepAliveClientMixin {
  FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  Future<void> registerNotification(int id) async {
    tz.initializeTimeZones();
    tz.setLocalLocation(tz.getLocation('Europe/Bucharest'));
    AndroidNotificationDetails androidNotificationDetails =
        AndroidNotificationDetails(
            'channel ID', 'channel Name', 'channel Description',
            priority: Priority.high,
            importance: Importance.max,
            ticker: 'test');
    IOSNotificationDetails iosNotificationDetails = IOSNotificationDetails();
    DateTime currentTime = tz.TZDateTime.now(tz.local).add(
        DateTime.fromMillisecondsSinceEpoch(widget.snapshot.start * 1000)
            .difference(tz.TZDateTime.now(tz.local)));

    NotificationDetails notificationDetails = NotificationDetails(
        android: androidNotificationDetails, iOS: iosNotificationDetails);
    await flutterLocalNotificationsPlugin.zonedSchedule(
        id,
        '${widget.snapshot.headline}',
        '${widget.snapshot.description}',
        currentTime,
        notificationDetails,
        androidAllowWhileIdle: true,
        uiLocalNotificationDateInterpretation:
            UILocalNotificationDateInterpretation.absoluteTime,
        payload: 'events');
    debugPrint(id.toString());
  }

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

  Future<bool> hasEnabledNotification(int id) async {
    return await flutterLocalNotificationsPlugin
        .pendingNotificationRequests()
        .then((value) {
      return value.any((element) => element.id == id);
    });
  }

  @override
  Widget build(BuildContext context) {
    FetchData fetchData = Provider.of<FetchData>(context, listen: true);
    Future<bool> sendNotif = hasEnabledNotification(widget.snapshot.id);
    return ExpandableNotifier(
      child: ScrollOnExpand(
        child: ExpandablePanel(
          collapsed: ExpandableButton(
            child: FutureBuilder(
              future: getDownloadUrlFromUrlRef(context, widget.snapshot.url),
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
                              color: Colors.white.withOpacity(0.9),
                              child: ListTile(
                                leading: Icon(
                                  Icons.circle,
                                  color: fetchData.getEventStatus(
                                      widget.snapshot.start,
                                      widget.snapshot.end),
                                ),
                                tileColor: Colors.white,
                                title: Text(
                                  formatDateForImageOverlay(
                                      widget.snapshot.start, context),
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                          ],
                        ),
                        ListTile(
                          title: Text(
                            '${widget.snapshot.headline}',
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
                  future: dCMemorizer.runOnce(() =>
                      getDownloadUrlFromUrlRef(context, widget.snapshot.url)),
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
                                '${widget.snapshot.headline}',
                                softWrap: true,
                                maxLines: 3,
                              ),
                            ),
                            sendNotifSwitchListTile(fetchData, sendNotif),
                            ListTile(
                              leading: Icon(
                                Icons.people,
                                color: Colors.pinkAccent,
                              ),
                              title: Text('${widget.snapshot.host}'),
                            ),
                            ListTile(
                              leading: Icon(
                                Icons.calendar_today,
                                color: Colors.blueAccent,
                              ),
                              title: Text('Data inceperii: ' +
                                  convertTimestampToDate(
                                      widget.snapshot.start)),
                            ),
                            ListTile(
                              leading: Icon(
                                Icons.calendar_today,
                                color: Colors.greenAccent,
                              ),
                              title: Text('Data finalizarii: ' +
                                  convertTimestampToDate(widget.snapshot.end)),
                            ),
                            ListTile(
                              leading: Icon(
                                Icons.location_pin,
                                color: Colors.redAccent,
                              ),
                              title: Text(
                                  '${widget.snapshot.location} \n${widget.snapshot.street}'),
                            ),
                            ListTile(
                              leading: Icon(
                                Icons.message,
                                color: Colors.amberAccent,
                              ),
                              title: AutolinkText(
                                text: '${widget.snapshot.description}',
                                textStyle: TextStyle(color: Colors.black),
                                linkStyle: TextStyle(color: Colors.pinkAccent),
                                humanize: false,
                                onWebLinkTap: (link) =>
                                    launch(link, forceSafariVC: false),
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

  FutureBuilder sendNotifSwitchListTile(
      FetchData fetchData, Future<bool> sendNotif) {
    return FutureBuilder(
        future: sendNotif,
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            return !widget.oldEvent
                ? fetchData.getEventStatus(
                            widget.snapshot.start, widget.snapshot.end) ==
                        Colors.amberAccent
                    ? SwitchListTile(
                        value: snapshot.data,
                        secondary: Icon(
                          FontAwesome5.calendar_plus,
                          color: Colors.limeAccent,
                        ),
                        title: Text('Vreau sa primesc notificare'),
                        onChanged: (value) {
                          if (value) {
                            registerNotification(widget.snapshot.id);
                            setState(() {
                              sendNotif =
                                  hasEnabledNotification(widget.snapshot.id);
                            });
                            showDialog(
                              context: context,
                              builder: (BuildContext context) => Platform.isIOS
                                  ? CupertinoAlertDialog(
                                      title: Text('Notificare adaugata'),
                                      content: Text(
                                          'Veti fi notificat cand evenimentul incepe!'),
                                      actions: [
                                        TextButton(
                                          onPressed: () =>
                                              Navigator.pop(context),
                                          child: Text('OK'),
                                        )
                                      ],
                                    )
                                  : AlertDialog(
                                      title: Text('Notificare adaugata'),
                                      content: Text(
                                          'Veti fi notificat cand evenimentul incepe!'),
                                      actions: [
                                        TextButton(
                                          onPressed: () =>
                                              Navigator.pop(context),
                                          child: Text('OK'),
                                        )
                                      ],
                                    ),
                            );
                          } else {
                            showDialog(
                              context: context,
                              builder: (BuildContext context) => Platform.isIOS
                                  ? CupertinoAlertDialog(
                                      title: Text('Notificare a fost stearsa'),
                                      content: Text(
                                          'Nu veti mai fi notificat cand evenimentul incepe!'),
                                      actions: [
                                        TextButton(
                                          onPressed: () =>
                                              Navigator.pop(context),
                                          child: Text('OK'),
                                        )
                                      ],
                                    )
                                  : AlertDialog(
                                      title: Text('Notificare a fost stearsa'),
                                      content: Text(
                                          'Nu veti mai fi notificat cand evenimentul incepe!'),
                                      actions: [
                                        TextButton(
                                          onPressed: () =>
                                              Navigator.pop(context),
                                          child: Text('OK'),
                                        )
                                      ],
                                    ),
                            );
                            flutterLocalNotificationsPlugin
                                .cancel(widget.snapshot.id);
                            setState(() {
                              sendNotif =
                                  hasEnabledNotification(widget.snapshot.id);
                            });
                          }
                          hasEnabledNotification(widget.snapshot.id);
                        },
                      )
                    : Container()
                : Container();
          } else {
            return LoadingScreen();
          }
        });
  }

  @override
  bool get wantKeepAlive => true;
}

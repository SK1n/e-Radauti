import 'package:card_loading/card_loading.dart';
import 'package:flutter_loadingindicator/flutter_loadingindicator.dart';
import 'package:flutterapperadauti/controllers/download_image_controller.dart';
import 'package:flutterapperadauti/controllers/events_controller.dart';
import 'package:flutterapperadauti/modules/events/events_new/widgets/event_new_collapsed.dart';
import 'package:flutterapperadauti/modules/events/events_new/widgets/event_new_expanded.dart';
import 'package:futuristic/futuristic.dart';
import 'package:get/get.dart';

import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';

class EventsNewWidget extends StatelessWidget {
  final dynamic data;
  const EventsNewWidget({
    Key? key,
    this.data,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final DownloadImageController _downloadImageController = Get.find();
    final EventsController _eventsNewController = Get.find();
    debugPrint(data.toString());
    return Futuristic(
        futureBuilder: () => _downloadImageController
            .getDownloadUrlFromUrlRef(data['URL'].toString()),
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
        dataBuilder: (_, AsyncSnapshot snap) {
          return ExpandableNotifier(
            child: ScrollOnExpand(
              child: ExpandablePanel(
                collapsed: EventNewCollapsed(
                  imageUrl: snap.data,
                  headline: data['headline'],
                  timestamp: _eventsNewController.convertTimestampToDate(
                    data['start'],
                  ),
                ),
                expanded: EventNewExpanded(
                  description: data['description'],
                  location: data['location'],
                  street: data['street'],
                  imageUrl: snap.data,
                  headline: data['headline'],
                  host: data['host'],
                  start: _eventsNewController
                      .convertTimestampToDate(data['start']),
                  end: _eventsNewController.convertTimestampToDate(
                    data['end'],
                  ),
                ),
              ),
            ),
          );
        });
  }

  // FutureBuilder sendNotifSwitchListTile(
  //     FetchData fetchData, Future<bool> sendNotif) {
  //   return FutureBuilder(
  //       future: sendNotif,
  //       builder: (BuildContext context, AsyncSnapshot snapshot) {
  //         if (snapshot.hasData) {
  //           return !widget.oldEvent
  //               ? fetchData.getEventStatus(
  //                           widget.snapshot!.start!, widget.snapshot!.end!) ==
  //                       Colors.amberAccent
  //                   ? SwitchListTile(
  //                       value: snapshot.data,
  //                       secondary: Icon(
  //                         FontAwesome5.calendar_plus,
  //                         color: Colors.limeAccent,
  //                       ),
  //                       title: Text('Vreau sa primesc notificare'),
  //                       onChanged: (value) {
  //                         if (value) {
  //                           registerNotification(widget.snapshot!.id ?? 0);
  //                           setState(() {
  //                             sendNotif = hasEnabledNotification(
  //                                 widget.snapshot!.id ?? 0);
  //                           });
  //                           showDialog(
  //                             context: context,
  //                             builder: (BuildContext context) => Platform.isIOS
  //                                 ? CupertinoAlertDialog(
  //                                     title: Text('Notificare adaugata'),
  //                                     content: Text(
  //                                         'Veti fi notificat cand evenimentul incepe!'),
  //                                     actions: [
  //                                       TextButton(
  //                                         onPressed: () =>
  //                                             Navigator.pop(context),
  //                                         child: Text('OK'),
  //                                       )
  //                                     ],
  //                                   )
  //                                 : AlertDialog(
  //                                     title: Text('Notificare adaugata'),
  //                                     content: Text(
  //                                         'Veti fi notificat cand evenimentul incepe!'),
  //                                     actions: [
  //                                       TextButton(
  //                                         onPressed: () =>
  //                                             Navigator.pop(context),
  //                                         child: Text('OK'),
  //                                       )
  //                                     ],
  //                                   ),
  //                           );
  //                         } else {
  //                           showDialog(
  //                             context: context,
  //                             builder: (BuildContext context) => Platform.isIOS
  //                                 ? CupertinoAlertDialog(
  //                                     title: Text('Notificare a fost stearsa'),
  //                                     content: Text(
  //                                         'Nu veti mai fi notificat cand evenimentul incepe!'),
  //                                     actions: [
  //                                       TextButton(
  //                                         onPressed: () =>
  //                                             Navigator.pop(context),
  //                                         child: Text('OK'),
  //                                       )
  //                                     ],
  //                                   )
  //                                 : AlertDialog(
  //                                     title: Text('Notificare a fost stearsa'),
  //                                     content: Text(
  //                                         'Nu veti mai fi notificat cand evenimentul incepe!'),
  //                                     actions: [
  //                                       TextButton(
  //                                         onPressed: () =>
  //                                             Navigator.pop(context),
  //                                         child: Text('OK'),
  //                                       )
  //                                     ],
  //                                   ),
  //                           );
  //                           flutterLocalNotificationsPlugin
  //                               .cancel(widget.snapshot!.id ?? 0);
  //                           setState(() {
  //                             sendNotif = hasEnabledNotification(
  //                                 widget.snapshot!.id ?? 0);
  //                           });
  //                         }
  //                         hasEnabledNotification(widget.snapshot!.id ?? 0);
  //                       },
  //                     )
  //                   : Container()
  //               : Container();
  //         } else {
  //           return LoadingScreen();
  //         }
  //       });
  // }
}

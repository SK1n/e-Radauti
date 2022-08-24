import 'package:card_loading/card_loading.dart';
import 'package:flutter_loadingindicator/flutter_loadingindicator.dart';
import 'package:flutterapperadauti/controllers/download_image_controller.dart';
import 'package:flutterapperadauti/controllers/events_controller.dart';
import 'package:flutterapperadauti/modules/events/events_new/widgets/event_new_collapsed.dart';
import 'package:flutterapperadauti/modules/events/events_new/widgets/event_new_expanded.dart';
import 'package:flutterapperadauti/utils/futuristic.dart';
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
        useQuery: false,
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
}

import 'package:card_loading/card_loading.dart';
import 'package:flutterapperadauti/modules/events/controllers/events_controller.dart';
import 'package:flutterapperadauti/modules/events/views/new_events_collapsed_widget.dart';
import 'package:flutterapperadauti/modules/events/views/new_events_expanded_widget.dart';
import 'package:flutterapperadauti/utils/shared_widgets/futuristic.dart';
import 'package:flutterapperadauti/utils/helpers/get_image_url.dart';
import 'package:get/get.dart';

import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';

class NewEventsItemWidget extends StatelessWidget with GetImageUrl {
  final dynamic data;
  const NewEventsItemWidget({
    super.key,
    this.data,
  });

  @override
  Widget build(BuildContext context) {
    final EventsController eventsNewController = Get.find();
    return Futuristic(
        futureBuilder: () => getImageUrl(data['URL'].toString()),
        busyBuilder: (_) {
          return const CardLoading(
            height: 200,
            margin: EdgeInsets.only(bottom: 20),
            borderRadius: BorderRadius.all(
              Radius.circular(10),
            ),
          );
        },
        dataBuilder: (_, AsyncSnapshot snap) {
          return ExpandableNotifier(
            child: ScrollOnExpand(
              child: ExpandablePanel(
                collapsed: NewEventsCollapsedWidget(
                  imageUrl: snap.data,
                  headline: data['headline'],
                  timestamp: eventsNewController.convertTimestampToDate(
                    data['start'],
                  ),
                ),
                expanded: NewEventsExpandedWidget(
                  description: data['description'],
                  location: data['location'],
                  street: data['street'],
                  imageUrl: snap.data,
                  headline: data['headline'],
                  host: data['host'],
                  start:
                      eventsNewController.convertTimestampToDate(data['start']),
                  end: eventsNewController.convertTimestampToDate(
                    data['end'],
                  ),
                ),
              ),
            ),
          );
        });
  }
}

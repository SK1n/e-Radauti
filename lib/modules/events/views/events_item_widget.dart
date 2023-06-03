import 'package:flutterapperadauti/data/models/events/events_list_model.dart';
import 'package:flutterapperadauti/modules/events/controllers/events_controller.dart';
import 'package:flutterapperadauti/utils/shared_widgets/futuristic.dart';
import 'package:flutterapperadauti/utils/helpers/get_image_url.dart';
import 'package:get/get.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

extension TimestampToDate on num {
  String get getDate {
    DateFormat format = DateFormat('dd MMMM yyyy', 'ro');
    return format
        .format(DateTime.fromMillisecondsSinceEpoch(toInt() * 1000))
        .toUpperCase();
  }

  String get getHour {
    DateFormat format = DateFormat('HH:mm', 'ro');
    return format
        .format(DateTime.fromMillisecondsSinceEpoch(toInt() * 1000))
        .toUpperCase();
  }
}

class EventsItemWidget extends StatelessWidget {
  final EventsListModel data;
  const EventsItemWidget(
    this.data, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container();
    // return Futuristic(
    // initialBuilder: (_, __) => Container(),
    // futureBuilder: () => data.url,
    // busyBuilder: (_) => const LoadingWidget(),
    // dataBuilder: (_, snapshot) {
    // DateTime currentTime = DateTime.now();
    // DateTime eventStartTime = DateTime.fromMillisecondsSinceEpoch(
    //     (data!.start! * 1000).toInt());
    // DateTime eventEndTime =
    //     DateTime.fromMillisecondsSinceEpoch((data!.end! * 1000).toInt());
    // bool isEventActive = currentTime.isAfter(eventStartTime) &&
    //     currentTime.isBefore(eventEndTime);
    //     return Container();
    //   return ExpandableNotifier(
    //     child: ScrollOnExpand(
    //       child: ExpandablePanel(
    //         theme: const ExpandableThemeData(
    //             animationDuration: Duration(seconds: 1)),
    //         collapsed: EventsCollapsedWidget(
    //           imageUrl: snapshot as String,
    //           headline: data!.headline,
    //           timestamp: eventsNewController.convertTimestampToDate(
    //             data!.start!.toInt(),
    //           ),
    //           isActive: isEventActive,
    //         ),
    //         expanded: EventsExpandedWidget(
    //           description: data!.description,
    //           location: data!.location,
    //           street: data!.street,
    //           imageUrl: snapshot,
    //           headline: data!.headline,
    //           host: data!.host,
    //           start: eventsNewController
    //               .convertTimestampToDate(data!.start!.toInt()),
    //           end: eventsNewController.convertTimestampToDate(
    //             data!.end!.toInt(),
    //           ),
    //           isActive: isEventActive,
    //         ),
    //       ),
    //     ),

    // );
    // },
    // );
  }
}

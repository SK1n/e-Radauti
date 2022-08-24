import 'package:async/async.dart';
import 'package:flutter/material.dart';
import 'package:flutter_loadingindicator/flutter_loadingindicator.dart';
import 'package:flutterapperadauti/controllers/get_data_from_firebase_controller.dart';
import 'package:flutterapperadauti/modules/events/events_new/widgets/event_widget.dart';
import 'package:flutterapperadauti/utils/futuristic.dart';
import 'package:get/get.dart';

class NewEventsScreen extends StatelessWidget {
  const NewEventsScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final GetDataFromFirebaseController _getDataFromFirebaseController =
        Get.find();

    return Futuristic(
      futureBuilder: () =>
          _getDataFromFirebaseController.getSortedDataFromFirebase(
              document: 'Events', array: 'events', sortValue: 'start'),
      query: 'events',
      dataBuilder: (BuildContext context, AsyncSnapshot snapshot) {
        return ListView.builder(
            itemCount: _getDataFromFirebaseController
                .getLength(snapshot.data['events']),
            itemBuilder: (BuildContext context, int item) {
              return EventsNewWidget(
                data: snapshot.data['events'][item],
              );
            });
      },
    );
  }
}

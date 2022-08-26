import 'package:flutter/material.dart';
import 'package:flutterapperadauti/controllers/get_data_from_firebase_controller.dart';
import 'package:flutterapperadauti/modules/events/events_old/widgets/event_widget.dart';
import 'package:flutterapperadauti/utils/futuristic.dart';
import 'package:get/get.dart';

class OldEventsScreen extends StatelessWidget {
  const OldEventsScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final GetDataFromFirebaseController _getDataFromFirebaseController =
        Get.find();

    return Futuristic(
      futureBuilder: () =>
          _getDataFromFirebaseController.getSortedDataFromFirebase(
              document: 'OldEvents', array: 'oldEvents', sortValue: 'start'),
      query: 'oldEvents',
      dataBuilder: (BuildContext context, AsyncSnapshot snapshot) {
        return ListView.builder(
            itemCount: 30,
            itemBuilder: (BuildContext context, int item) {
              return EventsOldWidget(
                data: snapshot.data['oldEvents'][item],
              );
            });
      },
    );
  }
}

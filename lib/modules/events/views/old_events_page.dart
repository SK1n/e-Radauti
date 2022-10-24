import 'package:flutter/material.dart';
import 'package:flutterapperadauti/data/models/events/events_list_model.dart';
import 'package:flutterapperadauti/data/models/events/old_events_model.dart';
import 'package:flutterapperadauti/modules/events/controllers/events_controller.dart';
import 'package:flutterapperadauti/modules/events/views/old_events_item_widget.dart';
import 'package:flutterapperadauti/utils/shared_widgets/futuristic.dart';
import 'package:get/get.dart';

class OldEventsPage extends StatelessWidget {
  const OldEventsPage({super.key});
  @override
  Widget build(BuildContext context) {
    final EventsController eventsController = Get.find();

    return Futuristic(
      futureBuilder: () => eventsController.getData(
          convert: OldEventsModel.fromJson, document: 'OldEvents'),
      dataBuilder: (BuildContext context, AsyncSnapshot snapshot) {
        OldEventsModel data = snapshot.data;
        List<EventsListModel>? list = data.events!
          ..sort((e1, e2) => e2.start!.compareTo(e1.start!));
        return ListView.builder(
            shrinkWrap: true,
            //  physics: NeverScrollableScrollPhysics(),
            itemCount: 30,
            itemBuilder: (BuildContext context, int item) {
              return OldEventsItemWidget(
                data: list[item],
              );
            });
      },
    );
  }
}

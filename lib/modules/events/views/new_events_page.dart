import 'package:flutter/material.dart';
import 'package:flutterapperadauti/data/models/events/events_list_model.dart';
import 'package:flutterapperadauti/data/models/events/new_events_model.dart';
import 'package:flutterapperadauti/modules/events/controllers/events_controller.dart';
import 'package:flutterapperadauti/modules/events/views/new_events_item_widget.dart';
import 'package:flutterapperadauti/utils/shared_widgets/futuristic.dart';
import 'package:get/get.dart';

class NewEventsPage extends StatelessWidget {
  const NewEventsPage({super.key});
  @override
  Widget build(BuildContext context) {
    final EventsController controller = Get.find();

    return Futuristic(
      futureBuilder: () => controller.getData(
          convert: NewEventsModel.fromJson, document: 'Events'),
      dataBuilder: (BuildContext context, AsyncSnapshot snapshot) {
        NewEventsModel data = snapshot.data;
        List<EventsListModel>? list = data.events
          ?..sort((e1, e2) => e2.start!.compareTo(e1.start!));
        return ListView.builder(
            shrinkWrap: true,
            // physics: NeverScrollableScrollPhysics(),
            itemCount: list!.length,
            itemBuilder: (BuildContext context, int item) {
              return NewEventsItemWidget(
                data: list[item],
              );
            });
      },
    );
  }
}

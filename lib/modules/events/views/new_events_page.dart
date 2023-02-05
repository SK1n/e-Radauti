import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutterapperadauti/data/models/events/events_list_model.dart';
import 'package:flutterapperadauti/data/models/events/new_events_model.dart';
import 'package:flutterapperadauti/modules/events/controllers/events_controller.dart';
import 'package:flutterapperadauti/modules/events/views/events_item_widget.dart';
import 'package:flutterapperadauti/utils/shared_widgets/futuristic.dart';
import 'package:get/get.dart';

class NewEventsPage extends StatelessWidget {
  const NewEventsPage({super.key});
  @override
  Widget build(BuildContext context) {
    final EventsController controller = Get.find();
    return SafeArea(
      child: Futuristic(
        initialBuilder: (_, __) => Container(),
        futureBuilder: () => controller.getData(
          collection: !kDebugMode ? 'test' : 'collection',
          convert: NewEventsModel.fromJson,
          document: 'Events',
        ),
        dataBuilder: (BuildContext context, snapshot) {
          NewEventsModel data = snapshot as NewEventsModel;
          List<EventsListModel>? list = data.events
            ?..sort(
              (e1, e2) => e2.start!.compareTo(
                e1.start!,
              ),
            );
          return ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: list!.length,
              itemBuilder: (BuildContext context, int item) {
                return EventsItemWidget(
                  data: list[item],
                );
              });
        },
      ),
    );
  }
}

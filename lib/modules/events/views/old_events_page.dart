import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterapperadauti/data/models/events/events_list_model.dart';
import 'package:flutterapperadauti/data/models/events/old_events_model.dart';
import 'package:flutterapperadauti/modules/events/controllers/events_controller.dart';
import 'package:flutterapperadauti/modules/events/views/events_item_widget.dart';
import 'package:flutterapperadauti/utils/shared_widgets/futuristic.dart';
import 'package:get/get.dart';

class OldEventsPage extends StatelessWidget {
  const OldEventsPage({super.key});
  @override
  Widget build(BuildContext context) {
    final EventsController eventsController = Get.find();

    return Futuristic(
      initialBuilder: (_, __) => Container(),
      futureBuilder: () => eventsController.getOldEventsList(),
      dataBuilder: (BuildContext context, snapshot) {
        List<EventsListModel> data = snapshot as List<EventsListModel>;

        return CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: 30,
                  itemBuilder: (BuildContext context, int item) {
                    return EventsItemWidget(
                      data[item],
                    );
                  }),
            ),
          ],
        );
      },
    );
  }
}

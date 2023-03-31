import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutterapperadauti/data/models/events/events_list_model.dart';
import 'package:flutterapperadauti/modules/events/controllers/events_controller.dart';
import 'package:flutterapperadauti/modules/events/views/events_details.dart';
import 'package:flutterapperadauti/modules/events/views/events_item_widget.dart';
import 'package:flutterapperadauti/utils/shared_widgets/futuristic.dart';
import 'package:get/get.dart';

class FavoritesEventsPage extends StatelessWidget {
  const FavoritesEventsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final EventsController eventsController = Get.find();
    return Futuristic(
      futureBuilder: () => eventsController.getFavoritesEvents(),
      initialBuilder: (_, __) => Container(),
      dataBuilder: (context, snapshot) {
        List<EventsListModel> data = snapshot as List<EventsListModel>;
        return CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: data.length,
                itemBuilder: (BuildContext context, int item) {
                  return EventsItemWidget(
                    data[item],
                  );
                },
              ),
            ),
          ],
        );
      },
    );
  }
}

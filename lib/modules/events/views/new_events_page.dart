import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterapperadauti/data/models/events/events_list_model.dart';
import 'package:flutterapperadauti/modules/events/controllers/events_controller.dart';
import 'package:flutterapperadauti/modules/events/views/events_item_widget.dart';
import 'package:flutterapperadauti/utils/loading_widget.dart';
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
        futureBuilder: () => controller.getEventsList(),
       
        dataBuilder: (BuildContext context, snapshot) {
          List<EventsListModel> list = snapshot as List<EventsListModel>;
          return ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: list.length,
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

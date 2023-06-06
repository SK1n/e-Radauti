// ignore_for_file: depend_on_referenced_packages

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutterapperadauti/data/models/events/events_item_model.dart';
import 'package:flutterapperadauti/data/models/events/new_events_model.dart';
import 'package:flutterapperadauti/utils/base_controller.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_notifier.dart';

class NewEventsController extends BaseController<List<EventsItemModel>> {
  Future<void> getEvents() async {
    change(GetStatus.loading());
    futurize(() async {
      DocumentReference dr = fireRepo.firestore.doc('collection/Events');
      NewEventsModel data = await fireRepo.getDocument(
        document: dr,
        convert: NewEventsModel.fromJson,
      );
      List<EventsItemModel> sortedList = data.events;
      for (EventsItemModel item in sortedList) {
        item.url = await fireRepo.getImageUrl(item.url);
      }
      sortedList.sort((a, b) => a.start.compareTo(b.start));
      return sortedList;
    });
  }

  @override
  void onReady() async {
    await getEvents();
    super.onReady();
  }
}

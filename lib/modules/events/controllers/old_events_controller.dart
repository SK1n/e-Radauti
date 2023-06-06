import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutterapperadauti/data/models/events/events_item_model.dart';
import 'package:flutterapperadauti/data/models/events/old_events_model.dart';
import 'package:flutterapperadauti/utils/base_controller.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_notifier.dart';

class OldEventsController extends BaseController<List<EventsItemModel>> {
  Future<void> getEvents() async {
    change(GetStatus.loading());
    futurize(() async {
      DocumentReference dr = fireRepo.firestore.doc('collection/OldEvents');
      OldEventsModel data = await fireRepo.getDocument(
        document: dr,
        convert: OldEventsModel.fromJson,
      );
      List<EventsItemModel> sortedList =
          data.events.sublist(data.events.length - 11, data.events.length - 1);
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

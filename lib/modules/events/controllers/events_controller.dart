// ignore_for_file: depend_on_referenced_packages

import 'package:flutterapperadauti/data/models/events/events_list_model.dart';
import 'package:flutterapperadauti/data/models/events/new_events_model.dart';
import 'package:flutterapperadauti/utils/helpers/get_data_firebase.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class EventsController extends GetxController with GetDataFirebase {
  String convertTimestampToDate(int timestamp) {
    var format = DateFormat('dd/MM/yyyy HH:mm');
    var time =
        format.format(DateTime.fromMillisecondsSinceEpoch(timestamp * 1000));
    return time;
  }

  Future<List<EventsListModel>> getEventsList() async {
    await Future.delayed(const Duration(seconds: 10));
    NewEventsModel data = await getData(
      document: 'Events',
      convert: NewEventsModel.fromJson,
    );
    List<EventsListModel>? sortedList = data.events;
    sortedList!.sort((a, b) => a.start!.compareTo(b.start!));
    return sortedList;
  }
}

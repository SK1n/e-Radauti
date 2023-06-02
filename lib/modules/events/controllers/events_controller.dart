// ignore_for_file: depend_on_referenced_packages

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutterapperadauti/controllers/dao_controller.dart';
import 'package:flutterapperadauti/dao/app_database.dart';
import 'package:flutterapperadauti/dao/events_dao.dart';
import 'package:flutterapperadauti/data/models/events/events_list_model.dart';
import 'package:flutterapperadauti/data/models/events/new_events_model.dart';
import 'package:flutterapperadauti/data/models/events/old_events_model.dart';
import 'package:flutterapperadauti/utils/helpers/get_data_firebase.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class EventsController extends GetxController
    with GetDataFirebase, GetSingleTickerProviderStateMixin {
  final DaoController daoController = Get.find();
  late final TabController tabController;

  final _eventExists = false.obs;
  get eventExists => _eventExists.value;
  set eventExists(value) => _eventExists.value = value;

  String convertTimestampToDate(int timestamp) {
    var format = DateFormat('dd/MM/yyyy HH:mm');
    var time =
        format.format(DateTime.fromMillisecondsSinceEpoch(timestamp * 1000));
    return time;
  }

  Future<List<EventsListModel>> getNewEventsList() async {
    NewEventsModel data = await getData(
      document: 'Events',
      convert: NewEventsModel.fromJson,
    );
    List<EventsListModel> sortedList = data.events;
    sortedList.sort((a, b) => a.start.compareTo(b.start));
    return sortedList;
  }

  Future<List<EventsListModel>> getOldEventsList() async {
    OldEventsModel data = await getData(
      document: 'OldEvents',
      convert: OldEventsModel.fromJson,
    );
    List<EventsListModel> sortedList = data.events;
    sortedList.sort((a, b) => b.start.compareTo(a.start));
    return sortedList;
  }

  Future<List<EventsListModel>> getFavoritesEvents() async =>
      await daoController.eventsDao.getSavedEvents();

  Future<bool?> eventIsFavorite(EventsListModel event) async {
    return await daoController.eventsDao.eventsIsFavorite(event.id!);
  }

  Future<void> removeEvent(EventsListModel event) async {
    await daoController.eventsDao.deleteEvent(event);
  }

  insertEvent(EventsListModel event) {
    daoController.eventsDao.insertEvent(event);
    var events = daoController.eventsDao.getSavedEvents;
    debugPrint(events.toString());
  }

  @override
  void onInit() {
    tabController = TabController(length: 3, vsync: this);
    super.onInit();
  }
}

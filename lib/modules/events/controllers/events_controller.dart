// ignore_for_file: depend_on_referenced_packages

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutterapperadauti/controllers/dao_controller.dart';
import 'package:flutterapperadauti/data/models/events/events_list_model.dart';
import 'package:flutterapperadauti/data/models/events/new_events_model.dart';
import 'package:flutterapperadauti/data/models/events/old_events_model.dart';
import 'package:flutterapperadauti/utils/base_controller.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class EventsController extends BaseController
    with GetSingleTickerProviderStateMixin {
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
    DocumentReference dr = fireRepo.firestore.doc('collection/Events');
    NewEventsModel data = await fireRepo.getDocument(
      document: dr,
      convert: NewEventsModel.fromJson,
    );
    List<EventsListModel> sortedList = data.events;
    sortedList.sort((a, b) => a.start.compareTo(b.start));
    return sortedList;
  }

  Future<List<EventsListModel>> getOldEventsList() async {
    DocumentReference dr = fireRepo.firestore.doc('collection/OldEvents');
    OldEventsModel data = await fireRepo.getDocument(
      document: dr,
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

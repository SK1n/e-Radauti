import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutterapperadauti/events/models/events.dart';

class FetchData {
  FirebaseFirestore? _instance;
  List<Events> _events = [];

  Future<List<Events>> getEventsFromFirebase() async {
    _instance = FirebaseFirestore.instance;
    _events = [];
    CollectionReference events = _instance!.collection('collection');
    DocumentSnapshot snapshot = await events.doc('Events').get();
    var data = snapshot.data() as Map;
    var eventsData = data['events'] as List<dynamic>;
    eventsData.forEach((element) {
      _events.add(Events.fromJson(element));
    });
    debugPrint('data fetched');
    return _events.reversed.toList();
  }

  int getLength() {
    return _events.length;
  }

  Color getEventStatus(int startTimestamp, int endTimestamp) {
    DateTime currentDate = DateTime.now();
    if (currentDate.isAfter(
            DateTime.fromMillisecondsSinceEpoch(startTimestamp * 1000)) &&
        currentDate.isBefore(
            DateTime.fromMillisecondsSinceEpoch(endTimestamp * 1000))) {
      return Colors.greenAccent;
    } else if (currentDate
        .isBefore(DateTime.fromMillisecondsSinceEpoch(startTimestamp * 1000))) {
      return Colors.amberAccent;
    }
    return Colors.redAccent;
  }
}

// now start end
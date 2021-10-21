import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutterapperadauti/events_new/models/events.dart';

class FetchData {
  FirebaseFirestore _instance;
  List<Events> _events = [];

  Future<void> getEventsFromFirebase() async {
    _instance = FirebaseFirestore.instance;

    CollectionReference events = _instance.collection('collection');
    DocumentSnapshot snapshot = await events.doc('0').get();
    var data = snapshot.data() as Map;
    var eventsData = data['events'] as List<dynamic>;
    eventsData.forEach((element) {
      _events.add(Events.fromJson(element));
    });
    return _events;
  }
}

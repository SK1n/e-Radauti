import 'dart:convert';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'package:firebase_database/firebase_database.dart';

class EventApp {
  final String imagePath,
      title,
      description,
      location,
      day,
      month,
      hour,
      organization,
      categoryName,
      nrParticipants,
      startDate,
      endDate,
      eventKey;
  final int dayT, monthT, yearT, hourT, minuteT;

  EventApp({
    this.imagePath,
    this.title,
    this.description,
    this.location,
    this.day,
    this.month,
    this.dayT,
    this.monthT,
    this.yearT,
    this.hourT,
    this.minuteT,
    this.hour,
    this.organization,
    this.categoryName,
    this.nrParticipants,
    this.startDate,
    this.endDate,
    this.eventKey,
  });
}

//2
Future<List> fetchListEvent() async {
  //
  Map<String, dynamic> fd;
  http.Response r = await http
      .get(Uri.parse('https://e-radauti-80139.firebaseio.com/-Events.json'));
  fd = json.decode(r.body);

  final List<EventApp> children = <EventApp>[];
  final List<EventApp> children2 = <EventApp>[];

  String imageLink1;
  imageLink1 =
      'https://firebasestorage.googleapis.com/v0/b/e-radauti-80139.appspot.com/o/';
  String imageLink2;
  imageLink2 = '?alt=media&token=1a429f07-6cef-4de2-940f-0f839b2db3ff';

  final regExp = RegExp(r'gs://e-radauti-80139.appspot.com/');

  fd.forEach((key, value) {
    children.add(
      new EventApp(
        imagePath:
            imageLink1 + value['imageUrl'].replaceAll(regExp, '') + imageLink2,
        title: value['headline'],
        description: value['descriere'],
        location: value['localitatea'] + ', ' + value['strada'],
        day: value['ziua'].toString(),
        month: value['luna'].toString(),
        minuteT: value['endminute'],
        hourT: value['endora'],
        dayT: value['ziua'],
        monthT: value['endluna'],
        yearT: value['endan'],
        hour: value['ora'].toString(),
        organization: value['organizator'].toString(),
        categoryName: value['categoria'],
        nrParticipants: value['nrPeople'].toString(),
        startDate: value['dataStart'],
        endDate: value['dataFinal'],
        eventKey: key.toString(),
      ),
    );
  });

  for (int i = children.length - 1; i >= 0; i--) {
    children2.add(
      children[i],
    );
  }

  return children2;
}

//3
Future<List> fetchListNewEvent() async {
  //
  Map<String, dynamic> fd;
  http.Response r = await http
      .get(Uri.parse('https://e-radauti-80139.firebaseio.com/-Events.json'));
  fd = json.decode(r.body);

  final List<EventApp> children = <EventApp>[];

  String imageLink1;
  imageLink1 =
      'https://firebasestorage.googleapis.com/v0/b/e-radauti-80139.appspot.com/o/';
  String imageLink2;
  imageLink2 = '?alt=media&token=1a429f07-6cef-4de2-940f-0f839b2db3ff';

  final regExp = RegExp(r'gs://e-radauti-80139.appspot.com/');

  fd.forEach((key, value) {
    children.add(
      new EventApp(
        imagePath:
            imageLink1 + value['imageUrl'].replaceAll(regExp, '') + imageLink2,
        title: value['headline'],
        description: value['descriere'],
        location: value['localitatea'] + ', ' + value['strada'],
        day: value['ziua'].toString(),
        month: value['luna'].toString(),
        minuteT: value['endminute'],
        hourT: value['endora'],
        dayT: value['ziua'],
        monthT: value['endluna'],
        yearT: value['endan'],
        hour: value['ora'].toString(),
        organization: value['organizator'].toString(),
        categoryName: value['categoria'],
        nrParticipants: value['nrPeople'].toString(),
        startDate: value['dataStart'],
        endDate: value['dataFinal'],
        eventKey: key.toString(),
      ),
    );
  });

  return children;
}

var databaseReference = FirebaseDatabase.instance.reference();
void updateDataFirebase(EventApp eventApp) {
  databaseReference
      .child('-Events')
      .child(eventApp.eventKey)
      .once()
      .then((DataSnapshot snapshot) {
    databaseReference
        .child('-Events')
        .child(eventApp.eventKey)
        .update({'nrPeople': snapshot.value['nrPeople'] + 1});
  });
}

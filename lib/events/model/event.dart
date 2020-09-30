import 'dart:convert';
import 'package:http/http.dart' as http;
import 'dart:async';

class EventApp {
  //final String imagePath, title, description, location, duration, punchLine1, punchLine2;
  final String imagePath,
      title,
      description,
      location,
      day,
      month,
      hour,
      organization,
      categoryName,
      nrParticipants;
  final int dayT, monthT, yearT, hourT, minuteT;
  final List categoryIds, galleryImages;

  EventApp(
      {this.imagePath,
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
      this.categoryIds,
      this.galleryImages});
}

//3
Future<List> fetchListEvent() async {
  //
  Map<String, dynamic> fd;
  http.Response r =
      await http.get('https://e-radauti-80139.firebaseio.com/-Events.json');
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
        imagePath: imageLink1 +
            value['imageUrl'].replaceAll(regExp, '') +
            imageLink2, //'https://firebasestorage.googleapis.com/v0/b/e-radauti-80139.appspot.com/o/01-Nebunie-de-comedie-Radauti.jpg?alt=media&token=1a429f07-6cef-4de2-940f-0f839b2db3ff', //value['imageUrl'], //data['imageUrl'], //data['url'], //fd[0]['url'], //"assets/event_images/5_km_downtown_run.jpg",
        title: value[
            'headline'], //data['headline'], //data['title'], //fd[0]['title'], //"5 Kilometer Downtown Run " +
        description:
            value['descriere'], //value['categoria'], //"Marathon!", //"",
        location: value['localitatea'] +
            ',' +
            ' ' +
            value[
                'strada'], //data['localitatea'] + ', ' + data['strada'], //data['subtitle'], //fd[0]['subtitle'], //"Pleasant Park"
        day: value['ziua'].toString(),
        month: value['luna'].toString(),
        minuteT: value['endminute"'],
        hourT: value['endora'],
        dayT: value['ziua'],
        monthT: value['endluna'],
        yearT: value['endan'],
        hour: value['ora']
            .toString(), //data['ora'].toString(),  //data['ora'].toString() + ':' + data['minutele'].toString(), //fd[0]['ora'].toString() + 'h', //"3h"
        organization: value['organizator']
            .toString(), //data['ziua'].toString(), //data['data'].toString(), //"Marathon!",
        categoryName: value[
            'categoria'], //data['luna'].toString(), //data['luna'].toString(), //"The latest fad in foodology, get the inside scoup.",
        nrParticipants: value['nrPeople'].toString(),
        categoryIds: [0, 1],
        galleryImages: [],
      ),
    );
  });

  for (int i = children.length - 1; i >= 0; i--) {
    children2.add(
      children[i],
    );
  }

  //return events;
  //return children;
  return children2;
}

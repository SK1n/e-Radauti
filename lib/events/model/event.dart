import 'dart:convert';
import 'package:http/http.dart' as http;
import 'dart:async';

class Event {
  final String imagePath, title, description, location, duration, punchLine1, punchLine2;
  final List categoryIds, galleryImages;

  Event(
      {this.imagePath,
      this.title,
      this.description,
      this.location,
      this.duration,
      this.punchLine1,
      this.punchLine2,
      this.categoryIds,
      this.galleryImages});
}

class Event2 {
  //final String imagePath, title, description, location, duration, punchLine1, punchLine2;
  final String imagePath, title, description, location, day, month, hour, organization, categoryName;
  final List categoryIds, galleryImages;

  Event2(
      {this.imagePath,
        this.title,
        this.description,
        this.location,
        this.day,
        this.month,
        this.hour,
        this.organization,
        this.categoryName,
        this.categoryIds,
        this.galleryImages});
}

//2
Future<List> fetchList() async {
  //
  List fd;
  http.Response r = await http.get('https://data-a2c86.firebaseio.com/items.json');
  fd = json.decode(r.body);

  //
  final fiveKmRunEvent = Event(
    imagePath: fd[0]['url'],//"assets/event_images/5_km_downtown_run.jpg",
    title: fd[0]['title'], //"5 Kilometer Downtown Run " +
    description:"",
    location:fd[0]['subtitle'], //"Pleasant Park"
    duration: fd[0]['ora'].toString() + 'h',//"3h"
    punchLine1:"Marathon!",
    punchLine2:"The latest fad in foodology, get the inside scoup.",
    categoryIds:[0,1],
    galleryImages: [],);

  final cookingEvent = Event(
      imagePath: fd[1]['url'],//"assets/event_images/granite_cooking_class.jpg",
      title: fd[1]['title'],//collection[1]['subject']  "Granite Cooking Class " +
      description: "Guest list fill up fast so be sure to apply before handto secure a spot.",
      location: fd[1]['subtitle'] , //"Food Court Avenue"
      duration: fd[1]['ora'].toString() + 'h', //"4h"
      punchLine1: "Granite Cooking",
      punchLine2: "The latest fad in foodology, get the inside scoup.",
      categoryIds: [0, 2],
      galleryImages: ["assets/event_images/cooking_1.jpg", "assets/event_images/cooking_2.jpg", "assets/event_images/cooking_3.jpg"]);

  //final events = [fiveKmRunEvent, cookingEvent, musicConcert, golfCompetition, eveniment2, ev2];
  final events = [fiveKmRunEvent, cookingEvent];

  return events;
}

//3
Future<List> fetchList2() async {
  //
  //List fd;
  //http.Response r = await http.get('https://data-a2c86.firebaseio.com/items.json');
  //fd = json.decode(r.body);
  //https://e-radauti-80139.firebaseio.com/-Events.json
  //Map<String, dynamic> events;
  Map<String, dynamic> fd;
  //Map<String, dynamic> myMap = json.decode(jsonStr);
  http.Response r = await http.get('https://e-radauti-80139.firebaseio.com/-Events.json');
  fd = json.decode(r.body);

  //
  /*for (var i = 0; i < 10; i++) {
    children.add(new ListTile());
  }*/
  //final children = <Widget>[];
  //final List<Event> children = <Event>[]; //final children = <Widget>[];
  //final List<Event> children2 = <Event>[];
  final List<Event2> children = <Event2>[];
  final List<Event2> children2 = <Event2>[];

  /*for (final data in fd) {
    //children.add(new ListTile());
    children.add(
        //new ListTile()
        new Event(
          imagePath: data['url'], //fd[0]['url'], //"assets/event_images/5_km_downtown_run.jpg",
          title: data['title'], //fd[0]['title'], //"5 Kilometer Downtown Run " +
          description: "Marathon!", //"",
          location: data['subtitle'], //fd[0]['subtitle'], //"Pleasant Park"
          duration: data['ora'].toString() + ':' + data['minutele'].toString(), //fd[0]['ora'].toString() + 'h', //"3h"
          punchLine1: data['data'].toString(), //"Marathon!",
          punchLine2: data['luna'].toString(), //"The latest fad in foodology, get the inside scoup.",
          categoryIds:[0,1],
          galleryImages: [],)
    );
  }*/

  /*
  for (final data in fd) {
    //children.add(new ListTile());
    children.add(
        //new ListTile()
        new Event(
          imagePath: data['imageUrl'], //data['url'], //fd[0]['url'], //"assets/event_images/5_km_downtown_run.jpg",
          title: data['headline'], //data['title'], //fd[0]['title'], //"5 Kilometer Downtown Run " +
          description: "Marathon!", //"",
          location: data['localitatea'] + ', ' + data['strada'], //data['subtitle'], //fd[0]['subtitle'], //"Pleasant Park"
          duration: data['ora'].toString(),  //data['ora'].toString() + ':' + data['minutele'].toString(), //fd[0]['ora'].toString() + 'h', //"3h"
          punchLine1: data['ziua'].toString(), //data['data'].toString(), //"Marathon!",
          punchLine2: data['luna'].toString(), //data['luna'].toString(), //"The latest fad in foodology, get the inside scoup.",
          categoryIds:[0,1],
          galleryImages: [],)
    );
  }
   */

  /*countriesData.countries.forEach((value) {
    list.add(value['name']);
  });*/
  /*List<String> list = [];
  fd.forEach((value) {
    list.add(value['name']);
  });*/

  List<String> list = [];
  String imageLink1;
  imageLink1 = 'https://firebasestorage.googleapis.com/v0/b/e-radauti-80139.appspot.com/o/';
  String imageLink2;
  imageLink2 = '?alt=media&token=1a429f07-6cef-4de2-940f-0f839b2db3ff';

  final regExp = RegExp(r'gs://e-radauti-80139.appspot.com/');

  fd.forEach((key, value) {
    key; //print(key);
    /*(value as Map<String, dynamic>).forEach((key2, value2) {
      print(key2);
      print(value2);
    });*/

    //list.add(value['name']);
    //list.add(value['categoria']);

    children.add(
      //new ListTile()
        /*new Event(
          imagePath: 'https://firebasestorage.googleapis.com/v0/b/e-radauti-80139.appspot.com/o/01-Nebunie-de-comedie-Radauti.jpg?alt=media&token=1a429f07-6cef-4de2-940f-0f839b2db3ff', //value['imageUrl'], //data['imageUrl'], //data['url'], //fd[0]['url'], //"assets/event_images/5_km_downtown_run.jpg",
          title: value['headline'], //data['headline'], //data['title'], //fd[0]['title'], //"5 Kilometer Downtown Run " +
          description: value['categoria'], //"Marathon!", //"",
          location: value['localitatea'], // + ', ' + value['strada'], //data['localitatea'] + ', ' + data['strada'], //data['subtitle'], //fd[0]['subtitle'], //"Pleasant Park"
          duration: value['ora'].toString(), //data['ora'].toString(),  //data['ora'].toString() + ':' + data['minutele'].toString(), //fd[0]['ora'].toString() + 'h', //"3h"
          punchLine1: value['ziua'].toString(), //data['ziua'].toString(), //data['data'].toString(), //"Marathon!",
          punchLine2: value['luna'].toString(), //data['luna'].toString(), //data['luna'].toString(), //"The latest fad in foodology, get the inside scoup.",
          categoryIds:[0,1],
          galleryImages: [],),*/

        new Event2(
          imagePath: imageLink1 + value['imageUrl'].replaceAll(regExp, '') + imageLink2, //'https://firebasestorage.googleapis.com/v0/b/e-radauti-80139.appspot.com/o/01-Nebunie-de-comedie-Radauti.jpg?alt=media&token=1a429f07-6cef-4de2-940f-0f839b2db3ff', //value['imageUrl'], //data['imageUrl'], //data['url'], //fd[0]['url'], //"assets/event_images/5_km_downtown_run.jpg",
          title: value['headline'], //data['headline'], //data['title'], //fd[0]['title'], //"5 Kilometer Downtown Run " +
          description: value['descriere'],//value['categoria'], //"Marathon!", //"",
          location: value['localitatea'] + ',' +' ' + value['strada'], //data['localitatea'] + ', ' + data['strada'], //data['subtitle'], //fd[0]['subtitle'], //"Pleasant Park"
          day: value['ziua'].toString(),
          month: value['luna'].toString(),
          hour: value['ora'].toString(), //data['ora'].toString(),  //data['ora'].toString() + ':' + data['minutele'].toString(), //fd[0]['ora'].toString() + 'h', //"3h"
          organization: value['organizator'].toString(), //data['ziua'].toString(), //data['data'].toString(), //"Marathon!",
          categoryName: value['categoria'], //data['luna'].toString(), //data['luna'].toString(), //"The latest fad in foodology, get the inside scoup.",
          categoryIds:[0,1],
          galleryImages: [],),
        /*Event2(
            {this.imagePath,
              this.title,
              this.description,
              this.location,
              this.day,
              this.month,
              this.hour,
              this.organization,
              this.categoryName,
              this.categoryIds,
              this.galleryImages});*/

    );

  });

  for(int i = children.length-1; i >= children.length-1-9; i--){
    children2.add(
      //new ListTile()
        /*new Event(
          imagePath: 'https://firebasestorage.googleapis.com/v0/b/e-radauti-80139.appspot.com/o/01-Nebunie-de-comedie-Radauti.jpg?alt=media&token=1a429f07-6cef-4de2-940f-0f839b2db3ff', //value['imageUrl'], //data['imageUrl'], //data['url'], //fd[0]['url'], //"assets/event_images/5_km_downtown_run.jpg",
          title: value['headline'], //data['headline'], //data['title'], //fd[0]['title'], //"5 Kilometer Downtown Run " +
          description: value['categoria'], //"Marathon!", //"",
          location: value['localitatea'], // + ', ' + value['strada'], //data['localitatea'] + ', ' + data['strada'], //data['subtitle'], //fd[0]['subtitle'], //"Pleasant Park"
          duration: value['ora'].toString(), //data['ora'].toString(),  //data['ora'].toString() + ':' + data['minutele'].toString(), //fd[0]['ora'].toString() + 'h', //"3h"
          punchLine1: value['ziua'].toString(), //data['ziua'].toString(), //data['data'].toString(), //"Marathon!",
          punchLine2: value['luna'].toString(), //data['luna'].toString(), //data['luna'].toString(), //"The latest fad in foodology, get the inside scoup.",
          categoryIds:[0,1],
          galleryImages: [],)*/
        children[i],
    );
  }

  /*for (final data in list) {
    //children.add(new ListTile());
    children.add(
      //new ListTile()
        new Event(
          imagePath: 'https://firebasestorage.googleapis.com/v0/b/e-radauti-80139.appspot.com/o/01-Nebunie-de-comedie-Radauti.jpg?alt=media&token=1a429f07-6cef-4de2-940f-0f839b2db3ff', //data, //data['imageUrl'], //data['url'], //fd[0]['url'], //"assets/event_images/5_km_downtown_run.jpg",
          title: data, //data['headline'], //data['title'], //fd[0]['title'], //"5 Kilometer Downtown Run " +
          description: "Marathon!", //"",
          location: data, //data['localitatea'] + ', ' + data['strada'], //data['subtitle'], //fd[0]['subtitle'], //"Pleasant Park"
          duration: data, //data['ora'].toString(),  //data['ora'].toString() + ':' + data['minutele'].toString(), //fd[0]['ora'].toString() + 'h', //"3h"
          punchLine1: data, //data['ziua'].toString(), //data['data'].toString(), //"Marathon!",
          punchLine2: data, //data['luna'].toString(), //data['luna'].toString(), //"The latest fad in foodology, get the inside scoup.",
          categoryIds:[0,1],
          galleryImages: [],)
    );
  }*/


  /*for (Map<String, dynamic> data in responseJson) {
    _counter++;

    coords.putIfAbsent("Test $_counter", () => new LatLng(double.parse(data['lat'].toString()),  double.parse(data['long'].toString())));
    list.add(coords);
    loading=false;
  }*/

  /*for (Map<String, dynamic> data in fd) { //responseJson
    /*_counter++;

    coords.putIfAbsent("Test $_counter", () => new LatLng(double.parse(data['lat'].toString()),  double.parse(data['long'].toString())));
    list.add(coords);
    loading=false;*/

  }*/

  /*void iterateJson(String jsonStr) {
    Map<String, dynamic> myMap = json.decode(jsonStr);
    List<dynamic> entitlements = myMap["Dependents"][0]["Entitlements"];
    entitlements.forEach((entitlement) {
      (entitlement as Map<String, dynamic>).forEach((key, value) {
        print(key);
        (value as Map<String, dynamic>).forEach((key2, value2) {
          print(key2);
          print(value2);
        });
      });
    });
  }*/

  //
  /*final fiveKmRunEvent = Event(
    imagePath: fd[0]['url'],//"assets/event_images/5_km_downtown_run.jpg",
    title: fd[0]['title'], //"5 Kilometer Downtown Run " +
    description:"",
    location:fd[0]['subtitle'], //"Pleasant Park"
    duration: fd[0]['ora'].toString() + 'h',//"3h"
    punchLine1:"Marathon!",
    punchLine2:"The latest fad in foodology, get the inside scoup.",
    categoryIds:[0,1],
    galleryImages: [],);

  final cookingEvent = Event(
      imagePath: fd[1]['url'],//"assets/event_images/granite_cooking_class.jpg",
      title: fd[1]['title'],//collection[1]['subject']  "Granite Cooking Class " +
      description: "Guest list fill up fast so be sure to apply before handto secure a spot.",
      location: fd[1]['subtitle'] , //"Food Court Avenue"
      duration: fd[1]['ora'].toString() + 'h', //"4h"
      punchLine1: "Granite Cooking",
      punchLine2: "The latest fad in foodology, get the inside scoup.",
      categoryIds: [0, 2],
      galleryImages: ["assets/event_images/cooking_1.jpg", "assets/event_images/cooking_2.jpg", "assets/event_images/cooking_3.jpg"]);

  //final events = [fiveKmRunEvent, cookingEvent, musicConcert, golfCompetition, eveniment2, ev2];
  final events = [fiveKmRunEvent, cookingEvent];*/

  //return events;
  //return children;
  return children2;
}


final fiveKmRunEvent = Event(
    imagePath:"assets/event_images/5_km_downtown_run.jpg",
    title: "5 Kilometer Downtown Run",
    description:"",
    location:"Pleasant Park",
    duration:"3h",
    punchLine1:"Marathon!",
    punchLine2:"The latest fad in foodology, get the inside scoup.",
    categoryIds:[0,1],
    galleryImages: [],);

final cookingEvent = Event(
    imagePath: "assets/event_images/granite_cooking_class.jpg",
    title: "Granite Cooking Class",
    description: "Guest list fill up fast so be sure to apply before handto secure a spot.",
    location: "Food Court Avenue",
    duration: "4h",
    punchLine1: "Granite Cooking",
    punchLine2: "The latest fad in foodology, get the inside scoup.",
    categoryIds: [0, 2],
    galleryImages: ["assets/event_images/cooking_1.jpg", "assets/event_images/cooking_2.jpg", "assets/event_images/cooking_3.jpg"]);

final musicConcert = Event(
    imagePath: "assets/event_images/music_concert.jpg",
    title: "Arijit Music Concert",
    description: "Listen to Arijit's latest compositions.",
    location: "D.Y. Patil Stadium, Mumbai",
    duration: "5h",
    punchLine1: "Music Lovers!",
    punchLine2: "The latest fad in foodology, get the inside scoup.",
    categoryIds: [0, 1],
    galleryImages: [],);

final golfCompetition = Event(
    imagePath: "assets/event_images/golf_competition.jpg",
    title: "Season 2 Golf Estate",
    description: "",
    location: "NSIC Ground, Okhla",
    duration: "1d",
    punchLine1: "Golf",
    punchLine2: "The latest fad in foodology, get the inside scoup.",
    categoryIds: [0, 3],
    galleryImages: [],);

final events = [fiveKmRunEvent, cookingEvent, musicConcert, golfCompetition];
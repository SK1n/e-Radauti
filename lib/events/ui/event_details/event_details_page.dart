import 'package:flutter/material.dart';
import 'package:flutterapperadauti/events/ui/event_details/event_details_background.dart'; //import 'package:flutterapp/ui/event_details/event_details_background.dart';
import 'package:flutterapperadauti/events/ui/event_details/event_details_content.dart'; //import 'package:flutterapp/ui/event_details/event_details_content.dart';
import 'package:flutterapperadauti/events/ui/tabView/tabPage.dart'; //import 'package:flutterapp/ui/tabView/tabPage.dart';
import 'package:provider/provider.dart';
import '../../model/event.dart';

//import 'package:flutterapperadauti/TownHall/town_hall_main.dart';

class EventDetailsPage extends StatelessWidget {

  final Event event;

  const EventDetailsPage({Key key, this.event}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //return Container();
    return Scaffold(
      body: Provider<Event>.value(
        value: event,
        child: Stack(
          fit: StackFit.expand,
          children: <Widget>[
            EventDetailsBackground(),
            //EventDetailsContent(),
            EventDetailsContent2(),
            //TabBarDemo(),
          ],
        ),
      ),
    );
  }
}
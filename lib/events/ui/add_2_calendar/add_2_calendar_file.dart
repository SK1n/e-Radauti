import 'package:flutter/material.dart';

import 'package:add_2_calendar/add_2_calendar.dart';

void main() => runApp(Add2CalendarEvent());

class Add2CalendarEvent extends StatelessWidget {
  final GlobalKey<ScaffoldState> scaffoldState = GlobalKey();
  @override
  Widget build(BuildContext context) {
    Event event = Event(
      title: 'Test event',
      description: 'example',
      location: 'Flutter app',
      startDate: DateTime.now(),
      endDate: DateTime.now().add(Duration(days: 1)),
      allDay: false,
    );

    return Scaffold(
      key: scaffoldState,
      appBar: AppBar(
        title: const Text('Add event to calendar example'),
      ),
      body: Center(
        child: RaisedButton(
          child: Text('Add test event to device calendar'),
          onPressed: () {
            Add2Calendar.addEvent2Cal(event).then((success) {
              // ignore: deprecated_member_use
              scaffoldState.currentState.showSnackBar(
                  SnackBar(content: Text(success ? 'Success' : 'Error')));
            });
          },
        ),
      ),
    );
  }
}

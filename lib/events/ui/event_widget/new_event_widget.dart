import 'package:flutter/material.dart';
import '../../model/event.dart';
import 'package:expandable/expandable.dart';
import 'package:add_2_calendar/add_2_calendar.dart';
import 'package:flutterapperadauti/events/ui/event_widget/widget_event_model.dart';

class NewEventWidget extends StatelessWidget {
  final EventApp event;
  final GlobalKey<ScaffoldState> scaffoldState;
  const NewEventWidget({
    Key key,
    this.event,
    this.scaffoldState,
  }) : super(key: key);
  List<DateTime> listTimeResponse() {
    List<DateTime> returnList = [];
    if (event.startDate != event.endDate) {
      returnList.add(DateTime.tryParse(event.startDate));
      returnList.add(DateTime.tryParse(event.endDate));
    } else {
      returnList.add(DateTime.utc(
              event.yearT, event.monthT, event.dayT, event.hourT, event.minuteT)
          .add(Duration(
        hours: -2,
      )));
      returnList.add(DateTime.utc(
          event.yearT, event.monthT, event.dayT, event.hourT, event.minuteT));
    }
    return returnList;
  }

  Widget textRow4(child, childSize, childFontWeight, childColor) {
    return Text(
      child,
      style: TextStyle(
        fontSize: childSize,
        fontWeight: childFontWeight,
        color: childColor,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    List<DateTime> timeResponse = listTimeResponse();
    Event eventCalendar = Event(
      title: event.title,
      description: event.description,
      location: event.location,
      startDate: timeResponse[0],
      endDate: timeResponse[1],
      allDay: false,
    );
    Widget row4 = Row(
      children: <Widget>[
        Container(
          width: MediaQuery.of(context).size.width / 3,
          child: ElevatedButton(
              style: ButtonStyle(
                backgroundColor:
                    MaterialStateProperty.all<Color>(Color(0xAA38A49C)),
              ),
              onPressed: () {
                Add2Calendar.addEvent2Cal(eventCalendar).then((success) {
                  scaffoldState.currentState.showSnackBar(SnackBar(
                      content:
                          Text(success ? 'Adăugare reușită!' : 'Eroare!')));
                });
                updateDataFirebase(event);
              },
              child: textRow4(
                  'Adaugă în calendar', 13.0, FontWeight.bold, Colors.white)),
        ),
        SizedBox(
          width: 5,
        ),
      ],
    );
    Widget rowTimeLength = Row(
      children: <Widget>[
        SizedBox(
          width: 10.0,
        ),
        Icon(
          Icons.calendar_today_sharp,
          size: 19.0,
        ),
        SizedBox(
          width: 5.0,
        ),
        Text(
          timeResponse[0].day.toString() +
              '.' +
              timeResponse[0].month.toString() +
              '.' +
              timeResponse[0].year.toString() +
              '  -  ' +
              timeResponse[1].day.toString() +
              '.' +
              timeResponse[1].month.toString() +
              '.' +
              timeResponse[1].year.toString(),
          style: TextStyle(
            fontSize: 19.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );

    return ExpandableNotifier(
        child: Container(
      child: Card(
        margin: const EdgeInsets.only(bottom: 15.0),
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(5),
              child: Row(
                children: <Widget>[
                  WidgetEventModel().column1(event, context),
                  WidgetEventModel().column2(event, context),
                  WidgetEventModel().column3(event, context, row4),
                ],
              ),
            ),
            SizedBox(
              height: 10.0,
            ),
            if (event.startDate != event.endDate) rowTimeLength,
            WidgetEventModel().widgetScrollOnExpond(event.description),
          ],
        ),
      ),
    ));
  }
}

import 'package:flutter/material.dart';
import '../../model/event.dart';
import 'package:expandable/expandable.dart';
import 'package:add_2_calendar/add_2_calendar.dart';
import 'package:flutterapperadauti/events/ui/event_widget/widget_event_model.dart';

class NewEventWidget extends StatelessWidget {
  final EventApp event;
  final GlobalKey<ScaffoldState> scaffoldState;
  final double fontSizeTextRow1Column1;
  final double fontSizeTextRow2Column1;
  final double fontSizeTextRow3Column1;
  final double sizeIconRowIconColumn3;
  final double fontSizeTextRowIconColumn3;
  final double fontSizeTextTitleRowColumn3;
  final double widthObject;
  const NewEventWidget({
    Key key,
    this.event,
    this.scaffoldState,
    this.fontSizeTextRow1Column1,
    this.fontSizeTextRow2Column1,
    this.fontSizeTextRow3Column1,
    this.fontSizeTextRowIconColumn3,
    this.sizeIconRowIconColumn3,
    this.fontSizeTextTitleRowColumn3,
    this.widthObject,
  }) : super(key: key);

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
    double fontSizeTextRow4Column3;
    if (widthObject <= 250) {
      fontSizeTextRow4Column3 = 7.0;
    } else if (widthObject <= 500) {
      fontSizeTextRow4Column3 = 10.0;
    } else {
      fontSizeTextRow4Column3 = 12.0;
    }
    List<DateTime> timeResponse;
    timeResponse = WidgetEventModel().listTimeResponse(event);
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
          width: (MediaQuery.of(context).size.width / 5) * 2,
          child: RaisedButton(
              color: Color(0xAA38A49C),
              onPressed: () {
                Add2Calendar.addEvent2Cal(eventCalendar).then((success) {
                  scaffoldState.currentState.showSnackBar(SnackBar(
                      content:
                          Text(success ? 'Adăugare reușită!' : 'Eroare!')));
                });
                updateDataFirebase(event);
              },
              child: textRow4('Adaugă în calendar', fontSizeTextRow4Column3,
                  FontWeight.bold, Colors.white)),
        ),
        SizedBox(
          width: 5,
        ),
        /*Row(
          children: <Widget>[
            textRow4(event.nrParticipants, 13.0, FontWeight.normal, Colors.grey[600]),
            SizedBox(width: 5,),
            Icon(Icons.people),
          ],
        ),*/
      ],
    );
    Widget rowTimeLength;
    if(event.startDate != event.endDate){
      rowTimeLength = WidgetEventModel().widgetRowTimeLength(timeResponse, widthObject);
    }

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
                      WidgetEventModel().column1(
                          event,
                          context,
                          fontSizeTextRow1Column1,
                          fontSizeTextRow2Column1,
                          fontSizeTextRow3Column1),
                      WidgetEventModel().column2(event, context),
                      WidgetEventModel().column3(
                          event,
                          context,
                          row4,
                          fontSizeTextTitleRowColumn3,
                          sizeIconRowIconColumn3,
                          fontSizeTextRowIconColumn3),
                    ],
                  ),
                ),
                if (event.startDate != event.endDate) rowTimeLength,
                WidgetEventModel().widgetScrollOnExpond(event.description),
              ],
            ),
          ),
        ),
    );
  }
}

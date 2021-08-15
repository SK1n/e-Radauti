import 'package:flutter/material.dart';
import '../../model/event.dart';
import 'package:expandable/expandable.dart';
import 'package:flutterapperadauti/events/ui/event_widget/widget_event_model.dart';

class LastEventWidget extends StatelessWidget {
  final EventApp event;
  final double fontSizeTextRow1Column1;
  final double fontSizeTextRow2Column1;
  final double fontSizeTextRow3Column1;
  final double sizeIconRowIconColumn3;
  final double fontSizeTextRowIconColumn3;
  final double fontSizeTextTitleRowColumn3;
  final double widthObject;
  const LastEventWidget({
    Key key,
    this.event,
    this.fontSizeTextRow1Column1,
    this.fontSizeTextRow2Column1,
    this.fontSizeTextRow3Column1,
    this.fontSizeTextRowIconColumn3,
    this.sizeIconRowIconColumn3,
    this.fontSizeTextTitleRowColumn3,
    this.widthObject,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<DateTime> timeResponse;
    timeResponse = WidgetEventModel().listTimeResponse(event);
    Widget rowTimeLength;
    if (event.startDate != event.endDate) {
      rowTimeLength =
          WidgetEventModel().widgetRowTimeLength(timeResponse, widthObject);
    }
    return ExpandableNotifier(
        child: Padding(
      padding: const EdgeInsets.all(0),
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
                      Container(),
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
    ));
  }
}

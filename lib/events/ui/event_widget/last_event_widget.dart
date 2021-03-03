import 'package:flutter/material.dart';
import '../../model/event.dart';
import 'package:expandable/expandable.dart';
import 'package:flutterapperadauti/events/ui/event_widget/widget_event_model.dart';

class LastEventWidget extends StatelessWidget {
  final EventApp event;
  const LastEventWidget({Key key, this.event}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                      WidgetEventModel().column1(event, context),
                      WidgetEventModel().column2(event, context),
                      WidgetEventModel().column3(event, context, Container()),
                    ],
                  ),
                ),
                WidgetEventModel().widgetScrollOnExpond(event.description),
              ],
            ),
          ),
        )
    );
  }
}
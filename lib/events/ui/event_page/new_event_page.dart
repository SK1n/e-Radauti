import 'package:flutter/material.dart';
import 'package:flutterapperadauti/events/model/event.dart';

import 'package:flutterapperadauti/events/ui/event_widget/new_event_widget.dart';
import 'package:flutterapperadauti/widgets/src/loading_screen_ui.dart';

class NewEvents extends StatefulWidget {
  final GlobalKey<ScaffoldState> scaffoldState;
  final double fontSizeTextRow1Column1;
  final double fontSizeTextRow2Column1;
  final double fontSizeTextRow3Column1;
  final double sizeIconRowIconColumn3;
  final double fontSizeTextRowIconColumn3;
  final double fontSizeTextTitleRowColumn3;
  final double widthObject;
  NewEvents({
    Key key,
    this.scaffoldState,
    this.fontSizeTextRow1Column1,
    this.fontSizeTextRow2Column1,
    this.fontSizeTextRow3Column1,
    this.fontSizeTextRowIconColumn3,
    this.sizeIconRowIconColumn3,
    this.fontSizeTextTitleRowColumn3,
    this.widthObject,
  }) : super(key: key);

  @override
  _NewEventsState createState() => _NewEventsState(
        scaffoldState,
        fontSizeTextRow1Column1,
        fontSizeTextRow2Column1,
        fontSizeTextRow3Column1,
        fontSizeTextRowIconColumn3,
        sizeIconRowIconColumn3,
        fontSizeTextTitleRowColumn3,
        widthObject,
      );
}

class _NewEventsState extends State<NewEvents> {
  Future<List> futureList;
  final GlobalKey<ScaffoldState> scaffoldState;
  final double fontSizeTextRow1Column1;
  final double fontSizeTextRow2Column1;
  final double fontSizeTextRow3Column1;
  final double sizeIconRowIconColumn3;
  final double fontSizeTextRowIconColumn3;
  final double fontSizeTextTitleRowColumn3;
  final double widthObject;
  _NewEventsState(
    this.scaffoldState,
    this.fontSizeTextRow1Column1,
    this.fontSizeTextRow2Column1,
    this.fontSizeTextRow3Column1,
    this.fontSizeTextRowIconColumn3,
    this.sizeIconRowIconColumn3,
    this.fontSizeTextTitleRowColumn3,
    this.widthObject,
  );

  @override
  void initState() {
    super.initState();
    futureList = fetchListNewEvent();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: FutureBuilder<List>(
        future: futureList,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.only(
                  left: 16.0,
                  top: 20.0,
                  right: 16.0,
                ),
                child: Column(
                  children: <Widget>[
                    for (final event in snapshot.data.where((e) => DateTime.utc(
                          e.yearT,
                          e.monthT,
                          e.dayT,
                        ).isAfter(DateTime.now().add(Duration(
                          hours: -(DateTime.now().hour + 1),
                        )))))
                      NewEventWidget(
                        event: event,
                        scaffoldState: scaffoldState,
                        fontSizeTextRow1Column1: fontSizeTextRow1Column1,
                        fontSizeTextRow2Column1: fontSizeTextRow2Column1,
                        fontSizeTextRow3Column1: fontSizeTextRow3Column1,
                        fontSizeTextRowIconColumn3: fontSizeTextRowIconColumn3,
                        sizeIconRowIconColumn3: sizeIconRowIconColumn3,
                        fontSizeTextTitleRowColumn3:
                            fontSizeTextTitleRowColumn3,
                        widthObject: widthObject,
                      ),
                  ],
                ),
              ),
            );
          } else if (snapshot.hasError) {
            return Container(
              height: MediaQuery.of(context).size.height,
              child: Center(
                child: Text('A apărut o eroare de conexiune la internet!'),
              ),
            );
          }
          return LoadingScreen();
        },
      ),
    );
  }
}

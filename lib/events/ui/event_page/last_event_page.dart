import 'package:flutter/material.dart';
import 'package:flutterapperadauti/events/model/event.dart';

import 'package:flutterapperadauti/events/ui/event_widget/last_event_widget.dart';
import 'package:flutterapperadauti/widgets/src/loading_screen_ui.dart';

class LastEvents extends StatefulWidget {
  final double fontSizeTextRow1Column1;
  final double fontSizeTextRow2Column1;
  final double fontSizeTextRow3Column1;
  final double sizeIconRowIconColumn3;
  final double fontSizeTextRowIconColumn3;
  final double fontSizeTextTitleRowColumn3;
  final double widthObject;

  LastEvents({
    Key key,
    this.fontSizeTextRow1Column1,
    this.fontSizeTextRow2Column1,
    this.fontSizeTextRow3Column1,
    this.fontSizeTextRowIconColumn3,
    this.sizeIconRowIconColumn3,
    this.fontSizeTextTitleRowColumn3,
    this.widthObject,
  }) : super(key: key);

  @override
  _LastEventsState createState() => _LastEventsState(
        fontSizeTextRow1Column1,
        fontSizeTextRow2Column1,
        fontSizeTextRow3Column1,
        fontSizeTextRowIconColumn3,
        sizeIconRowIconColumn3,
        fontSizeTextTitleRowColumn3,
        widthObject,
      );
}

class _LastEventsState extends State<LastEvents> {
  final double fontSizeTextRow1Column1;
  final double fontSizeTextRow2Column1;
  final double fontSizeTextRow3Column1;
  final double sizeIconRowIconColumn3;
  final double fontSizeTextRowIconColumn3;
  final double fontSizeTextTitleRowColumn3;
  final double widthObject;

  _LastEventsState(
    this.fontSizeTextRow1Column1,
    this.fontSizeTextRow2Column1,
    this.fontSizeTextRow3Column1,
    this.fontSizeTextRowIconColumn3,
    this.sizeIconRowIconColumn3,
    this.fontSizeTextTitleRowColumn3,
    this.widthObject,
  );

  Future<List> futureList;
  int contor = 1;

  Widget function(List child) {
    List<Widget> listWidget = [];
    for(final event in child.where((element) => boolDate(element)))
      if (contor <= 10) {
        contor = contor + 1;
        listWidget.add(
            LastEventWidget(
              event: event,
              fontSizeTextRow1Column1: fontSizeTextRow1Column1,
              fontSizeTextRow2Column1: fontSizeTextRow2Column1,
              fontSizeTextRow3Column1: fontSizeTextRow3Column1,
              fontSizeTextRowIconColumn3: fontSizeTextRowIconColumn3,
              sizeIconRowIconColumn3: sizeIconRowIconColumn3,
              fontSizeTextTitleRowColumn3: fontSizeTextTitleRowColumn3,
              widthObject: widthObject,
            )
        );
      } else {
        break;
      }
    return Column(
      children: <Widget>[
        for(final widget in listWidget) widget,
      ],
    );
  }

  bool boolDate(child){
    DateTime valueDate;
    DateTime valueDate2;
    valueDate = DateTime.now().toUtc().add(Duration(hours: 3,));
    valueDate2 = valueDate.subtract(Duration(hours: valueDate.hour + 1,));
    if(child.startDate != child.endDate){
      return DateTime.tryParse(child.endDate).isBefore(valueDate2);
    }else{
      return DateTime.utc(child.yearT, child.monthT, child.dayT).isBefore(valueDate2);
    }
  }

  @override
  void initState() {
    super.initState();
    futureList = fetchListEvent();
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
                child: function(snapshot.data),
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

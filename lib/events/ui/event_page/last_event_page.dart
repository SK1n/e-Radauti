import 'package:flutter/material.dart';
import 'package:flutterapperadauti/events/model/event.dart';

import 'package:flutterapperadauti/events/ui/event_widget/last_event_widget.dart';

class LastEvents extends StatefulWidget {
  LastEvents({Key key}) : super(key: key);

  @override
  _LastEventsState createState() => _LastEventsState();
}

class _LastEventsState extends State<LastEvents> {
  Future<List> futureList;
  int contor = 1;
  Widget function(EventApp event){
    if (contor <= 10){
      contor = contor + 1;
      return LastEventWidget(event: event,);
    }else{
      return Container();
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
        builder: (context, snapshot){
          if(snapshot.hasData){
            return SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.only(left: 16.0, top: 20.0, right: 16.0,),
                child: Column(
                  children: <Widget>[
                    for(
                      final event in snapshot.data.where(
                              (e) => DateTime.utc(e.yearT, e.monthT, e.dayT,).isBefore(
                              DateTime.now().add(
                                  Duration(hours: -(DateTime.now().hour + 1),)
                              )
                          )
                      )
                    )
                      function(event),
                  ],
                ),
              ),
            );
          }else if(snapshot.hasError){
            return Container(
              height: MediaQuery.of(context).size.height,
              child: Center(
                child: Text('A apărut o eroare de conexiune la internet!'),
              ),
            );
          }
          return Container(
            height: MediaQuery.of(context).size.height,
            child: Center(
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(Color(0xFF38A49C)),
              ),
            ),
          );
        },
      ),
    );
  }
}
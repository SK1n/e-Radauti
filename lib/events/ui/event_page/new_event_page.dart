import 'package:flutter/material.dart';
import 'package:flutterapperadauti/events/model/event.dart';

import 'package:flutterapperadauti/events/ui/event_widget/new_event_widget.dart';

class NewEvents extends StatefulWidget {
  final GlobalKey<ScaffoldState> scaffoldState;
  NewEvents({Key key, this.scaffoldState,}) : super(key: key);

  @override
  _NewEventsState createState() => _NewEventsState(scaffoldState);
}

class _NewEventsState extends State<NewEvents> {
  Future<List> futureList;
  final GlobalKey<ScaffoldState> scaffoldState;
  _NewEventsState(this.scaffoldState,);

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
        builder: (context, snapshot){
          if(snapshot.hasData){
            return SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.only(left: 16.0, top: 20.0, right: 16.0,),
                child: Column(
                  children: <Widget>[
                    for(
                      final event in snapshot.data.where(
                              (e) => DateTime.utc(e.yearT, e.monthT, e.dayT,).isAfter(
                              DateTime.now().add(
                                  Duration(hours: -(DateTime.now().hour + 1),)
                              )
                          )
                      )
                    )
                      NewEventWidget(event: event, scaffoldState: scaffoldState,),
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

import 'package:flutter/material.dart';
import 'package:flutterapperadauti/events/app_state.dart';
import 'package:flutterapperadauti/events/model/event.dart';
//

import 'package:flutterapperadauti/events/ui/event_page/last_event_widget.dart';
import 'package:provider/provider.dart';
import 'home_page_background.dart';

class LastEvents extends StatefulWidget {
  LastEvents({Key key}) : super(key: key);

  @override
  _LastEventsState createState() => _LastEventsState();
}

class _LastEventsState extends State<LastEvents> {
  Future<List> futureList;
  int contor = 1;
  Widget function(EventApp event) {
    if (contor <= 10) {
      contor = contor + 1;
      //print('contor = $contor');
      return GestureDetector(
        child: LastEventWidget(
          event: event,
        ),
      );
    } else {
      //contor = 11;
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
      child: CustomScrollView(slivers: <Widget>[
        SliverToBoxAdapter(
          child: Container(
            //height: (MediaQuery.of(context).size.height/5-45)*5,
            padding: EdgeInsets.only(
              top: 20.0,
            ),
            child: Container(
              child: FutureBuilder<List>(
                //FutureBuilder<Album>
                future: futureList,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    //return Text(snapshot.data.title);
                    return ChangeNotifierProvider<AppState>(
                        create: (_) => AppState(),
                        child: Stack(children: <Widget>[
                          HomePageBackground(
                            screenHeight: MediaQuery.of(context).size.height,
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 5.0, bottom: 5.0),
                            child: SingleChildScrollView(
                              child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 16.0),
                                      child: Consumer<AppState>(
                                        builder: (context, appState, _) =>
                                            Column(
                                          children: <Widget>[
                                            for (final event in snapshot.data
                                                .where((e) => DateTime.utc(
                                                        e.yearT,
                                                        e.monthT,
                                                        e.dayT)
                                                    .isBefore(DateTime.now())))
                                              function(event)
                                          ],
                                        ),
                                      ),
                                    ),
                                  ]),
                            ),
                          ),
                        ]));
                  } else if (snapshot.hasError) {
                    return Container(
                      height: (MediaQuery.of(context).size.height - 55),
                      child: Center(
                        child: Text("${snapshot.error}"),
                      ),
                    );
                  }
                  return Container(
                    height: (MediaQuery.of(context).size.height - 55),
                    child: Center(
                      child: CircularProgressIndicator(
                        valueColor:
                            AlwaysStoppedAnimation<Color>(Color(0xFF38A49C)),
                      ),
                      //CircularProgressIndicator(),
                    ),
                  );
                },
              ),
            ),
          ),
        ),
      ]),
    );
  }
}

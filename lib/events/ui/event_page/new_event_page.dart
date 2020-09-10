import 'package:flutter/material.dart';
import 'package:flutterapperadauti/events/app_state.dart';
import 'package:flutterapperadauti/events/model/category.dart';
import 'package:flutterapperadauti/events/model/event.dart';
//

import 'package:flutterapperadauti/events/styleguide.dart';
import 'package:flutterapperadauti/events/ui/event_page/category_widget.dart';
import 'package:flutterapperadauti/events/ui/event_page/new_event_widget.dart';
import 'package:provider/provider.dart';
import 'home_page_background.dart';

class NewEvents extends StatefulWidget {
  NewEvents({Key key}) : super(key: key);

  @override
  _NewEventsState createState() => _NewEventsState();
}

class _NewEventsState extends State<NewEvents> {
  Future<List> futureList;
  //var berlinWallFell = new DateTime.utc(1989, 11, 9);
  var berlinWallFell = new DateTime.utc(2020, 3, 19);

  @override
  void initState() {
    super.initState();
    futureList = fetchListEvent();
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      child: CustomScrollView(
          slivers: <Widget>[
            SliverToBoxAdapter(
              child: Container(
                //height: (MediaQuery.of(context).size.height/5-45)*5,
                padding: EdgeInsets.only(top: 20.0,),
                child: Container(
                  child: FutureBuilder<List>( //FutureBuilder<Album>
                    future: futureList,
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        //return Text(snapshot.data.title);
                        return ChangeNotifierProvider<AppState>(
                            create: (_) => AppState(),
                            child: Stack(
                                children: <Widget>[
                                  HomePageBackground(screenHeight: MediaQuery.of(context).size.height,),
                                  Padding(
                                    padding: EdgeInsets.only( top: 5.0, bottom: 5.0 ),
                                    child: SingleChildScrollView(
                                      child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: <Widget>[
                                            Padding(
                                              padding: const EdgeInsets.symmetric(horizontal: 16.0),
                                              child: Consumer<AppState>(
                                                builder: (context, appState, _) => Column(
                                                  children: <Widget>[
                                                    //for(final event in events.where((e) => e.categoryIds.contains(appState.selectedCategoryId) ))
                                                    //for(final event in snapshot.data.where((e) => e.categoryIds.contains(appState.selectedCategoryId) ))
                                                    //for(final event in snapshot.data.where((e) => DateTime.utc(2020, e.monthT, e.dayT).isAfter(DateTime.utc(2020, 3, 7))  ))
                                                    //for(final event in snapshot.data.where((e) => DateTime.utc(2020, e.monthT, e.dayT).isAfter(DateTime.now()) || DateTime.utc(2020, e.monthT, e.dayT).isAfter(DateTime.now()) ))
                                                    for(final event in snapshot.data.where((e) => DateTime.utc(2020, e.monthT, e.dayT).isAfter(DateTime.utc(2020, 3, 7)) || DateTime.utc(2020, e.monthT, e.dayT).isAtSameMomentAs(DateTime.utc(2020, 3, 7)) ))
                                                    //e.categoryIds.contains(appState.selectedCategoryId)
                                                      GestureDetector(
                                                        child: NewEventWidget(
                                                          event: event,
                                                        ),
                                                      ),
                                                    //Text(event.title)
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ]
                                      ),
                                    ),
                                  ),
                                ]
                            )
                        );
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
                          child:
                          CircularProgressIndicator(
                            valueColor: AlwaysStoppedAnimation <Color> (Color(0xFF38A49C)),
                          ),
                          //CircularProgressIndicator(),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ),
          ]
      ),
    );
  }
}
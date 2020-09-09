import 'package:flutter/material.dart';
import 'package:flutterapperadauti/events/app_state.dart';
import 'package:flutterapperadauti/events/model/category.dart';
import 'package:flutterapperadauti/events/model/last_events.dart';
//

import 'package:flutterapperadauti/events/styleguide.dart';
import 'package:flutterapperadauti/events/ui/event_details/event_details_page.dart';
import 'package:flutterapperadauti/events/ui/homepage/category_widget.dart';
import 'package:flutterapperadauti/events/ui/homepage/last_event_widget.dart';
import 'package:provider/provider.dart';
import 'home_page_background.dart';

class LastEvents extends StatefulWidget {
  LastEvents({Key key}) : super(key: key);

  @override
  _LastEventsState createState() => _LastEventsState();
}

class _LastEventsState extends State<LastEvents> {
  Future<List> futureList;

  @override
  void initState() {
    super.initState();
    futureList = fetchListLastEvent();
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      child: CustomScrollView(
          slivers: <Widget>[
            /*SliverToBoxAdapter(
              child: SizedBox(
                height: (55),
                child: Container(
                  padding: EdgeInsets.only(top: 5),
                  child: Column(
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Stack(
                            alignment: Alignment.topLeft,
                            children: <Widget>[
                              //YourScrollViewWidget(),
                              IconButton(
                                icon: Icon(Icons.keyboard_arrow_left, color: Color(0xFF979797),), //_left Icons.arrow_back
                                onPressed: (){
                                  Navigator.pop(context);
                                },
                              ),
                            ],
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width-80,
                            child: new Stack(
                              alignment: AlignmentDirectional.center,
                              children: <Widget>[
                                Stack(
                                  children: <Widget>[
                                    Icon(Icons.location_city, color: Color(0x55FB6340),),
                                    SizedBox(width: 5,),
                                    Container(
                                      child: Padding(
                                        padding: EdgeInsets.fromLTRB(30.0, 4.0, 0.0, 0.0), //10.0 //25.0
                                        child: Text(
                                          'Evenimente',
                                          style: TextStyle(
                                            color: Color(0xFF000000), //Color(0xFFFFFFFF),
                                            fontWeight: FontWeight.bold,
                                            fontSize: 16,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),*/
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
                                                    for(final event in snapshot.data.where((e) => e.categoryIds.contains(appState.selectedCategoryId) ))
                                                      GestureDetector(
                                                        child: LastEventWidget(
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
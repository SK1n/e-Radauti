import 'package:flutter/material.dart';
import 'package:flutterapperadauti/events/app_state.dart';
import 'package:flutterapperadauti/events/model/category.dart';
import 'package:flutterapperadauti/events/model/event.dart';
//

import 'package:flutterapperadauti/events/styleguide.dart';
import 'package:flutterapperadauti/events/ui/event_details/event_details_page.dart';
import 'package:flutterapperadauti/events/ui/homepage/category_widget.dart';
import 'package:flutterapperadauti/events/ui/homepage/event_widget.dart';
import 'package:provider/provider.dart';
import 'home_page_background.dart';

import 'package:flutterapperadauti/events/ui/pagination/pagination_page2.dart';

//import 'package:flutterapperadauti/TownHall/town_hall_main.dart';

class HomePage extends StatelessWidget{

  @override
  Widget build(BuildContext context){
    //return Container();
    return Scaffold(
      body: ChangeNotifierProvider<AppState>(
        create: (_) => AppState(),
        child: Stack(
          children: <Widget>[
            HomePageBackground(screenHeight: MediaQuery.of(context).size.height,),
            /*SafeArea(
              child:
            ),*/
            SingleChildScrollView(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    SizedBox(height: 56,),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 32.0),
                      child: Row(
                        children: <Widget>[
                          Text(
                            "LOCAL EVENTS",
                            style: fadedTextStyle,
                          ),
                          Spacer(),
                          Icon(
                            Icons.person_outline,
                            color: Color(0x99FFFFFF),
                            size: 30,
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 32.0),
                      child: Text("What's Up", style: whiteHeadingTextStyle,),
                    ),
                    Padding(
                        padding: const EdgeInsets.symmetric(vertical: 24.0),
                        child: Consumer<AppState>(
                          builder: (context, appState, _) => SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              children: <Widget>[
                                for (final category in categories ) CategoryWidget (category: category)
                              ],
                            ),
                          ),
                        )
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Consumer<AppState>(
                        builder: (context, appState, _) => Column(
                          children: <Widget>[
                            for(final event in events.where((e) => e.categoryIds.contains(appState.selectedCategoryId) ))
                              GestureDetector(
                                onTap: (){
                                  Navigator.of(context).push(
                                    MaterialPageRoute(
                                      builder: (context) => EventDetailsPage(event: event),
                                    ),
                                  );
                                },
                                /*child: EventWidget(
                                  event: event,
                                ),*/
                              ),
                            //Text(event.title)
                          ],
                        ),
                      ),
                    ),
                  ]
              ),
            ),
          ],
        ),
      ),
    );
  }
}


class MyApp2 extends StatefulWidget {
  MyApp2({Key key}) : super(key: key);

  @override
  _MyAppState2 createState() => _MyAppState2();
}

class _MyAppState2 extends State<MyApp2> {
  Future<List> futureList;

  @override
  void initState() {
    super.initState();
    futureList = fetchList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
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
                    /*SafeArea(
              child:
            ),*/
                    SingleChildScrollView(
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            SizedBox(height: 56,),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 32.0),
                              child: Row(
                                children: <Widget>[
                                  Text(
                                    "LOCAL EVENTS",
                                    style: fadedTextStyle,
                                  ),
                                  Spacer(),
                                  Icon(
                                    Icons.person_outline,
                                    color: Color(0x99FFFFFF),
                                    size: 30,
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 32.0),
                              child: Text("What's Up", style: whiteHeadingTextStyle,), //snapshot.data.title
                            ),
                            Padding(
                                padding: const EdgeInsets.symmetric(vertical: 24.0),
                                child: Consumer<AppState>(
                                  builder: (context, appState, _) => SingleChildScrollView(
                                    scrollDirection: Axis.horizontal,
                                    child: Row(
                                      children: <Widget>[
                                        for (final category in categories ) CategoryWidget (category: category)
                                      ],
                                    ),
                                  ),
                                )
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 16.0),
                              child: Consumer<AppState>(
                                builder: (context, appState, _) => Column(
                                  children: <Widget>[
                                    //for(final event in events.where((e) => e.categoryIds.contains(appState.selectedCategoryId) ))
                                    for(final event in snapshot.data.where((e) => e.categoryIds.contains(appState.selectedCategoryId) ))
                                      GestureDetector(
                                        onTap: (){
                                          Navigator.of(context).push(
                                            MaterialPageRoute(
                                              builder: (context) => EventDetailsPage(event: event),
                                            ),
                                          );
                                        },
                                        child: EventWidget(
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
                  ],
                ),
              );
            } else if (snapshot.hasError) {
              return Center(
                child: Text("${snapshot.error}"),
              );
            }

            // By default, show a loading spinner.
            return Center(
              child: CircularProgressIndicator(),
            );
          },
        ),
      ),
    );
  }
}

class MyApp1 extends StatefulWidget {
  MyApp1({Key key}) : super(key: key);

  @override
  _MyAppState1 createState() => _MyAppState1();
}

class _MyAppState1 extends State<MyApp1> {
  Future<List> futureList;

  @override
  void initState() {
    super.initState();
    futureList = fetchList2();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: CustomScrollView(
          slivers: <Widget>[
            SliverToBoxAdapter(
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
            ),
            SliverToBoxAdapter(
              child: Container(
                //height: (MediaQuery.of(context).size.height/5-45)*5,
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
                                                        child: EventWidget(
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
                          child: CircularProgressIndicator(),
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
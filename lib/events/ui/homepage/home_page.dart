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
    //futureList = fetchList();
    futureList = fetchList2();
  }

  @override
  /*Widget build(BuildContext context) {
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
  }*/

  @override
  Widget build(BuildContext context) {
    return Container(
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
                          /*SizedBox(height: 56,),
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
                          ),*/

                          //SizedBox(height: 56,),
                          SizedBox(height: 20,),

                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 32.0),
                            child: Text(
                              "Categorii",
                              //style: whiteHeadingTextStyle,
                              style: TextStyle(
                                //fontSize: 40.0,
                                fontSize: 16.0,
                                fontWeight: FontWeight.bold,
                                //color: Color(0xFFFFFFFF), //Color(0xFFFFFFFF),
                              ),
                            ), //snapshot.data.title //Text("What's Up", style: whiteHeadingTextStyle,),
                          ),

                          Padding(
                              padding: const EdgeInsets.symmetric(vertical: 24.0),
                              child: Consumer<AppState>(
                                builder: (context, appState, _) => SingleChildScrollView(
                                  scrollDirection: Axis.horizontal,
                                  child: Row(
                                    children: <Widget>[
                                      for (final category in categories2 ) CategoryWidget (category: category) //categories
                                    ],
                                  ),
                                ),
                              )
                          ),

                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 32.0),
                            child: Text(
                              "Evenimente",
                              //style: whiteHeadingTextStyle,
                              style: TextStyle(
                                fontSize: 16.0,
                                fontWeight: FontWeight.bold,
                                //color: Color(0x99FFFFFF),
                              ),
                            ), //snapshot.data.title //Text("What's Up", style: whiteHeadingTextStyle,),
                          ),

                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 16.0),
                            child: Consumer<AppState>(
                              builder: (context, appState, _) => Column(
                                children: <Widget>[
                                  //for(final event in events.where((e) => e.categoryIds.contains(appState.selectedCategoryId) ))
                                  for(final event in snapshot.data.where((e) => e.categoryIds.contains(appState.selectedCategoryId) ))
                                    GestureDetector(
                                      /*onTap: (){
                                        Navigator.of(context).push(
                                          MaterialPageRoute(
                                            builder: (context) => EventDetailsPage(event: event),
                                          ),
                                        );
                                      },*/
                                      child: EventWidget(
                                        event: event,
                                      ),
                                    ),
                                  //Text(event.title)
                                ],
                              ),
                            ),
                          ),
                          //HomePage3(),
                          /*PageView(
                            children: <Widget>[
                              HomePage3(),
                            ],
                          ),*/

                          /*Container(
                            child: HomePage3(),
                          ),*/
                        ]
                    ),
                  ),

                  /*ListView(
                    children: <Widget>[
                      //HomePage3(),
                      Container(
                        child: HomePage3(),
                      ),
                    ],
                  ),*/

                  /*Container(
                    //child: HomePage3(),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          /*SizedBox(height: 56,),
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
                          ),*/

                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 32.0),
                            child: Text(
                              "Categorii",
                              //style: whiteHeadingTextStyle,
                            ), //snapshot.data.title //Text("What's Up", style: whiteHeadingTextStyle,),
                          ),

                          Padding(
                              padding: const EdgeInsets.symmetric(vertical: 24.0),
                              child: Consumer<AppState>(
                                builder: (context, appState, _) => SingleChildScrollView(
                                  scrollDirection: Axis.horizontal,
                                  child: Row(
                                    children: <Widget>[
                                      for (final category in categories2 ) CategoryWidget (category: category) //categories
                                    ],
                                  ),
                                ),
                              )
                          ),

                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 32.0),
                            child: Text(
                              "Evenimente",
                              //style: whiteHeadingTextStyle,
                            ), //snapshot.data.title //Text("What's Up", style: whiteHeadingTextStyle,),
                          ),

                          /*Padding(
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
                          ),*/
                          //HomePage3(),
                          /*PageView(
                            children: <Widget>[
                              HomePage3(),
                            ],
                          ),*/

                          /*Container(
                            child: HomePage3(),
                          ),*/
                          //<Widget>[],
                        ]
                    ),
                  ),*/

                  /*Container(
                    child: HomePage3(),
                  ),*/
                ],
              ),

              /*child: ListView(
                children: <Widget>[
                  HomePage3(),
                ],
              ),*/

              //child: HomePage3(),
              /*child: Container(
                child: HomePage3(),
              ),*/
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
    );
  }
}
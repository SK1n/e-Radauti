import 'package:flutter/material.dart';

import 'package:flutterapperadauti/events/ui/homepage/home_page.dart'; //import 'package:flutterapp/ui/homepage/home_page.dart';
import 'package:flutterapperadauti/events/ui/pagination/pagination_page.dart'; //import 'package:flutterapp/ui/pagination/pagination_page.dart';
import 'package:flutterapperadauti/events/ui/pagination/pagination_page2.dart'; //import 'package:flutterapp/ui/pagination/pagination_page2.dart';
import 'package:flutterapperadauti/events/ui/menu/menu_page.dart'; //import 'package:flutterapp/ui/menu/menu_page.dart';

//import 'package:flutterapperadauti/TownHall/town_hall_main.dart';

/*void main() {
  runApp(TabBarDemo());
}*/

class TabBarDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            bottom: TabBar(
              tabs: [
                Tab(icon: Icon(Icons.directions_car)),
                Tab(icon: Icon(Icons.directions_transit)),
                Tab(icon: Icon(Icons.directions_bike)),
              ],
            ),
            title: Text('Tabs Demo'),
          ),
          body: TabBarView(
            children: [
              //Icon(Icons.directions_car),
              MyApp2(),
              Icon(Icons.directions_transit),
              Icon(Icons.directions_bike),
            ],
          ),
        ),
      ),
    );
  }
}

class TabBarDemo2 extends StatelessWidget {
  @override
  /*Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            bottom: TabBar(
              tabs: [
                //Tab(icon: Icon(Icons.directions_car)),
                Tab(
                    //icon: Icon(Icons.directions_car),
                    text: 'EVENIMENTE NOI',
                ),
                //Tab(icon: Icon(Icons.directions_transit)),
                Tab(
                    //icon: Icon(Icons.directions_transit),
                    text: 'EVENIMENTE TRECUTE',
                ),
                //Tab(icon: Icon(Icons.directions_bike)),
              ],
            ),
            title: Text('Local Events'),//Text('Tabs Demo'),
          ),
          body: TabBarView(
            children: [
              //Icon(Icons.directions_car),
              MyApp2(),
              //Icon(Icons.directions_transit),
              Icon(Icons.directions_transit),
              //Icon(Icons.directions_bike),
            ],
          ),
        ),
      ),
    );
  }*/

  @override
  /*Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          bottom: TabBar(
            tabs: [
              //Tab(icon: Icon(Icons.directions_car)),
              Tab(
                //icon: Icon(Icons.directions_car),
                //text: 'EVENIMENTE NOI',
                child: Text(
                  'EVENIMENTE NOI',
                  style: TextStyle(
                    fontSize: 15.0,//12.0 //16.0 //14.0
                    fontWeight: FontWeight.bold,
                    //color: Color(0x99FFFFFF),
                  ),
                ),
              ),
              //Tab(icon: Icon(Icons.directions_transit)),
              Tab(
                //icon: Icon(Icons.directions_transit),
                //text: 'EVENIMENTE TRECUTE',
                child: Text(
                  'EVENIMENTE TRECUTE',
                  style: TextStyle(
                    fontSize: 15.0,//12.0 //16.0 //14.0
                    fontWeight: FontWeight.bold,
                    //color: Color(0x99FFFFFF),
                  ),
                ),
              ),
              //Tab(icon: Icon(Icons.directions_bike)),
            ],
          ),
          //title: Text('Local Events'),//Text('Tabs Demo'),
          title: Center(
            child: Row(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 100.0), //32.0 //64.0 //96.0
                  child: Row(
                    children: <Widget>[
                      Icon(Icons.calendar_today, color: Color(0xAAFB6340),),
                      SizedBox(width: 5,),
                      Text('Evenimente'),
                    ],
                  ),
                ),
                /*Icon(Icons.calendar_today, color: Color(0xAAFB6340),),
                SizedBox(width: 5,),
                Text('Evenimente'),*/
              ],
            ),
          ),
        ),
        body: TabBarView(
          children: [
            //Icon(Icons.directions_car),
            MyApp1(),
            //Icon(Icons.directions_transit),
            //MyApp1(),
            HomePage2(),
            //Icon(Icons.directions_bike),
          ],
        ),
      ),
    );
  }*/

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      //length: 2,
      length: 1,
      child: Scaffold(
        //drawer: NavDrawer2(),
        appBar: AppBar(
          bottom: TabBar(
            indicatorColor: Color(0xAA38A49C), //Color(0xAAFB6340),
            unselectedLabelColor: Colors.grey,
            tabs: [
              //Tab(icon: Icon(Icons.directions_car)),
              Tab(
                //icon: Icon(Icons.directions_car),
                text: '',//'EVENIMENTE NOI',
                /*child: Text(
                  'EVENIMENTE NOI',
                  style: TextStyle(
                    fontSize: 15.0,//12.0 //16.0 //14.0
                    fontWeight: FontWeight.bold,
                    //color: Color(0x99FFFFFF),
                  ),
                ),*/
              ),
              //Tab(icon: Icon(Icons.directions_transit)),
              /*Tab(
                //icon: Icon(Icons.directions_transit),
                //text: 'EVENIMENTE TRECUTE',
                child: Text(
                  'EVENIMENTE TRECUTE',
                  style: TextStyle(
                    fontSize: 15.0,//12.0 //16.0 //14.0
                    fontWeight: FontWeight.bold,
                    //color: Color(0x99FFFFFF),
                  ),
                ),
              ),*/
              //Tab(icon: Icon(Icons.directions_bike)),
            ],
          ),
          //title: Text('Local Events'),//Text('Tabs Demo'),
          /*title: Center(
            child: Row(
              children: <Widget>[
                /*Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 100.0), //32.0 //64.0 //96.0
                  child: Row(
                    children: <Widget>[
                      Icon(Icons.calendar_today, color: Color(0xAAFB6340),),
                      SizedBox(width: 5,),
                      Text('Evenimente'),
                    ],
                  ),
                ),*/
                Icon(Icons.calendar_today, color: Color(0xAAFB6340),),
                SizedBox(width: 5,),
                Text('Evenimente'),
              ],
            ),
          ),*/
          /*title: Row(
            children: <Widget>[
              /*Padding(
                padding: const EdgeInsets.symmetric(horizontal: 100.0), //32.0 //64.0 //96.0
                child: Row(
                  children: <Widget>[
                    Icon(Icons.calendar_today, color: Color(0xAAFB6340),),
                    SizedBox(width: 5,),
                    Text('Evenimente'),
                  ],
                ),
              ),*/
              Row(
                children: <Widget>[
                  Icon(Icons.calendar_today, color: Color(0xAAFB6340),),
                  SizedBox(width: 5,),
                  Text('Evenimente'),
                ],
              ),
              /*Icon(Icons.calendar_today, color: Color(0xAAFB6340),),
                SizedBox(width: 5,),
                Text('Evenimente'),*/
            ],
          ),*/
          centerTitle: true,
          //titleSpacing: 120.0,
          //title: Text('Text + Lorem Ipsum Lorem ipsum'),
          title: Container(
            //child: Text('Text + Lorem '), //Text('Text + Lorem Ipsum Lorem ipsum'),
            //alignment: AlignmentDirectional.center,
            child: new Stack(
              alignment: AlignmentDirectional.center,
              children: <Widget>[
                //Icon(Icons.calendar_today, color: Color(0xAAFB6340),),
                //SizedBox(width: 5,),
                //Text('Text + Lorem '),
                Stack(
                  //alignment: AlignmentDirectional.center,
                  children: <Widget>[
                    Icon(Icons.calendar_today, color: Color(0xAAFB6340),),
                    SizedBox(width: 5,),
                    Container(
                      child: Padding(
                        padding: EdgeInsets.fromLTRB(30.0, 0.0, 0.0, 0.0), //10.0 //25.0
                        child: Text('Evenimente'),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          /*flexibleSpace: Center(
            child: Row(
              children: <Widget>[
                /*Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 100.0), //32.0 //64.0 //96.0
                  child: Row(
                    children: <Widget>[
                      Icon(Icons.calendar_today, color: Color(0xAAFB6340),),
                      SizedBox(width: 5,),
                      Text('Evenimente'),
                    ],
                  ),
                ),*/
                Row(
                  children: <Widget>[
                    Icon(Icons.calendar_today, color: Color(0xAAFB6340),),
                    SizedBox(width: 5,),
                    Text('Evenimente'),
                  ],
                ),
                /*Icon(Icons.calendar_today, color: Color(0xAAFB6340),),
                SizedBox(width: 5,),
                Text('Evenimente'),*/
              ],
            ),
          ),*/
        ),
        body: TabBarView(
          children: [
            //Icon(Icons.directions_car),
            MyApp1(),
            //Icon(Icons.directions_transit),
            //MyApp1(),
            //HomePage2(),
            //HomePage3(),
            //Icon(Icons.directions_bike),
          ],
        ),
      ),
    );
  }
}
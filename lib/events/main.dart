import 'package:flutter/material.dart';

import 'ui/homepage/home_page.dart';
import 'package:flutterapperadauti/events/ui/tabView/tabPage.dart'; //import 'package:flutterapp/ui/tabView/tabPage.dart';
import 'package:flutterapperadauti/events/ui/pagination/pagination_page.dart'; //import 'package:flutterapp/ui/pagination/pagination_page.dart';
import 'package:flutterapperadauti/events/ui/menu/menu_page.dart'; //import 'package:flutterapp/ui/menu/menu_page.dart';

//import 'package:flutterapperadauti/TownHall/town_hall_main.dart';

//void main() => runApp(MyApp());
//void main() => runApp(TabBarDemo2());
//void main() => runApp(MyApp2()); //homepage package
//void main() => runApp(MyApp3());

class MyAppEvents extends StatelessWidget { //class MyApp
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: Color(0xFFFFFFFF),
        //primarySwatch: Colors.blue,
        primaryColor: Color(0xFFFFFFFF),//Color(0xFFFF4700)
      ),
      //home: MyHomePage(title: 'Flutter Demo Home Page'),
      //home: Container(),
      //home: HomePage(),//homepage package
      //home: MyApp1(),
      //home: MyApp2(),
      //home: TabBarDemo2(), //tappage
      //home: HomePage2(), //pagination
      //home: MyHomePage(),
      home: MyAppEvents2(),
    );
  }
}

class MyAppEvents2 extends StatelessWidget { //MyHomePage
  //Key scaffoldKey;

  // The AppBar's action needs this key to find its own Scaffold.
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      drawer: NavDrawer2(),
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 255, 255, 255),
        automaticallyImplyLeading: false,
        leading: addLeadingIcon(),
        actions: <Widget>[
          Container(
            alignment: Alignment.topRight,
            margin: EdgeInsets.only(top: 0.0, right: 0.0), // EdgeInsets.only(top: 20.0, right: 10.0),
            child: IconButton(
              icon: Icon(Icons.menu,
                size: 24,
                color: Colors.black, ), //Colors.white
              onPressed: () => _scaffoldKey.currentState.openDrawer(), //_scaffoldKey.currentState.openDrawer(),
            ),
          ),
        ],
      ),
      body: TabBarDemo2(),
    );
  }

  Widget addLeadingIcon(){
    return new Container(
      //height: 110.0, //50.0, //25.0,
      //width: 110.0, //50.0, //25.0,
      padding: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0), //EdgeInsets.fromLTRB(20.0, 10.0, 0.0, 10.0), //EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
      margin: const EdgeInsets.fromLTRB(15.0, 5.0, 0.0, 5.0), //const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
      child: new Stack(
        alignment: AlignmentDirectional.center,
        children: <Widget>[
          new Image.asset(
            "assets/logo_images/app_logo.png", //"assets/logo_images/app_logo_final2.jpg", //Constant.iconNotification,
            //width: 90.0, //50.0, //25.0,
            //height: 90.0, //50.0, //25.0,
          ),
          /*new FlatButton(
              onPressed: (){
                onLeadingShowCategoryClick();
              }
          )*/
        ],
      ),
    );
  }

  /*Widget addLeadingIcon(){
    return new Container(
      height: 25.0,
      width: 25.0,
      padding: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
      margin: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
      child: new Stack(
        alignment: AlignmentDirectional.center,
        children: <Widget>[
          new Image.asset(
            Constant.iconNotification,
            width: 25.0,
            height: 25.0,
          ),
          new FlatButton(
              onPressed: (){
                onLeadingShowCategoryClick();
              }
          )
        ],
      ),
    );
  }*/

  //@override
  /*Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        titleSpacing: 0.0,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            IconButton(
              icon: Icon(Icons.menu),
              onPressed: () => _scaffoldKey.currentState.openDrawer(),
            ),
            Stack(
              alignment: Alignment.center,
              children: <Widget>[
                IconButton(
                  icon: Icon(Icons.mail_outline),
                  onPressed: _onClickNotification,
                ),
                Positioned(
                  top: 12.0,
                  right: 10.0,
                  width: 10.0,
                  height: 10.0,
                  child: Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: AppColors.notification,
                    ),
                  ),
                )
              ],
            ),
            Expanded(
              child: Center(child: Text('test')),
            )
          ],
        ),
        automaticallyImplyLeading: false,
        centerTitle: true,
        actions: <Widget>[
          Row(
            children: <Widget>[
              Text('Online'),
              Switch(
                value: true,
                onChanged: (bool value) {},
              )
            ],
          )
        ],
      ),
      drawer: Drawer(
        child: _buildDrawer(),
      ),
      body: Container(
        color: Colors.orange,
      ),
    );
  }*/
}

/*class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavDrawer(),
      appBar: AppBar(
        title: Text('Side menu'),
      ),
      body: Center(
        child: Text('Side Menu Tutorial'),
      ),
    );
  }
}*/

/*class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Invoke "debug painting" (press "p" in the console, choose the
          // "Toggle Debug Paint" action from the Flutter Inspector in Android
          // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
          // to see the wireframe for each widget.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.display1,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}*/

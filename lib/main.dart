import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutterapperadauti/TownHall/town_hall_main.dart';
import 'package:flutterapperadauti/menu_page.dart';
import 'package:flutterapperadauti/notice_a_problem/main_page.dart';
import 'package:flutterapperadauti/usefull_numbers/main_page.dart';
import 'package:flutterapperadauti/events/main.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'E-Radauti',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: Color(0xFFFFFFFF),
        primaryColor: Color(0xFFFFFFFF),
      ),
      home: AndroidMobile1(),
    );
  }
}

class AndroidMobile1 extends StatelessWidget {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  AndroidMobile1({
    Key key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 255, 255, 255),
        automaticallyImplyLeading: false,
        leading: Container(
          padding: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
          margin: const EdgeInsets.fromLTRB(15.0, 5.0, 0.0, 5.0),
          child: Image.asset("assets/logo_images/app_logo.png"),
        ),
      ),
      body:
      GridView.count(
              primary: false,
              padding: const EdgeInsets.all(30),
              crossAxisSpacing: 50,
              mainAxisSpacing: 10,
              crossAxisCount: 2,
              children: <Widget>[
                Container(
                  child: Container(
                    width: 80.0,
                    height: 80.0,
                      child: FlatButton(
                        onPressed: () {Navigator.push(context, MaterialPageRoute(builder: (context) => HomePageNoticeProblem()),);},
                        child: SvgPicture.asset('assets/images/notice_a_problem.svg'),
                      )
                  ),
                ),
                Container(
                  child: Container(
                    width: 80.0,
                    height: 80.0,
                      child: FlatButton(
                        onPressed: () {Navigator.push(context, MaterialPageRoute(builder: (context) => TownHallMain()),);},
                        child: SvgPicture.asset('assets/images/announcess.svg'),
                      )
                  ),
                ),
                Container(
                  child: Container(
                    width: 80.0,
                    height: 80.0,
                      child: FlatButton(
                        onPressed: () {Navigator.push(context, MaterialPageRoute(builder: (context) => MyAppEvents2()),);},
                        child: SvgPicture.asset('assets/images/calendar.svg'),
                      )
                  ),
                ),
                Container(
                  child: Container(
                    width: 80.0,
                    height: 80.0,
                      child: FlatButton(
                        onPressed: () {Navigator.push(context, MaterialPageRoute(builder: (context) => HomePageNumbers()),);},
                        child: SvgPicture.asset('assets/images/agenda.svg'),
                      )
                  ),
                ),
                Container(
                  child: Container(
                    width: 80.0,
                    height: 80.0,
                    child: FlatButton(
                      onPressed: null,
                      child: SvgPicture.asset('assets/images/recycling.svg'),
                    )
                  ),
                ),
                Container(
                  child: Container(
                    width: 80.0,
                    height: 80.0,
                      child: FlatButton(
                        onPressed: null,
                        child: SvgPicture.asset('assets/images/job.svg'),
                      )
                  ),
                ),
                Container(
                  child: Container(
                    width: 80.0,
                    height: 80.0,
                      child: FlatButton(
                        onPressed: null,
                        child: SvgPicture.asset('assets/images/volunteer.svg'),
                      )
                  ),
                ),
                Container(
                  child: Container(
                    width: 80.0,
                    height: 80.0,
                      child: FlatButton(
                        onPressed: null,
                        child: SvgPicture.asset('assets/images/tours.svg'),
                      )
                  ),
                ),
              ],
          ),
    );
  }
}
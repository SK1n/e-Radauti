import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutterapperadauti/TownHall/town_hall_main.dart';
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
  AndroidMobile1({
    Key key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('E-Radauti'),
        backgroundColor: Color.fromARGB(255, 54, 190, 166),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.menu),
            onPressed: () {
            },
          ),
        ],
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
                        onPressed: null,
                        child: SvgPicture.asset('assets/images/calendar.svg'),
                      )
                  ),
                ),
                Container(
                  child: Container(
                    width: 80.0,
                    height: 80.0,
                      child: FlatButton(
                        onPressed: null,
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
                Container(
                  child: Container(
                      width: 80.0,
                      height: 80.0,
                      child: FlatButton(
                        onPressed: () {Navigator.push(context, MaterialPageRoute(builder: (context) => HomePageNumbers()),);},
                        child: SvgPicture.asset('assets/images/phone_call.svg'),
                      )
                  ),
                ),
              ],
          ),
    );
  }
}

const String _svg_xhraer =
    '<svg viewBox="4.5 9.0 14.1 16.2" ><path transform="translate(0.0, -0.88)" d="M 4.5 18 L 18.63995361328125 18" fill="none" stroke="#ffffff" stroke-width="3" stroke-linecap="round" stroke-linejoin="round" /><path  d="M 4.5 9 L 18.63995361328125 9" fill="none" stroke="#ffffff" stroke-width="3" stroke-linecap="round" stroke-linejoin="round" /><path transform="translate(0.0, -1.76)" d="M 4.5 27 L 18.63995361328125 27" fill="none" stroke="#ffffff" stroke-width="3" stroke-linecap="round" stroke-linejoin="round" /></svg>';

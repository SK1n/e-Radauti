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

  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: Container(
          padding: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
          margin: const EdgeInsets.fromLTRB(15.0, 5.0, 0.0, 5.0),
          child: new Stack(
            alignment: AlignmentDirectional.center,
            children: <Widget>[
              new Image.asset(
                "assets/logo_images/app_logo.png", //Constant.iconNotification,
              ),
            ],
          ),
        ),
      ),
      body:
      CustomScrollView(
        slivers: <Widget>[
          SliverToBoxAdapter(
            child: SizedBox(
              height: (MediaQuery.of(context).size.height/5 - 45),
              child: Container(
                //padding: EdgeInsets.only(left: 10,top: 10, bottom: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      height: 50,
                      width: 50,
                      child: Image.asset("assets/images/birthday.png"),
                    ),
                    Container(
                      padding: EdgeInsets.only(left: 10),
                      //width: MediaQuery.of(context).size.width - 101,
                      child: Text(
                        "Bun venit!",
                        style: TextStyle(
                            color: Color(0xFF000000),
                            fontWeight: FontWeight.bold,
                            fontSize: 20
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: SizedBox(
              height: (MediaQuery.of(context).size.height/5 - 45)*5,
              child: Container(
                child: GridView.count(
                  primary: false,
                  padding: const EdgeInsets.all(15),
                  crossAxisSpacing: 15,
                  mainAxisSpacing: 15,
                  crossAxisCount: 2,
                  childAspectRatio: (MediaQuery.of(context).size.width/2 - 22.5) / (MediaQuery.of(context).size.height/5 - 60),
                  children: <Widget>[
                    GestureDetector(
                      onTap: () {Navigator.push(context, MaterialPageRoute(builder: (context) => HomePageNoticeProblem()),);},
                      child: Card(
                        margin: const EdgeInsets.symmetric(vertical: 0),
                        elevation: 4,
                        color: Colors.white,
                        shape: RoundedRectangleBorder(
                          //borderRadius: BorderRadius.all(Radius.circular(24)),
                          borderRadius: BorderRadius.all(Radius.circular(2)),
                        ),
                        child: Padding(
                          //padding: const EdgeInsets.symmetric(horizontal: 20),
                          padding: const EdgeInsets.all(0),//const EdgeInsets.all(20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Icon(Icons.photo_filter, color: Color(0x55FB6340),),
                              SizedBox(width: 5,),
                              Container(
                                width: MediaQuery.of(context).size.width/2 - 97,//150,
                                child: Padding(
                                  padding: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0), //10.0 //25.0
                                  child: Text(
                                    'Sesizează o problemă',
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 3,
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
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {Navigator.push(context, MaterialPageRoute(builder: (context) => TownHallMain()),);},
                      child: Card(
                        margin: const EdgeInsets.symmetric(vertical: 0),
                        elevation: 4,
                        color: Colors.white,
                        shape: RoundedRectangleBorder(
                          //borderRadius: BorderRadius.all(Radius.circular(24)),
                          borderRadius: BorderRadius.all(Radius.circular(2)),
                        ),
                        child: Padding(
                          //padding: const EdgeInsets.symmetric(horizontal: 20),
                          padding: const EdgeInsets.all(0),//const EdgeInsets.all(20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Icon(Icons.location_city, color: Color(0x55FB6340),),
                              SizedBox(width: 5,),
                              Text(
                                'Primărie',
                                overflow: TextOverflow.ellipsis,
                                maxLines: 3,
                                style: TextStyle(
                                  color: Color(0xFF000000), //Color(0xFFFFFFFF),
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                              ),

                            ],
                          ),
                        ),
                      ),
                    ),
                    //2
                    GestureDetector(
                      onTap: () {Navigator.push(context, MaterialPageRoute(builder: (context) => MyAppEvents2()),);},
                      child: Card(
                        margin: const EdgeInsets.symmetric(vertical: 0),
                        elevation: 4,
                        color: Colors.white,
                        shape: RoundedRectangleBorder(
                          //borderRadius: BorderRadius.all(Radius.circular(24)),
                          borderRadius: BorderRadius.all(Radius.circular(2)),
                        ),
                        child: Padding(
                          //padding: const EdgeInsets.symmetric(horizontal: 20),
                          padding: const EdgeInsets.all(0),//const EdgeInsets.all(20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Icon(Icons.calendar_today, color: Color(0x55FB6340),),
                              SizedBox(width: 5,),
                              Text(
                                'Evenimente',
                                overflow: TextOverflow.ellipsis,
                                maxLines: 3,
                                style: TextStyle(
                                  color: Color(0xFF000000), //Color(0xFFFFFFFF),
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                              ),

                            ],
                          ),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {Navigator.push(context, MaterialPageRoute(builder: (context) => HomePageNumbers()),);},
                      child: Card(
                        margin: const EdgeInsets.symmetric(vertical: 0),
                        elevation: 4,
                        color: Colors.white,
                        shape: RoundedRectangleBorder(
                          //borderRadius: BorderRadius.all(Radius.circular(24)),
                          borderRadius: BorderRadius.all(Radius.circular(2)),
                        ),
                        child: Padding(
                          //padding: const EdgeInsets.symmetric(horizontal: 20),
                          padding: const EdgeInsets.all(0),//const EdgeInsets.all(20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Icon(Icons.perm_phone_msg, color: Color(0x55FB6340),),
                              SizedBox(width: 5,),
                              Text(
                                'Numere utile',
                                overflow: TextOverflow.ellipsis,
                                maxLines: 3,
                                style: TextStyle(
                                  color: Color(0xFF000000), //Color(0xFFFFFFFF),
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                              ),

                            ],
                          ),
                        ),
                      ),
                    ),
                    //3
                    GestureDetector(
                      onTap: null,
                      child: Card(
                        margin: const EdgeInsets.symmetric(vertical: 0),
                        elevation: 4,
                        color: Colors.white,
                        shape: RoundedRectangleBorder(
                          //borderRadius: BorderRadius.all(Radius.circular(24)),
                          borderRadius: BorderRadius.all(Radius.circular(2)),
                        ),
                        child: Padding(
                          //padding: const EdgeInsets.symmetric(horizontal: 20),
                          padding: const EdgeInsets.all(0),//const EdgeInsets.all(20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Icon(Icons.access_time, color: Color(0xAAC4C4C4),),
                              SizedBox(width: 5,),
                              Container(
                                width: MediaQuery.of(context).size.width/2 - 77,//150,
                                child: Padding(
                                  padding: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0), //10.0 //25.0
                                  child: new RichText(
                                    text: new TextSpan(
                                      children: [
                                        new TextSpan(
                                          text: 'Reciclare\n',
                                          style: TextStyle(
                                            color: Color(0xFF979797), //Color(0xFFFFFFFF),
                                            fontWeight: FontWeight.bold,
                                            fontSize: 16,
                                          ),
                                        ),
                                        new TextSpan(
                                          text: 'Coming soon',
                                          style: TextStyle(
                                            color: Color(0xFFC4C4C4), //Color(0xFFFFFFFF),
                                            //fontWeight: FontWeight.bold,
                                            fontSize: 14,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: null,
                      child: Card(
                        margin: const EdgeInsets.symmetric(vertical: 0),
                        elevation: 4,
                        color: Colors.white,
                        shape: RoundedRectangleBorder(
                          //borderRadius: BorderRadius.all(Radius.circular(24)),
                          borderRadius: BorderRadius.all(Radius.circular(2)),
                        ),
                        child: Padding(
                          //padding: const EdgeInsets.symmetric(horizontal: 20),
                          padding: const EdgeInsets.all(0),//const EdgeInsets.all(20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Icon(Icons.access_time, color: Color(0xAAC4C4C4),),
                              SizedBox(width: 5,),
                              Container(
                                width: MediaQuery.of(context).size.width/2 - 77,//150,
                                child: Padding(
                                  padding: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0), //10.0 //25.0
                                  child: new RichText(
                                    text: new TextSpan(
                                      children: [
                                        new TextSpan(
                                          text: 'Joburi\n',
                                          style: TextStyle(
                                            color: Color(0xFF979797), //Color(0xFFFFFFFF),
                                            fontWeight: FontWeight.bold,
                                            fontSize: 16,
                                          ),
                                        ),
                                        new TextSpan(
                                          text: 'Coming soon',
                                          style: TextStyle(
                                            color: Color(0xFFC4C4C4), //Color(0xFFFFFFFF),
                                            //fontWeight: FontWeight.bold,
                                            fontSize: 14,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    //4
                    GestureDetector(
                      onTap: null,
                      child: Card(
                        margin: const EdgeInsets.symmetric(vertical: 0),
                        elevation: 4,
                        color: Colors.white,
                        shape: RoundedRectangleBorder(
                          //borderRadius: BorderRadius.all(Radius.circular(24)),
                          borderRadius: BorderRadius.all(Radius.circular(2)),
                        ),
                        child: Padding(
                          //padding: const EdgeInsets.symmetric(horizontal: 20),
                          padding: const EdgeInsets.all(0),//const EdgeInsets.all(20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Icon(Icons.access_time, color: Color(0xAAC4C4C4),),
                              SizedBox(width: 5,),
                              Container(
                                width: MediaQuery.of(context).size.width/2 - 77,//150,
                                child: Padding(
                                  padding: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0), //10.0 //25.0
                                  child: new RichText(
                                    text: new TextSpan(
                                      children: [
                                        new TextSpan(
                                          text: 'Voluntariat\n',
                                          style: TextStyle(
                                            color: Color(0xFF979797), //Color(0xFFFFFFFF),
                                            fontWeight: FontWeight.bold,
                                            fontSize: 16,
                                          ),
                                        ),
                                        new TextSpan(
                                          text: 'Coming soon',
                                          style: TextStyle(
                                            color: Color(0xFFC4C4C4), //Color(0xFFFFFFFF),
                                            //fontWeight: FontWeight.bold,
                                            fontSize: 14,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: null,
                      child: Card(
                        margin: const EdgeInsets.symmetric(vertical: 0),
                        elevation: 4,
                        color: Colors.white,
                        shape: RoundedRectangleBorder(
                          //borderRadius: BorderRadius.all(Radius.circular(24)),
                          borderRadius: BorderRadius.all(Radius.circular(2)),
                        ),
                        child: Padding(
                          //padding: const EdgeInsets.symmetric(horizontal: 20),
                          padding: const EdgeInsets.all(0),//const EdgeInsets.all(20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Icon(Icons.access_time, color: Color(0xAAC4C4C4),),
                              SizedBox(width: 5,),
                              Container(
                                width: MediaQuery.of(context).size.width/2 - 77,//150,
                                child: Padding(
                                  padding: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0), //10.0 //25.0
                                  child: new RichText(
                                    text: new TextSpan(
                                      children: [
                                        new TextSpan(
                                          text: 'Transport\n',
                                          style: TextStyle(
                                            color: Color(0xFF979797), //Color(0xFFFFFFFF),
                                            fontWeight: FontWeight.bold,
                                            fontSize: 16,
                                          ),
                                        ),
                                        new TextSpan(
                                          text: 'Coming soon',
                                          style: TextStyle(
                                            color: Color(0xFFC4C4C4), //Color(0xFFFFFFFF),
                                            //fontWeight: FontWeight.bold,
                                            fontSize: 14,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    //
                    /*Container(
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
                ),*/
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

const String _svg_xhraer =
    '<svg viewBox="4.5 9.0 14.1 16.2" ><path transform="translate(0.0, -0.88)" d="M 4.5 18 L 18.63995361328125 18" fill="none" stroke="#ffffff" stroke-width="3" stroke-linecap="round" stroke-linejoin="round" /><path  d="M 4.5 9 L 18.63995361328125 9" fill="none" stroke="#ffffff" stroke-width="3" stroke-linecap="round" stroke-linejoin="round" /><path transform="translate(0.0, -1.76)" d="M 4.5 27 L 18.63995361328125 27" fill="none" stroke="#ffffff" stroke-width="3" stroke-linecap="round" stroke-linejoin="round" /></svg>';

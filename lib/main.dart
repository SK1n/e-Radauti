import 'package:flutter/material.dart';
import 'package:flutterapperadauti/notice_a_problem/layout_notice_a_problem.dart';
import 'package:flutterapperadauti/services/push_notifications_service.dart';
import 'package:splashscreen/splashscreen.dart';
import 'package:fluttericon/font_awesome5_icons.dart';
import 'package:flutterapperadauti/town_hall/town_hall_main.dart';
import 'package:flutterapperadauti/usefull_numbers/main_page.dart';
import 'package:flutterapperadauti/events/main.dart';
import 'package:flutterapperadauti/jobs/main_page_jobs.dart';
import 'package:flutterapperadauti/usefull_pages/partner.dart';
import 'package:flutterapperadauti/usefull_pages/contact.dart';
import 'package:flutterapperadauti/usefull_pages/confidential.dart';
import 'package:flutterapperadauti/usefull_pages/about_us_main.dart';
import 'package:flutterapperadauti/air_quality/air_quality.dart';
import 'package:flutterapperadauti/transport/transport_main_page.dart';
import 'package:flutterapperadauti/volunteer/volunteer.dart';

import 'locator.dart';

void main() {
  setupLocator();
  runApp(MyAppRC());
}

class MyAppRC extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'e-Rădăuți',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: Color(0xFFFFFFFF),
        primaryColor: Color(0xFFFFFFFF),
      ),
      home: AndroidMobile1(),
    );
  }
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => new _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return new SplashScreen(
      seconds: 10,
      navigateAfterSeconds: new AndroidMobile1(),
      title: new Text(
        'Aplicația e-Rădăuți',
        style: new TextStyle(
          //fontWeight: FontWeight.bold,
          fontSize: 20.0,
          color: Colors.black,
        ),
      ),
      image: Image.asset("assets/logo_images/app_logo.png"),
      backgroundColor: Colors.white,
      photoSize: 80.0,
    );
  }
}

class AndroidMobile1 extends StatelessWidget {
  AndroidMobile1({
    Key key,
  }) : super(key: key);

  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  final PushNotificationsService _pushNotificationsService =
      locator<PushNotificationsService>();

  Future handleStartUpLogic() async {
    await _pushNotificationsService.initialise();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Container(
          alignment: Alignment.center,
          child: Text(
            'e-Rădăuți',
            style: TextStyle(
              color: Color(0xFF000000), //Color(0xFFFFFFFF),
              fontWeight: FontWeight.bold,
              fontSize: 19,
            ),
          ),
        ),
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
      body: CustomScrollView(
        slivers: <Widget>[
          SliverToBoxAdapter(
            child: SizedBox(
              height: 90, //(MediaQuery.of(context).size.height/5 - 45),
              child: Container(
                //padding: EdgeInsets.only(top: 12.5, bottom: 0),
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
                            fontSize: 20),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: SizedBox(
              height: (MediaQuery.of(context).size.height - 250),
              child: Container(
                child: GridView.count(
                  primary: false,
                  padding: const EdgeInsets.all(15),
                  crossAxisSpacing: 15,
                  mainAxisSpacing: 15,
                  crossAxisCount: 2,
                  childAspectRatio:
                      (MediaQuery.of(context).size.width / 2 - 22.5) /
                          (MediaQuery.of(context).size.height / 5 - 60),
                  children: <Widget>[
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => LayoutNoticeProblem()),
                        );
                      },
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
                          padding: const EdgeInsets.all(
                              0), //const EdgeInsets.all(20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Icon(
                                Icons.photo_filter,
                                color: Color(0x55FB6340),
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Container(
                                width: MediaQuery.of(context).size.width / 2 -
                                    97, //150,
                                child: Padding(
                                  padding: EdgeInsets.fromLTRB(
                                      0.0, 0.0, 0.0, 0.0), //10.0 //25.0
                                  child: Text(
                                    'Sesizează o problemă',
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 3,
                                    style: TextStyle(
                                      color: Color(
                                          0xFF000000), //Color(0xFFFFFFFF),
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
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => TownHallMain()),
                        );
                      },
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
                          padding: const EdgeInsets.all(
                              0), //const EdgeInsets.all(20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Icon(
                                Icons.location_city,
                                color: Color(0x55FB6340),
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Text(
                                'Administrație \nlocală',
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
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => EventsMain()),
                        );
                      },
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
                          padding: const EdgeInsets.all(
                              0), //const EdgeInsets.all(20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Icon(
                                Icons.calendar_today,
                                color: Color(0x55FB6340),
                              ),
                              SizedBox(
                                width: 5,
                              ),
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
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => HomePageNumbers()),
                        );
                      },
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
                          padding: const EdgeInsets.all(
                              0), //const EdgeInsets.all(20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Icon(
                                Icons.perm_phone_msg,
                                color: Color(0x55FB6340),
                              ),
                              SizedBox(
                                width: 5,
                              ),
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
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => HomePageJobs()),
                        );
                      },
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
                          padding: const EdgeInsets.all(
                              0), //const EdgeInsets.all(20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Icon(
                                Icons.announcement,
                                color: Color(0x55FB6340),
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Text(
                                'Anunțuri',
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
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => AirQualityPage()),
                        );
                      },
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
                          padding: const EdgeInsets.all(
                              0), //const EdgeInsets.all(20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Icon(
                                Icons.bubble_chart,
                                color: Color(0x55FB6340),
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Text(
                                'Calitatea Aerului',
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
                    //4
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => HomePageTransport()),
                        );
                      },
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
                          padding: const EdgeInsets.all(
                              0), //const EdgeInsets.all(20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Icon(
                                Icons.train,
                                color: Color(0x55FB6340),
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Text(
                                'Transport',
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
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => VolunteerPage()),
                        );
                      },
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
                          padding: const EdgeInsets.all(
                              0), //const EdgeInsets.all(20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Icon(
                                FontAwesome5.hand_holding_heart,
                                color: Color(0x55FB6340),
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Text(
                                'Voluntariat',
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
                    //
                  ],
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: SizedBox(
              height: 50,
              child: Column(
                //mainAxisAlignment: MainAxisAlignment.center,
                //direction: Axis.horizontal,
                children: <Widget>[
                  Container(
                    height: 17,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        //1
                        Container(
                          //padding: EdgeInsets.only(left: 0, right: 5,),
                          //width: MediaQuery.of(context).size.width/4 - 10,
                          child: new InkWell(
                            child: new Text(
                              'Despre noi',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                decoration: TextDecoration.underline,
                                color: Color(0xFF32325D),
                                fontSize: 15,
                              ),
                            ),
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => AboutUsMain()),
                              );
                            },
                          ),
                        ),
                        VerticalDivider(
                          color: Colors.black,
                          //width: 20,
                        ),
                        //2
                        Container(
                          //padding: EdgeInsets.only(left: 0, right: 5,),
                          //width: MediaQuery.of(context).size.width/4 + 25 ,
                          child: new InkWell(
                            child: new Text(
                              'Confidențialitate',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                decoration: TextDecoration.underline,
                                color: Color(0xFF32325D),
                                fontSize: 15,
                              ),
                            ),
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Confidential()),
                              );
                            },
                          ),
                        ),
                        VerticalDivider(
                          color: Colors.black,
                          //width: 20,
                        ),
                        //3
                        Container(
                          //padding: EdgeInsets.only(left: 5, right: 5,),
                          //width: MediaQuery.of(context).size.width/4 -15,
                          child: new InkWell(
                            child: new Text(
                              'Contact',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                decoration: TextDecoration.underline,
                                color: Color(0xFF32325D),
                                fontSize: 15,
                              ), //Color(0xFFFFFFFF),
                            ),
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Contact()),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        child: new InkWell(
                          child: new Text(
                            'Parteneri',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              //decoration: TextDecoration.underline,
                              color: Color(0xFF32325D),
                              fontSize: 15,
                            ),
                          ),
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Partner()),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
//c:\flutter\flutter\bin\flutter build apk --release --build-name=1.0.5 --build-number=6

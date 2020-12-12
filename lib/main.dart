import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutterapperadauti/notice_a_problem/layout_notice_a_problem.dart';
import 'package:flutterapperadauti/services/push_notifications_service.dart';
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
import 'package:flutterapperadauti/menu_page.dart';

void main() {
  runApp(MyAppRC());
}

class MyAppRC extends StatelessWidget {
  static final FirebaseMessaging _firebaseMessaging = FirebaseMessaging();
  @override
  Widget build(BuildContext context) {
    final pushNotificationService = PushNotificationService(_firebaseMessaging);
    pushNotificationService.initialise();
    return MaterialApp(
      title: 'e-Rădăuți',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: Color(0xFFFFFFFF),
        primaryColor: Color(0xFFFFFFFF),
      ),
      home: MyApp(),
    );
  }
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => new _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

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
        actions: <Widget>[
          Container(
            alignment: Alignment.topRight,
            margin: EdgeInsets.only(top: 0.0, right: 0.0),
            child: IconButton(
              icon: Icon(
                Icons.menu,
                size: 24,
                color: Colors.black,
              ),
              onPressed: () => _scaffoldKey.currentState.openDrawer(),
            ),
          ),
        ],
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
      drawer: NavDrawer2(),
      body: CustomScrollView(
        slivers: <Widget>[
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
                    itemMenu(context, 'Sesizează o\nproblemă',
                        Icons.photo_filter, LayoutNoticeProblem()),
                    itemMenu(context, 'Administrație \nlocală',
                        Icons.location_city, TownHallMain()),
                    itemMenu(context, 'Evenimente', Icons.calendar_today,
                        EventsMain()),
                    itemMenu(context, 'Numere utile', Icons.perm_phone_msg,
                        HomePageNumbers()),
                    itemMenu(context, 'Anunțuri', Icons.announcement,
                        HomePageJobs()),
                    itemMenu(context, 'Calitatea Aerului', Icons.bubble_chart,
                        AirQualityPage()),
                    itemMenu(
                        context, 'Transport', Icons.train, HomePageTransport()),
                    itemMenu(context, 'Voluntariat',
                        FontAwesome5.hand_holding_heart, VolunteerPage()),
                  ],
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: SizedBox(
              height: 50,
              child: Column(
                children: <Widget>[
                  Container(
                    height: 17,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Container(
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
                        ),
                        Container(
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
                        ),
                        Container(
                          child: new InkWell(
                            child: new Text(
                              'Contact',
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

  GestureDetector itemMenu(context, title, icon, nextScreen) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => nextScreen),
        );
      },
      child: Card(
        margin: const EdgeInsets.symmetric(vertical: 0),
        elevation: 4,
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(2)),
        ),
        child: Padding(
          padding: const EdgeInsets.all(0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Icon(
                icon,
                color: Color(0x55FB6340),
              ),
              SizedBox(
                width: 5,
              ),
              Text(
                title,
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
    );
  }
}

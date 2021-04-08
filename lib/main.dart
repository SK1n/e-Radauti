import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutterapperadauti/notice_a_problem/layout_notice_a_problem.dart';
import 'package:flutterapperadauti/town_hall/town_hall_main.dart';
import 'package:flutterapperadauti/transport/Train.dart';
import 'package:flutterapperadauti/usefull_numbers/main_page.dart';
import 'package:flutterapperadauti/events/main.dart';
import 'package:flutterapperadauti/jobs/main_page_jobs.dart';
import 'package:flutterapperadauti/usefull_pages/partner.dart';
import 'package:flutterapperadauti/usefull_pages/contact.dart';
import 'package:flutterapperadauti/usefull_pages/confidential.dart';
import 'package:flutterapperadauti/usefull_pages/about_us_main.dart';
import 'package:flutterapperadauti/air_quality/air_quality.dart';
import 'package:flutterapperadauti/transport/Transport.dart';
import 'package:flutterapperadauti/volunteer/volunteer.dart';
import 'jobs/furniture_page.dart';
import 'jobs/job_page.dart';
import 'town_hall/council_meetings.dart';
import 'town_hall/leaders.dart';
import 'town_hall/local_council.dart';
import 'town_hall/local_legislation.dart';
import 'transport/Bus.dart';
import 'transport/LocalInconvenience.dart';
import 'transport/Taxi.dart';
import 'usefull_numbers/contractors.dart';
import 'usefull_numbers/local_authorities.dart';
import 'usefull_numbers/miscellaneous.dart';
import 'usefull_numbers/public_institutions.dart';
import 'package:fluttericon/font_awesome5_icons.dart';
import 'widgets/src/nav_drawer.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

//import 'package:flutter_local_notifications/flutter_local_notifications.dart';
Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp();
  print('Handling a background message ${message.messageId}');
}

const AndroidNotificationChannel channel = AndroidNotificationChannel(
  'high_importance_channel', // id
  'High Importance Notifications', // title
  'This channel is used for important notifications.', // description
  importance: Importance.high,
);
final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

  /// Create an Android Notification Channel.
  ///
  /// We use this channel in the `AndroidManifest.xml` file to override the
  /// default FCM channel to enable heads up notifications.
  await flutterLocalNotificationsPlugin
      .resolvePlatformSpecificImplementation<
          AndroidFlutterLocalNotificationsPlugin>()
      ?.createNotificationChannel(channel);
  await FirebaseMessaging.instance.setForegroundNotificationPresentationOptions(
    alert: true,
    badge: true,
    sound: true,
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'e-Rădăuți',
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (_) => MenuScreen(),
        '/announcement': (BuildContext context) => HomePageJobs(),
        '/furniture': (BuildContext context) => FurniturePage(),
        '/job': (BuildContext context) => JobPage(),
        '/about': (BuildContext context) => AboutUsMain(),
        '/confidential': (BuildContext context) => Confidential(),
        '/contact': (BuildContext context) => Contact(),
        '/partner': (BuildContext context) => Partner(),
        '/contractors': (BuildContext context) => Contractors(),
        '/localAuthorities': (BuildContext context) => LocalAuthorities(),
        '/numbers': (BuildContext context) => HomePageNumbers(),
        '/miscellaneous': (BuildContext context) => Miscellaneous(),
        '/publicInstitutions': (BuildContext context) => PublicInstitutions(),
        '/bus': (BuildContext context) => Bus(),
        '/localInconvenience': (BuildContext context) => LocalInconvenience(),
        '/taxi': (BuildContext context) => Taxi(),
        '/train': (BuildContext context) => Train(),
        '/transport': (BuildContext context) => HomePageTransport(),
        '/councilMeetings': (BuildContext context) => CouncilMeetings(),
        '/leaders': (BuildContext context) => Leaders(),
        '/localCouncil': (BuildContext context) => LocalCouncil(),
        '/localLegislation': (BuildContext context) => LocalLegislation(),
        '/townHall': (BuildContext context) => TownHallMain(),
        '/noticeProblem': (BuildContext context) => LayoutNoticeProblem(),
        '/events': (BuildContext context) => EventsMain(),
        '/air': (BuildContext context) => AirQualityPage(),
        '/volunteer': (BuildContext context) => VolunteerPage(),
      },
      theme: ThemeData(
        scaffoldBackgroundColor: Color(0xFFFFFFFF),
        primaryColor: Color(0xFFFFFFFF),
      ),
    );
  }
}

class MenuScreen extends StatefulWidget {
  @override
  _MyAppState createState() => new _MyAppState();
}

class _MyAppState extends State<MenuScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  @override
  void initState() {
    super.initState();
    FirebaseMessaging.instance
        .getInitialMessage()
        .then((RemoteMessage message) {
      if (message != null) {
        Navigator.pushNamed(context, '/');
      }
    });
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      RemoteNotification notification = message.notification;
      AndroidNotification android = message.notification?.android;
      if (notification != null && android != null) {
        flutterLocalNotificationsPlugin.show(
            notification.hashCode,
            notification.title,
            notification.body,
            NotificationDetails(
              android: AndroidNotificationDetails(
                channel.id,
                channel.name,
                channel.description,
                icon: 'launch_background',
              ),
            ));
      }
    });
    FirebaseMessaging.instance.subscribeToTopic('all');
    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      debugPrint('A new onMessageOpenedApp event was published!');

      if (message.data['view'] == 'air_quality') {
        Navigator.pushNamed(context, '/air');
      }
      if (message.data['view'] == 'events') {
        Navigator.pushNamed(context, '/events');
      }
      if (message.data['view'] == 'notice_problem') {
        Navigator.pushNamed(context, '/noticeProblem');
      }
      if (message.data['view'] == 'announcement') {
        Navigator.pushNamed(context, '/job');
      }
      if (message.data['view'] == 'council') {
        Navigator.pushNamed(context, '/councilMeetings');
      }
      if (message.data['view'] == 'local_authorities') {
        Navigator.pushNamed(context, '/localAuthorities');
      }
    });
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
      drawer: NavDrawer(),
      body: CustomScrollView(
        slivers: <Widget>[
          SliverToBoxAdapter(
            child: SizedBox(
              height: (MediaQuery.of(context).size.height / 5 - 45),
              child: Container(
                //padding: EdgeInsets.only(left: 10,top: 10, bottom: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      height: 30,
                      width: 30,
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
                            fontSize: 18),
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
                  padding: const EdgeInsets.all(10),
                  crossAxisSpacing: 5,
                  mainAxisSpacing: 5,
                  crossAxisCount: 2,
                  childAspectRatio:
                      (MediaQuery.of(context).size.width / 2 - 22.5) /
                          (MediaQuery.of(context).size.height / 5 - 60),
                  children: <Widget>[
                    itemMenu(context, 'Sesizează o problemă',
                        Icons.photo_filter, '/noticeProblem'),
                    itemMenu(context, 'Administrație locală',
                        Icons.location_city, '/townHall'),
                    itemMenu(
                        context, 'Evenimente', Icons.calendar_today, '/events'),
                    itemMenu(context, 'Numere utile', Icons.perm_phone_msg,
                        '/numbers'),
                    itemMenu(context, 'Anunțuri', Icons.announcement,
                        '/announcement'),
                    itemMenu(context, 'Calitatea aerului', Icons.bubble_chart,
                        '/air'),
                    itemMenu(context, 'Transport', Icons.train, '/transport'),
                    itemMenu(context, 'Voluntariat',
                        FontAwesome5.hand_holding_heart, '/volunteer'),
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
                              Navigator.pushNamed(context, '/about');
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
                              Navigator.pushNamed(
                                context,
                                '/confidential',
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
                              Navigator.pushNamed(context, '/contact');
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
                              decoration: TextDecoration.underline,
                              color: Color(0xFF32325D),
                              fontSize: 15,
                            ),
                          ),
                          onTap: () {
                            Navigator.pushNamed(context, '/partner');
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
        Navigator.pushNamed(
          context,
          nextScreen,
        );
      },
      child: Card(
        elevation: 4,
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(4)),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(left: 10),
              child: Icon(
                icon,
                color: Color(0x55FB6340),
              ),
            ),
            Expanded(
              child: Container(
                margin: EdgeInsets.only(left: 10),
                alignment: Alignment.centerLeft,
                child: Text(
                  title,
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
    );
  }
}

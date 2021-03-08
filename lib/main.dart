import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutterapperadauti/notice_a_problem/layout_notice_a_problem.dart';
import 'package:flutterapperadauti/push_notification.dart';
import 'package:flutterapperadauti/services/locator.dart';
import 'package:flutterapperadauti/services/navigator.dart';
import 'package:flutterapperadauti/services/router.dart';
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
import 'main_page_model.dart';

void main() {
  setupLocator(); //Register the navigation service before app starts
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  static final FirebaseMessaging _firebaseMessaging = FirebaseMessaging();

  @override
  Widget build(BuildContext context) {
    final pushNotificationService = PushNotificationService(_firebaseMessaging);
    pushNotificationService.initialise();
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
      navigatorKey: locator<NavigationService>().navigationKey,
      onGenerateRoute: generateRoute,
    );
  }
}

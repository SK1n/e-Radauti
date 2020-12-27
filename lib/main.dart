import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutterapperadauti/notice_a_problem/layout_notice_a_problem.dart';
import 'package:flutterapperadauti/services/push_notifications_service.dart';
import 'package:flutterapperadauti/town_hall/town_hall_main.dart';
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
      initialRoute: '/',
      routes: {
        '/': (_) => MyAppRC(),
        '/announcement': (_) => HomePageJobs(),
        '/furniture': (_) => FurniturePage(),
        '/job': (_) => JobPage(),
        '/aboutUs': (_) => AboutUsMain(),
        '/confidential': (_) => Confidential(),
        '/contact': (_) => Contact(),
        '/partner': (_) => Partner(),
        '/contractors': (_) => Contractors(),
        '/localAuthorities': (_) => LocalAuthorities(),
        '/numbers': (_) => HomePageNumbers(),
        '/miscellaneous': (_) => Miscellaneous(),
        '/publicInstitutions': (_) => PublicInstitutions(),
        '/bus': (_) => Bus(),
        '/localInconvenience': (_) => LocalInconvenience(),
        '/taxi': (_) => Taxi(),
        '/transport': (_) => HomePageTransport(),
        '/councilMeetings': (_) => CouncilMeetings(),
        '/leaders': (_) => Leaders(),
        '/localCouncil': (_) => LocalCouncil(),
        '/localLegislation': (_) => LocalLegislation(),
        '/townHall': (_) => TownHallMain(),
        '/noticeProblem': (_) => LayoutNoticeProblem(),
        '/events': (_) => EventsMain(),
        '/air': (_) => AirQualityPage(),
        '/volunteer': (_) => VolunteerPage(),
      },
      theme: ThemeData(
        scaffoldBackgroundColor: Color(0xFFFFFFFF),
        primaryColor: Color(0xFFFFFFFF),
      ),
    );
  }
}

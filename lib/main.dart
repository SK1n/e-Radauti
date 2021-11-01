import 'dart:io';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutterapperadauti/events/fetch_data.dart';
import 'package:flutterapperadauti/events/main.dart';
import 'package:flutterapperadauti/intro_pages.dart';
import 'package:flutterapperadauti/menu_screen.dart';
import 'package:flutterapperadauti/notice_a_problem/models/get_markers.dart';
import 'package:flutterapperadauti/notice_a_problem/screens/notice_map_ui.dart';
import 'package:flutterapperadauti/notice_a_problem/widgets/send_button.dart';
import 'package:flutterapperadauti/settings/app_settings.dart';
import 'package:flutterapperadauti/settings/debug_settings.dart';
import 'package:flutterapperadauti/settings/notification_settings.dart';
import 'package:flutterapperadauti/state/geolocator_state.dart';
import 'package:flutterapperadauti/state/notice_problem_state.dart';
import 'package:flutterapperadauti/notice_a_problem/screens/main_notice_ui.dart';
import 'package:flutterapperadauti/state/loading_state.dart';
import 'package:flutterapperadauti/state/subscribed.dart';
import 'package:flutterapperadauti/town_hall/town_hall_main.dart';
import 'package:flutterapperadauti/transport/Train.dart';
import 'package:flutterapperadauti/usefull_numbers/main_page.dart';
import 'package:flutterapperadauti/jobs/main_page_jobs.dart';
import 'package:flutterapperadauti/usefull_pages/partner.dart';
import 'package:flutterapperadauti/usefull_pages/contact.dart';
import 'package:flutterapperadauti/usefull_pages/confidential.dart';
import 'package:flutterapperadauti/usefull_pages/about_us_main.dart';
import 'package:flutterapperadauti/air_quality/air_quality_main.dart';
import 'package:flutterapperadauti/transport/Transport.dart';
import 'package:flutterapperadauti/volunteer/volunteer.dart';
import 'jobs/furniture_page.dart';
import 'jobs/job_page.dart';
import 'jobs/local_announcements.dart';
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
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:provider/provider.dart';
import 'package:flutterapperadauti/notice_a_problem/location_switch.dart';
import 'package:flutterapperadauti/state/marker_state.dart';
import 'package:flutterapperadauti/state/fcm_state.dart';

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp();
  print('Handling a background message ${message.messageId}');
}

final GlobalKey<NavigatorState> _navigator = new GlobalKey<NavigatorState>();

const AndroidNotificationChannel channel = AndroidNotificationChannel(
  'high_importance_channel', // id
  'High Importance Notifications', // title
  'This channel is used for important notifications.', // description
  importance: Importance.high,
);
final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();

void navigate(BuildContext context, String view) {
  switch (view) {
    case 'air_qulity':
      {
        Navigator.pushNamed(context, '/air');
      }
      break;
    case 'events':
      {
        Navigator.pushNamed(context, '/events');
      }
      break;
    case 'notice_problem':
      {
        Navigator.pushNamed(context, '/noticeProblem');
      }
      break;
    case 'announcement':
      {
        Navigator.pushNamed(context, '/localAnnouncements');
      }
      break;
    case 'council':
      {
        Navigator.pushNamed(context, '/councilMeetings');
      }
      break;
    case 'local_authorities':
      {
        Navigator.pushNamed(context, '/localAuthorities');
      }
      break;
    default:
      {
        Navigator.pushNamed(context, '/main');
      }
      break;
  }
}

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  const AndroidInitializationSettings initializationSettingsAndroid =
      AndroidInitializationSettings('app_logo_final');

  final IOSInitializationSettings initializationSettingsIOS =
      IOSInitializationSettings(
    requestAlertPermission: true,
    requestBadgePermission: true,
    requestSoundPermission: true,
  );
  final InitializationSettings initializationSettings = InitializationSettings(
    android: initializationSettingsAndroid,
    iOS: initializationSettingsIOS,
  );
  await flutterLocalNotificationsPlugin.initialize(initializationSettings,
      onSelectNotification: (String payload) async {
    debugPrint('payload: $payload');

    _navigator.currentState.pushNamed('/$payload');
  });

  await flutterLocalNotificationsPlugin
      .resolvePlatformSpecificImplementation<
          AndroidFlutterLocalNotificationsPlugin>()
      ?.createNotificationChannel(channel);
  await FirebaseMessaging.instance.setForegroundNotificationPresentationOptions(
    alert: true,
    badge: true,
    sound: true,
  );
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider<IsLoading>(create: (_) => IsLoading()),
      ChangeNotifierProvider<NoticeFormState>(create: (_) => NoticeFormState()),
      ChangeNotifierProvider<LocationSwitchState>(
          create: (_) => LocationSwitchState()),
      ChangeNotifierProvider<MarkerNotifier>(create: (_) => MarkerNotifier()),
      ChangeNotifierProvider<FCMState>(create: (_) => FCMState()),
      ChangeNotifierProvider<Subscription>(create: (_) => Subscription()),
      ChangeNotifierProvider<GeolocatorState>(create: (_) => GeolocatorState()),
      ChangeNotifierProvider<SendButtonLoadingState>(
          create: (_) => SendButtonLoadingState()),
      Provider<FetchData>(create: (_) => FetchData()),
      Provider<FetchMarkers>(create: (_) => FetchMarkers()),
    ],
    child: MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    if (Platform.isIOS) {
      FirebaseMessaging.instance.requestPermission();
    }
    FirebaseMessaging.instance
        .getInitialMessage()
        .then((RemoteMessage message) {
      if (message != null) {
        navigate(context, message.data['view']);
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
                icon: 'app_logo_final',
              ),
            ),
            payload: message.data["view"]);
      }
    });
    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      debugPrint('A new onMessageOpenedApp event was published!');
      navigate(context, message.data['view']);
    });
    didOpenAppFromNotif();
  }

  Future<void> didOpenAppFromNotif() async {
    final NotificationAppLaunchDetails notificationAppLaunchDetails =
        await flutterLocalNotificationsPlugin.getNotificationAppLaunchDetails();
    debugPrint('${notificationAppLaunchDetails.payload}');
    if (notificationAppLaunchDetails.didNotificationLaunchApp) {
      if (notificationAppLaunchDetails.payload != null) {
        _navigator.currentState
            .pushNamed('/${notificationAppLaunchDetails.payload}');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'e-Rădăuți',
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (_) => IntroPages(),
        '/main': (_) => MenuScreen(),
        '/announcement': (BuildContext context) => HomePageJobs(),
        '/furniture': (BuildContext context) => FurniturePage(),
        '/job': (BuildContext context) => JobPage(),
        '/about': (BuildContext context) => AboutUsMain(),
        '/confidential': (BuildContext context) => Confidential(),
        '/contact': (BuildContext context) => Contact(),
        '/partner': (BuildContext context) => Partner(),
        '/contractors': (BuildContext context) => Contractors(),
        '/localAuthorities': (BuildContext context) => LocalAuthorities(),
        '/localAnnouncements': (BuildContext context) =>
            LocalAnounnouncements(),
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
        '/noticeProblem': (BuildContext context) => MainNoticeUi(),
        '/noticeMap': (BuildContext context) => NoticeMapUi(),
        '/events': (BuildContext context) => MainEventsScreen(),
        '/air': (BuildContext context) => AirQualityMain(),
        '/volunteer': (BuildContext context) => VolunteerPage(),
        '/settings': (BuildContext context) => AppSettings(),
        '/settings/notifications': (BuildContext context) =>
            SettingsNotification(),
        '/settings/debug': (BuildContext context) => DebugSettings(),
      },
      navigatorKey: _navigator,
      theme: ThemeData(
        scaffoldBackgroundColor: Color(0xFFFFFFFF),
        primaryColor: Color(0xFFFFFFFF),
      ),
    );
  }
}

import 'package:flutter_loadingindicator/flutter_loadingindicator.dart';
import 'package:flutterapperadauti/bindings/app_bindings.dart';
import 'package:flutterapperadauti/controllers/analytics_controller.dart';
import 'package:flutterapperadauti/controllers/notifications_controller.dart';
import 'package:flutterapperadauti/routes/app_pages.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';
import 'package:is_first_run/is_first_run.dart';

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp();
  print('Handling a background message ${message.messageId}');
}

const AndroidNotificationChannel channel = AndroidNotificationChannel(
  'high_importance_channel', // id
  'High Importance Notifications', // title
  description:
      'This channel is used for important notifications.', // description
  importance: Importance.high,
);
final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  //FIREBASE + NOTIFICATIONS
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
      onSelectNotification: (String? payload) async {
    AnalyticsController().addToAnalytics("onSelectNotifications:" + payload!);
  });

  NotificationsController().setupNotifs();

  await flutterLocalNotificationsPlugin
      .resolvePlatformSpecificImplementation<
          AndroidFlutterLocalNotificationsPlugin>()
      ?.createNotificationChannel(channel);
  await FirebaseMessaging.instance.setForegroundNotificationPresentationOptions(
    alert: true,
    badge: true,
    sound: true,
  );
  runApp(
    GetMaterialApp(
      title: 'e-Rădăuți',
      debugShowCheckedModeBanner: false,
      builder: EasyLoading.init(),
      getPages: AppPages.routes,
      initialRoute:
          await IsFirstRun.isFirstRun() ? Routes.ONBOARD : Routes.HOME,
      initialBinding: AppBindings(),
      navigatorObservers: [
        AnalyticsController().getAnalyticsObserver(),
      ],
      theme: ThemeData(
        scaffoldBackgroundColor: Color(0xFFFFFFFF),
        primaryColor: Color(0xFFFFFFFF),
      ),
    ),
  );
}

// class MyApp extends StatefulWidget {
//   const MyApp({Key? key}) : super(key: key);

//   @override
//   State<MyApp> createState() => _MyAppState();
// }

// class _MyAppState extends State<MyApp> {
//   @override
//   void initState() {
//     super.initState();



//   final GetDelegate getDelegate = GetDelegate();

//   @override
//   Widget build(BuildContext context) {
//     SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
//     return GetMaterialApp(
//       title: 'e-Rădăuți',
//       debugShowCheckedModeBanner: false,
//       getPages: AppPages.routes,
//       initialRoute: Routes.HOME,
//       theme: ThemeData(
//         scaffoldBackgroundColor: Color(0xFFFFFFFF),
//         primaryColor: Color(0xFFFFFFFF),
//       ),
//     );
//   }
// }

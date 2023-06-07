// ignore_for_file: depend_on_referenced_packages

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/services.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutterapperadauti/controllers/dao_controller.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';
import 'package:injectable/injectable.dart';

import 'app/i18n/strings.g.dart';
import 'app/injection.dart';
import 'app/router/auto_router.dart';

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  // If you're going to use other Firebase services in the background, such as Firestore,
  // make sure you call `initializeApp` before using other Firebase services.
  await Firebase.initializeApp();
  print('Handling a background message ${message.messageId}');
}

AndroidNotificationChannel channel = const AndroidNotificationChannel(
  'high_importance_channel', // id
  'High Importance Notifications', // title
  description:
      'This channel is used for important notifications.', // description
  importance: Importance.high,
);
FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);

  await Firebase.initializeApp();
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

  await flutterLocalNotificationsPlugin
      .resolvePlatformSpecificImplementation<
          AndroidFlutterLocalNotificationsPlugin>()
      ?.createNotificationChannel(channel);

  await FirebaseMessaging.instance.setForegroundNotificationPresentationOptions(
    alert: true,
    badge: true,
    sound: true,
  );

  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    statusBarIconBrightness: Brightness.dark,
  ));
  FlutterSecureStorage storage = const FlutterSecureStorage();
  String? email = await storage.read(key: 'user_email');
  // ignore: unused_local_variable
  DaoController daoController = Get.put(DaoController());

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await configureDependencies(Environment.dev);
  final appRouter = AppRouter();
  runApp(
    TranslationProvider(
      child: MaterialApp.router(
        title: 'e-Rădăuți',
        debugShowCheckedModeBanner: true,
        //getPages: AppPages.routes,
        localizationsDelegates: const [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        routerConfig: appRouter.config(),
        supportedLocales: const [
          Locale('en', 'US'),
          Locale('ro', 'RO'),
        ],
        //defaultTransition: Transition.cupertino,
        // fallbackLocale: const Locale('en', 'US'),
        locale: const Locale('ro', "RO"),
        //initialRoute: email == null ? Routes.logIn : Routes.home,
        //translations: Languages(),
        theme: ThemeData(useMaterial3: true),
        themeMode: ThemeMode.light,
      ),
    ),
  );
}

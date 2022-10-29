import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_loadingindicator/flutter_loadingindicator.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutterapperadauti/bindings/app_bindings.dart';
import 'package:flutterapperadauti/controllers/dark_mode_switch_controller.dart';
import 'package:flutterapperadauti/routes/app_pages.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutterapperadauti/utils/is_first_run.dart';
import 'package:get/get.dart';

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp();
  await setupFlutterNotifications();
}

late AndroidNotificationChannel channel;

bool isFlutterLocalNotificationsInitialized = false;

Future<void> setupFlutterNotifications() async {
  if (isFlutterLocalNotificationsInitialized) {
    return;
  }
  channel = const AndroidNotificationChannel(
    'high_importance_channel', // id
    'High Importance Notifications', // title
    description:
        'This channel is used for important notifications.', // description
    importance: Importance.high,
  );

  flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

  await flutterLocalNotificationsPlugin
      .resolvePlatformSpecificImplementation<
          AndroidFlutterLocalNotificationsPlugin>()
      ?.createNotificationChannel(channel);

  await FirebaseMessaging.instance.setForegroundNotificationPresentationOptions(
    alert: true,
    badge: true,
    sound: true,
  );
  isFlutterLocalNotificationsInitialized = true;
}

void showFlutterNotification(RemoteMessage message) {
  RemoteNotification? notification = message.notification;
  AndroidNotification? android = message.notification?.android;
  if (notification != null && android != null && !kIsWeb) {
    flutterLocalNotificationsPlugin.show(
      notification.hashCode,
      notification.title,
      notification.body,
      NotificationDetails(
        android: AndroidNotificationDetails(
          channel.id,
          channel.name,
          channelDescription: channel.description,
          icon: 'app_logo_final',
        ),
      ),
      payload: message.data['view'],
    );
  }
}

late FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  if (!kIsWeb) {
    await setupFlutterNotifications();
  }
  bool isFirstRun = await IsFirstRun.isFirstRun();
  final DarkModeSwitchController darkModeSwitchController =
      Get.put(DarkModeSwitchController());
  darkModeSwitchController.getThemeStatus();
  runApp(
    GetMaterialApp(
      title: 'e-Rădăuți',
      debugShowCheckedModeBanner: false,
      builder: EasyLoading.init(),
      getPages: AppPages.routes,
      initialRoute: isFirstRun ? Routes.ONBOARD : Routes.HOME,
      initialBinding: AppBindings(),
      theme: FlexThemeData.light(
        scheme: FlexScheme.barossa,
        surfaceMode: FlexSurfaceMode.levelSurfacesLowScaffoldVariantDialog,
        blendLevel: 20,
        appBarOpacity: 0.95,
        tabBarStyle: FlexTabBarStyle.universal,
        subThemesData: const FlexSubThemesData(
          blendOnLevel: 20,
          blendOnColors: false,
          inputDecoratorIsFilled: true,
          inputDecoratorBorderType: FlexInputBorderType.underline,
          inputDecoratorRadius: 4.0,
          inputDecoratorFillColor: FlexColor.lightScaffoldBackground,
        ),
        useMaterial3ErrorColors: true,
        visualDensity: FlexColorScheme.comfortablePlatformDensity,
        useMaterial3: true,
      ),
      //TODO: ADD DARK MODE SWITCH
      darkTheme: FlexThemeData.dark(
        scheme: FlexScheme.bigStone,
        surfaceMode: FlexSurfaceMode.highScaffoldLowSurface,
        blendLevel: 15,
        appBarElevation: 1.0,
        tabBarStyle: FlexTabBarStyle.universal,
        subThemesData: const FlexSubThemesData(
          blendOnLevel: 30,
          inputDecoratorIsFilled: true,
          inputDecoratorBorderType: FlexInputBorderType.underline,
          inputDecoratorRadius: 4.0,
          inputDecoratorFillColor: FlexColor.darkScaffoldBackground,
        ),
        useMaterial3ErrorColors: true,
        visualDensity: FlexColorScheme.comfortablePlatformDensity,
        useMaterial3: true,
      ),
      themeMode: ThemeMode.system,
      navigatorKey: Get.key,
    ),
  );
}

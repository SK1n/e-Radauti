import 'package:bloc/bloc.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutterapperadauti/app/repository/notifications/notifications_repository.dart';
import 'package:flutterapperadauti/app/utils/is_first_run.dart';
import 'app/app.dart';
import 'app/bloc_observer.dart';
import 'app/repository/authentication/authentication_repository.dart';
import 'app/repository/e_radauti_website/e_radauti_website_repository.dart';
import 'app/repository/firestore/firestore_repository.dart';
import 'app/repository/local_administration/local_administration_repository.dart';
import 'app/repository/storage/storage_repository.dart';
import 'gen/strings.g.dart';

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  // If you're going to use other Firebase services in the background, such as Firestore,
  // make sure you call `initializeApp` before using other Firebase services.
  await Firebase.initializeApp();
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

  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = const AppBlocObserver();

  await Firebase.initializeApp();

  final authenticationRepository = AuthenticationRepository();
  final firestoreRepository = FirestoreRepository();
  final storageRepository = StorageRepository();
  final localAdministrationRepository = LocalAdministrationRepository();
  final notificationsRepository = NotificationsRepository();
  const eRadautiWebsiteRepository = ERadautiWebsiteRepository();

  await authenticationRepository.user.first;
  final bool isFirstRun = await IsFirstRun.isFirstRun();
  runApp(
    TranslationProvider(
      child: App(
        authenticationRepository: authenticationRepository,
        firestoreRepository: firestoreRepository,
        storageRepository: storageRepository,
        localAdministrationRepository: localAdministrationRepository,
        eRadautiWebsiteRepository: eRadautiWebsiteRepository,
        notificationsRepository: notificationsRepository,
        isFirstRun: isFirstRun,
      ),
    ),
  );
}

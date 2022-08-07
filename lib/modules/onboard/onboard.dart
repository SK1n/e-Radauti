import 'package:flutter/material.dart';
import 'package:flutterapperadauti/routes/app_pages.dart';
import 'package:flutterapperadauti/modules/onboard/firstPage.dart';
import 'package:flutterapperadauti/modules/onboard/secondPage.dart';
import 'package:get/get.dart';
import 'package:intro_views_flutter/intro_views_flutter.dart';

class Onboard extends StatefulWidget {
  const Onboard({Key? key}) : super(key: key);

  @override
  _OnboardState createState() => _OnboardState();
}

class _OnboardState extends State<Onboard> {
  bool? isFirstRun;
  late bool notValue;

  @override
  Widget build(BuildContext context) {
    return IntroViewsFlutter(
      [
        firstPage(),
        secondPage(),
      ],
      showNextButton: true,
      showBackButton: true,
      showSkipButton: false,
      nextText: Text('Următorul'),
      backText: Text('Înapoi'),
      doneText: Text('Închide'),
      pageButtonTextStyles: TextStyle(color: Colors.black),
      pageButtonsColor: Colors.black,
      background: Colors.black,
      onTapDoneButton: () {
        Get.rootDelegate.toNamed(Routes.HOME);
      },
    );
  }
}
//   notificationOnChanged({
//     required Subscription subscription,
//   }) async {
//     if (subscription.enabled) {
//       FirebaseMessaging messaging = FirebaseMessaging.instance;

//       NotificationSettings settings = await messaging.requestPermission(
//         alert: true,
//         announcement: false,
//         badge: true,
//         carPlay: false,
//         criticalAlert: false,
//         provisional: false,
//         sound: true,
//       );
//       if (settings.authorizationStatus == AuthorizationStatus.authorized) {
//         subscription.changeEnabled(true);
//         pushTopicToFirestoreAndSubscribe(
//             context: context, events: true, notice: true, all: true);
//         print('User granted permission');
//       } else if (settings.authorizationStatus ==
//           AuthorizationStatus.provisional) {
//         subscription.changeEnabled(true);
//         pushTopicToFirestoreAndSubscribe(
//             context: context, events: true, notice: true, all: true);
//       } else {
//         showDialog(
//             context: context,
//             builder: (BuildContext context) => Platform.isIOS
//                 ? cupertinoNotificationDeniedDialog(context, subscription)
//                 : androidNotificationDeniedDialog(context, subscription));
//       }
//     } else {
//       subscription.changeEnabled(false);
//       deleteFromFirestoreAndUnsubscribe(
//           context: context, events: true, notice: true, all: true);
//     }
//   }

//   cupertinoNotificationDeniedDialog(
//       BuildContext context, Subscription subscription) {
//     return CupertinoAlertDialog(
//       title: Text('Permisiunea de notificari este oprita'),
//       content: Text('Doriti sa deschideti setarile pentru a le activa?'),
//       actions: [
//         TextButton(
//           onPressed: () => {
//             Navigator.pop(context),
//             subscription.changeEnabled(false),
//           },
//           child: Text('Cancel'),
//         ),
//         TextButton(
//           onPressed: () => {
//             Geolocator.openAppSettings(),
//             Navigator.pop(context),
//           },
//           child: Text('Setari'),
//         ),
//       ],
//     );
//   }

//   androidNotificationDeniedDialog(
//       BuildContext context, Subscription subscription) {
//     return AlertDialog(
//       title: Text('Permisiunea de notificari este oprita'),
//       content: Text('Doriti sa deschideti setarile pentru a le activa?'),
//       actions: [
//         TextButton(
//           onPressed: () => {
//             Navigator.pop(context),
//             subscription.changeEnabled(false),
//           },
//           child: Text('Cancel'),
//         ),
//         TextButton(
//           onPressed: () async => {
//             await Geolocator.openAppSettings(),
//             Navigator.pop(context),
//           },
//           child: Text('Setari'),
//         ),
//       ],
//     );
//   }

//   cupertinoIntoPagesError(dynamic error) {
//     return CupertinoAlertDialog(
//       title: Text('Nu am putut incarca paginile initiale!'),
//       content: Text(
//           'Aceasta este eroarea: ${error.toString()}\n Ne puteti trimite un email la radautiulcivic@gmail.com'),
//       actions: [
//         TextButton(
//             onPressed: () => Navigator.pushNamed(context, '/main'),
//             child: Text('Mergeti catre pagina principala'))
//       ],
//     );
//   }

//   androidIntoPagesError(dynamic error) {
//     return AlertDialog(
//       title: Text('Nu am putut incarca paginile initiale!'),
//       content: Text(
//           'Aceasta este eroarea: ${error.toString()}\n Ne puteti trimite un email la radautiulcivic@gmail.com'),
//       actions: [
//         TextButton(
//             onPressed: () => Navigator.pushNamed(context, '/main'),
//             child: Text('Mergeti catre pagina principala'))
//       ],
//     );
//   }
// }

import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterapperadauti/firestore_subscribe.dart';
import 'package:flutterapperadauti/menu_screen.dart';
import 'package:flutterapperadauti/state/subscribed.dart';
import 'package:intro_views_flutter/intro_views_flutter.dart';
import 'package:is_first_run/is_first_run.dart';
import 'package:list_tile_switch/list_tile_switch.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:provider/provider.dart';

class IntroPages extends StatefulWidget {
  const IntroPages({Key key}) : super(key: key);

  @override
  _IntroPagesState createState() => _IntroPagesState();
}

/// TODO: Add SwitchListTile for notifications and geolocation (make the connection between notifier and switch)

class _IntroPagesState extends State<IntroPages> {
  bool isFirstRun;
  bool notValue;

  Future<bool> checkFirstRun() async {
    isFirstRun = await IsFirstRun.isFirstRun();
    return isFirstRun;
  }

  @override
  Widget build(BuildContext context) {
    Subscription subscribed = Provider.of<Subscription>(context);
    return FutureBuilder(
      future: checkFirstRun(),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        return snapshot.hasData
            ? snapshot.data
                ? introViews(subscribed)
                : MenuScreen()
            : snapshot.hasError
                ? showDialog(
                    context: context,
                    builder: (BuildContext context) => Platform.isIOS
                        ? cupertinoIntoPagesError(snapshot.error)
                        : AlertDialog())
                : MenuScreen();
      },
    );
  }

  introViews(Subscription subscription) {
    return Builder(
      builder: (context) => IntroViewsFlutter(
        [
          PageViewModel(
              pageColor: Colors.greenAccent,
              iconImageAssetPath: 'assets/logo_images/app_logo_final.png',
              mainImage: Image.asset('assets/logo_images/app_logo_final.png'),
              body: const Text('Aplicatia e-Radauti!'),
              textStyle: TextStyle(color: Colors.black),
              title: Text('Aplicatia e-Radauti'),
              titleTextStyle: TextStyle(color: Colors.black)),
          PageViewModel(
              pageColor: const Color(0xFF03A9F4),
              textStyle: TextStyle(color: Colors.black),
              mainImage: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Avem nevoie de urmatoarele permisiuni',
                    style: TextStyle(fontSize: 30, color: Colors.white),
                    textAlign: TextAlign.center,
                  ),
                  Card(
                    child: ListTileSwitch(
                      value: subscription.topicAll,
                      leading: Icon(Icons.circle_notifications_rounded),
                      onChanged: (value) {
                        subscription.changeSubscription(value);
                        if (value) {
                          Permission.notification.request().then((value) =>
                              value.isGranted
                                  ? pushTopicToFirestoreAndSubscribe(
                                      context: context)
                                  : subscription.changeSubscription(false));
                        } else {
                          deleteFromFirestoreAndUnsubscribe(context: context);
                        }
                      },
                      title: Text('Notificari'),
                    ),
                  ),
                  Card(
                    child: ListTileSwitch(
                      value: subscription.topicAll,
                      leading: Icon(Icons.location_on_outlined),
                      onChanged: (value) {
                        subscription.changeSubscription(value);
                        if (value) {
                          Permission.notification.request().then((value) =>
                              value.isGranted
                                  ? pushTopicToFirestoreAndSubscribe(
                                      context: context)
                                  : subscription.changeSubscription(false));
                        } else {
                          deleteFromFirestoreAndUnsubscribe(context: context);
                        }
                      },
                      title: Text('Locatie'),
                    ),
                  ),
                ],
              ))
        ],
        showNextButton: true,
        showBackButton: true,
        showSkipButton: false,
        pageButtonTextStyles: TextStyle(color: Colors.black),
        pageButtonsColor: Colors.black,
        background: Colors.black,
        onTapDoneButton: () {
          Navigator.pushNamed(context, '/main');
        },
      ),
    );
  }

  cupertinoIntoPagesError(dynamic error) {
    return CupertinoAlertDialog(
      title: Text('Nu am putut incarca paginile initiale!'),
      content: Text(
          'Aceasta este eroarea: ${error.toString()}\n Ne puteti trimite un email la radautiulcivic@gmail.com'),
      actions: [
        TextButton(
            onPressed: () => Navigator.pushNamed(context, '/main'),
            child: Text('Mergeti catre pagina principala'))
      ],
    );
  }

  androidIntoPagesError(dynamic error) {
    return AlertDialog(
      title: Text('Nu am putut incarca paginile initiale!'),
      content: Text(
          'Aceasta este eroarea: ${error.toString()}\n Ne puteti trimite un email la radautiulcivic@gmail.com'),
      actions: [
        TextButton(
            onPressed: () => Navigator.pushNamed(context, '/main'),
            child: Text('Mergeti catre pagina principala'))
      ],
    );
  }
}

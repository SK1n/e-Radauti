import 'dart:io';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterapperadauti/firestore_subscribe.dart';
import 'package:flutterapperadauti/geolocator.dart';
import 'package:flutterapperadauti/menu_screen.dart';
import 'package:flutterapperadauti/state/geolocator_state.dart';
import 'package:flutterapperadauti/state/subscribed.dart';
import 'package:geolocator/geolocator.dart';

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
    GeolocatorState geolocatorState = Provider.of<GeolocatorState>(context);
    return FutureBuilder(
      future: checkFirstRun(),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        return snapshot.hasData
            ? snapshot.data
                ? introViews(subscribed, geolocatorState)
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

  introViews(Subscription subscription, GeolocatorState geolocatorState) {
    return Builder(
      builder: (context) => IntroViewsFlutter(
        [
          firstPage(),
          secondPage(subscription, geolocatorState),
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
          Navigator.pushNamed(context, '/main');
        },
      ),
    );
  }

  PageViewModel firstPage() {
    return PageViewModel(
      pageColor: Colors.white,
      mainImage: Column(
        children: [
          Image.asset(
            'assets/logo_images/app_logo_final.png',
            width: MediaQuery.of(context).size.width / 3,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 12),
            child: Text(
              'Aplicația e-Rădăuți',
              style:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 12, left: 40, right: 40),
            child: Text(
              'Aplicație dezvoltată voluntar de către\nAsociația Radauțiul Civic',
              style: TextStyle(
                color: Colors.black,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 40, left: 40, right: 40),
            child: Text(
              'Bine ai venit!',
              style: TextStyle(
                fontSize: 20,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
          )
        ],
      ),
      textStyle: TextStyle(color: Colors.black),
      titleTextStyle: TextStyle(color: Colors.black),
    );
  }

  PageViewModel secondPage(
      Subscription subscription, GeolocatorState geolocatorState) {
    return PageViewModel(
      pageColor: Colors.white,
      mainImage: Column(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                'assets/logo_images/app_logo_final.png',
                width: MediaQuery.of(context).size.width / 4,
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 10),
              ),
              Text(
                'Pentru a te putea bucura de toate funcționalitățile e-Rădăuți, aplicația are nevoie de următoarele permisiuni, pe care te rugăm să le activezi\n\n',
                style:
                    TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              Card(
                child: ListTileSwitch(
                  value: subscription.enabled,
                  leading: Icon(Icons.circle_notifications_rounded),
                  onChanged: (value) {
                    subscription.changeEnabled(value);
                    notificationOnChanged(subscription: subscription);
                  },
                  title: Text('Notificari'),
                ),
              ),
              Card(
                child: ListTileSwitch(
                  value: geolocatorState.value,
                  leading: Icon(Icons.location_on_outlined),
                  onChanged: (value) => geolocationOnChanged(
                      context: context,
                      geolocatorState: geolocatorState,
                      value: value),
                  title: Text('Locatie'),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  notificationOnChanged({
    @required Subscription subscription,
  }) async {
    if (subscription.enabled) {
      FirebaseMessaging messaging = FirebaseMessaging.instance;

      NotificationSettings settings = await messaging.requestPermission(
        alert: true,
        announcement: false,
        badge: true,
        carPlay: false,
        criticalAlert: false,
        provisional: false,
        sound: true,
      );
      if (settings.authorizationStatus == AuthorizationStatus.authorized) {
        subscription.changeEnabled(true);
        pushTopicToFirestoreAndSubscribe(
            context: context, events: true, notice: true, all: true);
        print('User granted permission');
      } else if (settings.authorizationStatus ==
          AuthorizationStatus.provisional) {
        subscription.changeEnabled(true);
        pushTopicToFirestoreAndSubscribe(
            context: context, events: true, notice: true, all: true);
      } else {
        showDialog(
            context: context,
            builder: (BuildContext context) => Platform.isIOS
                ? cupertinoNotificationDeniedDialog(context, subscription)
                : androidNotificationDeniedDialog(context, subscription));
      }
    } else {
      subscription.changeEnabled(false);
      deleteFromFirestoreAndUnsubscribe(
          context: context, events: true, notice: true, all: true);
    }
  }

  cupertinoNotificationDeniedDialog(
      BuildContext context, Subscription subscription) {
    return CupertinoAlertDialog(
      title: Text('Permisiunea de notificari este oprita'),
      content: Text('Doriti sa deschideti setarile pentru a le activa?'),
      actions: [
        TextButton(
          onPressed: () => {
            Navigator.pop(context),
            subscription.changeEnabled(false),
          },
          child: Text('Cancel'),
        ),
        TextButton(
          onPressed: () => {
            Geolocator.openAppSettings(),
            Navigator.pop(context),
          },
          child: Text('Setari'),
        ),
      ],
    );
  }

  androidNotificationDeniedDialog(
      BuildContext context, Subscription subscription) {
    return AlertDialog(
      title: Text('Permisiunea de notificari este oprita'),
      content: Text('Doriti sa deschideti setarile pentru a le activa?'),
      actions: [
        TextButton(
          onPressed: () => {
            Navigator.pop(context),
            subscription.changeEnabled(false),
          },
          child: Text('Cancel'),
        ),
        TextButton(
          onPressed: () async => {
            await Geolocator.openAppSettings(),
            Navigator.pop(context),
          },
          child: Text('Setari'),
        ),
      ],
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

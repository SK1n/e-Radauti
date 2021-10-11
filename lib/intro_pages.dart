import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterapperadauti/main.dart';
import 'package:intro_views_flutter/intro_views_flutter.dart';
import 'package:is_first_run/is_first_run.dart';

class IntroPages extends StatefulWidget {
  const IntroPages({Key key}) : super(key: key);

  @override
  _IntroPagesState createState() => _IntroPagesState();
}

class _IntroPagesState extends State<IntroPages> {
  bool isFirstRun;

  final introPages = [
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
        body: Column(
          children: [
            Text('Acceptati permisiunea de notificari?'),
            Text('dadadada')
          ],
        ))
  ];

  Future<bool> checkFirstRun() async {
    isFirstRun = await IsFirstRun.isFirstRun();
    return isFirstRun;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: checkFirstRun(),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        return snapshot.hasData
            ? snapshot.data
                ? introViews()
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

  introViews() {
    return Builder(
      builder: (context) => IntroViewsFlutter(
        introPages,
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

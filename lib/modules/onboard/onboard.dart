import 'package:flutter/material.dart';
import 'package:flutterapperadauti/modules/menu/menu_screen.dart';
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
        Get.toNamed(Routes.HOME);
      },
    );
  }
}

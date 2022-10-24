import 'package:flutter/material.dart';
import 'package:flutterapperadauti/routes/app_pages.dart';
import 'package:flutterapperadauti/modules/onboard/first_page.dart';
import 'package:flutterapperadauti/modules/onboard/second_page.dart';
import 'package:get/get.dart';
import 'package:intro_views_flutter/intro_views_flutter.dart';

class Onboard extends StatelessWidget {
  const Onboard({super.key});
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
      nextText: const Text('Următorul'),
      backText: const Text('Înapoi'),
      doneText: const Text('Închide'),
      pageButtonTextStyles: const TextStyle(color: Colors.black),
      pageButtonsColor: Colors.black,
      background: Colors.black,
      onTapDoneButton: () {
        Get.toNamed(Routes.HOME);
      },
    );
  }
}

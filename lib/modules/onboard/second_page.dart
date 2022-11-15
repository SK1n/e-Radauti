import 'package:flutter/material.dart';
import 'package:flutterapperadauti/utils/shared_widgets/dark_mode_switch.dart';
import 'package:flutterapperadauti/utils/shared_widgets/loc_switch.dart';
import 'package:flutterapperadauti/utils/shared_widgets/not_switch.dart';
import 'package:get/get.dart';
import 'package:intro_views_flutter/intro_views_flutter.dart';

PageViewModel secondPage() {
  return PageViewModel(
    mainImage: Column(
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              'assets/logo_images/app_logo_final.png',
              width: Get.width / 4,
            ),
            const Padding(
              padding: EdgeInsets.only(bottom: 10),
            ),
            const Text(
              'Pentru a te putea bucura de toate funcționalitățile e-Rădăuți, aplicația are nevoie de următoarele permisiuni, pe care te rugăm să le activezi\n\n',
              style: TextStyle(fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            const NotSwitch(),
            const LocSwitch(),
            const DarkModeSwitch(),
          ],
        )
      ],
    ),
  );
}

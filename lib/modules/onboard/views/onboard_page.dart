import 'package:flutter/material.dart';
import 'package:flutterapperadauti/modules/onboard/views/oboard_slides.dart';
import 'package:flutterapperadauti/modules/onboard/views/onboard.dart';
import 'package:flutterapperadauti/modules/settings/views/notification_settings.dart';
import 'package:flutterapperadauti/utils/shared_widgets/dark_mode_switch.dart';
import 'package:get/get.dart';

class OnboardPage extends StatelessWidget {
  const OnboardPage({super.key});
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Onboard(
        list: [
          OnboardSlides(
            image: 'assets/logo_images/app_logo_final.png',
            title: 'app-radauti'.tr,
            body: Center(
              child: Text(
                'developed-by'.tr,
                textAlign: TextAlign.center,
              ),
            ),
          ),
          // OnboardSlides(
          //   image: 'assets/logo_images/app_logo_final.png',
          //   title:
          //       'Pentru a te putea bucura de toate funcționalitățile e-Rădăuți, aplicația are nevoie de următoarele permisiuni, pe care te rugăm să le activezi',
          //   body: Column(
          //     children: const [
          //       DarkModeSwitch(),
          //       NotificationSettings(),
          //     ],
          //   ),
          // )
          // OnboardModel(
          //   imagePath: 'assets/logo_images/app_logo_final.png',
          //   title: 'app-radauti'.tr,
          //   subTitle: 'developed-by'.tr,
          // ),
          // OnboardModel(
          //   imagePath: 'assets/logo_images/app_logo_final.png',
          //   title:
          //       'Pentru a te putea bucura de toate funcționalitățile e-Rădăuți, aplicația are nevoie de următoarele permisiuni, pe care te rugăm să le activezi',
          //   subTitle: '',
          // ),
          // OnboardModel(imagePath: 'assets/logo_images/app_logo_final.png', title: '', subTitle: subTitle)
        ],
      ),
    );
  }
}

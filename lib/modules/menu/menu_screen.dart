import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutterapperadauti/main.dart';
import 'package:flutterapperadauti/routes/app_pages.dart';
import 'package:flutterapperadauti/modules/menu/menu_item.dart';
import 'package:flutterapperadauti/utils/shared_widgets/app_bar_model.dart';
import 'package:flutterapperadauti/utils/shared_widgets/nav_drawer.dart';
import 'package:fluttericon/font_awesome5_icons.dart';
import 'package:get/get.dart';

class MenuScreen extends StatefulWidget {
  const MenuScreen({super.key});

  @override
  State<MenuScreen> createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  @override
  void initState() {
    FirebaseMessaging.onMessage.listen(showFlutterNotification);

    FirebaseMessaging.instance.getInitialMessage().then(
          (RemoteMessage? message) => message != null
              ? Get.toNamed('/home/${message.data['view']}')
              : DoNothingAction(),
        );

    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      Get.toNamed('/home/${message.data['view']}');
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      endDrawer: const NavDrawer(),
      body: CustomScrollView(
        slivers: [
          const AppBarUi(
            content: 'e-Rădăuți',
            leading: Icons.home,
          ),
          SliverToBoxAdapter(
            child: GridView.count(
              padding: const EdgeInsets.all(10),
              crossAxisSpacing: 5,
              mainAxisSpacing: 5,
              crossAxisCount: 2,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              children: const [
                MenuItem(
                    title: 'Sesizează o problemă',
                    iconData: Icons.photo_filter,
                    route: Routes.NOTICE_PROBLEM),
                MenuItem(
                    title: 'Administrație locală',
                    iconData: Icons.location_city,
                    route: Routes.TOWN_HALL),
                MenuItem(
                    title: 'Evenimente',
                    iconData: Icons.calendar_today,
                    route: Routes.EVENTS),
                MenuItem(
                    title: 'Numere utile',
                    iconData: Icons.perm_phone_msg,
                    route: Routes.PHONE_NUMBERS),
                MenuItem(
                    title: 'Anunțuri',
                    iconData: Icons.announcement,
                    route: Routes.ANNOUNCEMENTS),
                MenuItem(
                    title: 'Calitatea aerului',
                    iconData: Icons.bubble_chart,
                    route: Routes.AIR),
                MenuItem(
                    title: 'Transport',
                    iconData: Icons.train,
                    route: Routes.TRANSPORT),
                MenuItem(
                  title: 'Voluntariat',
                  iconData: FontAwesome5.hand_holding_heart,
                  route: Routes.VOLUNTEER,
                ),
              ],
            ),
          ),
          SliverToBoxAdapter(
            child: SizedBox(
              height: 50,
              child: Column(
                children: <Widget>[
                  SizedBox(
                    height: 17,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        InkWell(
                          child: const Text(
                            'Despre noi',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              decoration: TextDecoration.underline,
                              color: Color(0xFF32325D),
                              fontSize: 15,
                            ),
                          ),
                          onTap: () => Get.toNamed(Routes.ABOUT),
                        ),
                        const VerticalDivider(
                          color: Colors.black,
                        ),
                        InkWell(
                          child: const Text(
                            'Confidențialitate',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              decoration: TextDecoration.underline,
                              color: Color(0xFF32325D),
                              fontSize: 15,
                            ),
                          ),
                          onTap: () => Get.toNamed(Routes.CONFIDENTIAL),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      InkWell(
                        child: const Text(
                          'Parteneri',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            decoration: TextDecoration.underline,
                            color: Color(0xFF32325D),
                            fontSize: 15,
                          ),
                        ),
                        onTap: () => Get.toNamed(Routes.PARTNER),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutterapperadauti/routes/app_pages.dart';
import 'package:flutterapperadauti/modules/menu/menu_item.dart';
import 'package:fluttericon/font_awesome5_icons.dart';
import 'package:get/get.dart';

class MenuScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> _scaffoldKey =
        new GlobalKey<ScaffoldState>();
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        title: Text(
          'e-Rădăuți',
          style: TextStyle(
            color: Color(0xFF000000), //Color(0xFFFFFFFF),
            fontWeight: FontWeight.bold,
            fontSize: 19,
          ),
        ),
        actions: <Widget>[
          Container(
            alignment: Alignment.topRight,
            margin: EdgeInsets.only(top: 0.0, right: 0.0),
            child: IconButton(
              icon: Icon(
                Icons.settings,
                size: 24,
                color: Colors.black,
              ),
              onPressed: () => Get.rootDelegate.toNamed(Routes.SETTINGS),
            ),
          ),
        ],
      ),
      body: CustomScrollView(
        slivers: <Widget>[
          SliverToBoxAdapter(
            child: SizedBox(
              height: (Get.height / 5 - 45),
              child: Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      height: 30,
                      width: 30,
                      child: Image.asset("assets/images/birthday.png"),
                    ),
                    Container(
                      padding: EdgeInsets.only(left: 10),
                      //width: MediaQuery.of(context).size.width - 101,
                      child: Text(
                        "Bun venit!",
                        style: TextStyle(
                            color: Color(0xFF000000),
                            fontWeight: FontWeight.bold,
                            fontSize: 18),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: SizedBox(
              height: (Get.height - 250),
              child: Container(
                child: GridView.count(
                  primary: false,
                  padding: const EdgeInsets.all(10),
                  crossAxisSpacing: 5,
                  mainAxisSpacing: 5,
                  crossAxisCount: 2,
                  childAspectRatio:
                      (Get.width / 2 - 22.5) / (Get.height / 5 - 60),
                  children: [
                    ItemMenu(
                        title: 'Sesizează o problemă',
                        iconData: Icons.photo_filter,
                        route: Routes.NOTICE_PROBLEM),
                    ItemMenu(
                        title: 'Administrație locală',
                        iconData: Icons.location_city,
                        route: Routes.TOWN_HALL),
                    ItemMenu(
                        title: 'Evenimente',
                        iconData: Icons.calendar_today,
                        route: Routes.EVENTS),
                    ItemMenu(
                        title: 'Numere utile',
                        iconData: Icons.perm_phone_msg,
                        route: Routes.PHONE_NUMBERS),
                    ItemMenu(
                        title: 'Anunțuri',
                        iconData: Icons.announcement,
                        route: Routes.ANNOUNCEMENTS),
                    ItemMenu(
                        title: 'Calitatea aerului',
                        iconData: Icons.bubble_chart,
                        route: Routes.AIR),
                    ItemMenu(
                        title: 'Transport',
                        iconData: Icons.train,
                        route: Routes.TRANSPORT),
                    ItemMenu(
                        title: 'Voluntariat',
                        iconData: FontAwesome5.hand_holding_heart,
                        route: Routes.VOLUNTEER),
                  ],
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: SizedBox(
              height: 50,
              child: Column(
                children: <Widget>[
                  Container(
                    height: 17,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Container(
                          child: new InkWell(
                            child: new Text(
                              'Despre noi',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                decoration: TextDecoration.underline,
                                color: Color(0xFF32325D),
                                fontSize: 15,
                              ),
                            ),
                            onTap: () => Get.rootDelegate.toNamed(Routes.ABOUT),
                          ),
                        ),
                        VerticalDivider(
                          color: Colors.black,
                        ),
                        Container(
                          child: new InkWell(
                            child: new Text(
                              'Confidențialitate',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                decoration: TextDecoration.underline,
                                color: Color(0xFF32325D),
                                fontSize: 15,
                              ),
                            ),
                            onTap: () =>
                                Get.rootDelegate.toNamed(Routes.CONFIDENTIAL),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        child: new InkWell(
                          child: new Text(
                            'Parteneri',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              decoration: TextDecoration.underline,
                              color: Color(0xFF32325D),
                              fontSize: 15,
                            ),
                          ),
                          onTap: () => Get.rootDelegate.toNamed(Routes.PARTNER),
                        ),
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

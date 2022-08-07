import 'package:flutter/material.dart';
import 'package:flutterapperadauti/routes/app_pages.dart';
import 'package:flutterapperadauti/modules/notice_a_problem/screens/form/ui/main.dart';

import 'package:flutterapperadauti/widgets/src/appBarModelNew.dart';
import 'package:flutterapperadauti/widgets/src/nav_drawer.dart';
import 'package:fluttericon/font_awesome5_icons.dart';
import 'package:get/get.dart';

class MainNoticeUi extends StatefulWidget {
  const MainNoticeUi({Key? key}) : super(key: key);

  @override
  State<MainNoticeUi> createState() => _MainNoticeUiState();
}

class _MainNoticeUiState extends State<MainNoticeUi> {
  @override
  Widget build(BuildContext context) {
    GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
    return Scaffold(
      key: _scaffoldKey,
      drawer: NavDrawer(),
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return [
            AppBarUiSliver(
              scaffoldKey: _scaffoldKey,
              leading: Icons.camera,
              content: 'Sesizează o problemă',
            ),
          ];
        },
        body: Scrollbar(
          child: SingleChildScrollView(
            child: NoticeFormUi(),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        tooltip: "Harta",
        isExtended: true,
        label: const Text('Harta'),
        icon: Icon(FontAwesome5.map),
        onPressed: () {
          Get.rootDelegate.toNamed(Routes.NOTICE_MAP);
        },
      ),
    );
  }
}

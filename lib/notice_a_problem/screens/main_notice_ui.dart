import 'package:flutter/material.dart';

import 'package:flutterapperadauti/notice_a_problem/screens/notice_form_ui.dart';
import 'package:flutterapperadauti/widgets/src/appBarModelNew.dart';
import 'package:flutterapperadauti/widgets/src/nav_drawer.dart';
import 'package:fluttericon/font_awesome5_icons.dart';

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
          isAlwaysShown: true,
          showTrackOnHover: true,
          child: SingleChildScrollView(
            child: NoticeFormUi(
              scaffoldState: _scaffoldKey,
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        tooltip: "Harta",
        isExtended: true,
        label: const Text('Harta'),
        icon: Icon(FontAwesome5.map),
        onPressed: () => Navigator.pushNamed(context, '/noticeMap'),
      ),
    );
  }
}

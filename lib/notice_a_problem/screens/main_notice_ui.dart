import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutterapperadauti/notice_a_problem/screens/notice_form_ui.dart';
import 'package:flutterapperadauti/widgets/src/appBarModelNew.dart';
import 'package:flutterapperadauti/widgets/src/nav_drawer.dart';

class MainNoticeUi extends StatelessWidget {
  const MainNoticeUi({Key key}) : super(key: key);

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
        body: NoticeFormUi(),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(MaterialIcons.map),
        onPressed: () => Navigator.pushNamed(context, '/noticeMap'),
      ),
    );
  }
}

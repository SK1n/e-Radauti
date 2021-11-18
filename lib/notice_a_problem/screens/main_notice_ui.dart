import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutterapperadauti/notice_a_problem/screens/notice_form_ui.dart';
import 'package:flutterapperadauti/state/geolocator_state.dart';
import 'package:flutterapperadauti/state/loading_state.dart';
import 'package:flutterapperadauti/widgets/src/appBarModelNew.dart';
import 'package:flutterapperadauti/widgets/src/loading_screen_ui.dart';
import 'package:flutterapperadauti/widgets/src/nav_drawer.dart';
import 'package:provider/provider.dart';

class MainNoticeUi extends StatefulWidget {
  const MainNoticeUi({Key key}) : super(key: key);

  @override
  State<MainNoticeUi> createState() => _MainNoticeUiState();
}

class _MainNoticeUiState extends State<MainNoticeUi> {
  @override
  Widget build(BuildContext context) {
    GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
    IsLoading isLoading = Provider.of<IsLoading>(context);
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
        body: isLoading.loading
            ? LoadingScreen()
            : Scrollbar(
                isAlwaysShown: true,
                showTrackOnHover: true,
                child: SingleChildScrollView(
                  child: NoticeFormUi(
                    scaffoldState: _scaffoldKey,
                  ),
                ),
              ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(MaterialIcons.map),
        onPressed: () => Navigator.pushNamed(context, '/noticeMap'),
      ),
    );
  }
}

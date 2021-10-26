import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutterapperadauti/events_new/events_new.dart';
import 'package:flutterapperadauti/events_new/events_old.dart';
import 'package:flutterapperadauti/events_new/fetch_data.dart';
import 'package:flutterapperadauti/widgets/src/appBarModelNew.dart';
import 'package:flutterapperadauti/widgets/src/nav_drawer.dart';
import 'package:provider/provider.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart' as refresh;

class MainEventsScreen extends StatefulWidget {
  const MainEventsScreen({Key key}) : super(key: key);

  @override
  State<MainEventsScreen> createState() => _MainEventsScreenState();
}

class _MainEventsScreenState extends State<MainEventsScreen> {
  @override
  void initState() {
    super.initState();
    initializeFB();
  }

  FirebaseApp firebaseApp;

  Future<void> initializeFB() async {
    firebaseApp = await Firebase.initializeApp();
  }

  @override
  Widget build(BuildContext context) {
    GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
    refresh.RefreshController refreshController =
        refresh.RefreshController(initialRefresh: false);
    FetchData fetchData = Provider.of<FetchData>(context, listen: true);
    return DefaultTabController(
      length: 2,
      child: Scaffold(
          key: _scaffoldKey,
          appBar: PreferredSize(
            child: AppBarUi(
              pinned: true,
              content: 'Evenimente',
              leading: Icons.calendar_today,
              scaffoldKey: _scaffoldKey,
              bottom: TabBar(
                indicatorWeight: 3.0,
                indicatorColor: Colors.pinkAccent,
                tabs: [
                  Tab(
                    text: 'Noi',
                  ),
                  Tab(
                    text: 'Trecute',
                  )
                ],
              ),
            ),
            preferredSize: Size(MediaQuery.of(context).size.width, 100),
          ),
          drawer: NavDrawer(),
          body: RefreshIndicator(
            notificationPredicate: (notifation) {
              return true;
            },
            onRefresh: () {
              debugPrint('refreshed');
              return Future.delayed(Duration(seconds: 2), () {
                fetchData.getEventsFromFirebase();
              });
            },
            child: TabBarView(
              children: [
                NewEventsScreen(),
                OldEventsScreen(),
              ],
            ),
          )),
    );
  }
}

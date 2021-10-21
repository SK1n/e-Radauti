import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutterapperadauti/events_new/widgets/new_event_widget.dart';
import 'package:flutterapperadauti/events_new/fetch_data.dart';
import 'package:flutterapperadauti/events_new/models/events.dart';
import 'package:flutterapperadauti/widgets/src/appBarModelNew.dart';
import 'package:flutterapperadauti/widgets/src/loading_screen_ui.dart';
import 'package:flutterapperadauti/widgets/src/nav_drawer.dart';
import 'package:provider/provider.dart';

class OldEventsScreen extends StatefulWidget {
  const OldEventsScreen({Key key}) : super(key: key);

  @override
  State<OldEventsScreen> createState() => _OldEventsScreenState();
}

class _OldEventsScreenState extends State<OldEventsScreen> {
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
    FetchData fetchData = Provider.of<FetchData>(context, listen: true);
    GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
    return FutureBuilder(
      future: fetchData.getEventsFromFirebase(),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        debugPrint('${snapshot.data.toString()}');
        return snapshot.hasData
            ? ListView.builder(
                itemCount: 3,
                itemBuilder: (BuildContext context, int item) {
                  return NewEventWidget(
                    host: snapshot.data[item].host,
                    category: snapshot.data[item].category,
                    url: snapshot.data[item].url,
                    headline: snapshot.data[item].headline,
                    description: snapshot.data[item].description,
                    location: snapshot.data[item].location,
                    street: snapshot.data[item].street,
                    start: snapshot.data[item].start,
                    end: snapshot.data[item].end,
                    firebaseApp: this.firebaseApp,
                  );
                })
            : LoadingScreen();
      },
    );
  }
}

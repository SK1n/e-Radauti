import 'package:async/async.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutterapperadauti/events_new/fetch_data.dart';
import 'package:flutterapperadauti/events_new/widgets/event_widget.dart';
import 'package:flutterapperadauti/widgets/src/loading_screen_ui.dart';
import 'package:provider/provider.dart';

class OldEventsScreen extends StatefulWidget {
  const OldEventsScreen({Key key}) : super(key: key);

  @override
  State<OldEventsScreen> createState() => _OldEventsScreenState();
}

class _OldEventsScreenState extends State<OldEventsScreen> {
  final AsyncMemoizer dCMemorizer = AsyncMemoizer();
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
    return FutureBuilder(
      future: dCMemorizer.runOnce(() => fetchData.getEventsFromFirebase()),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.hasError) {
          return Container(
            child: Text('A aparut o eroare!'),
          );
        }
        return snapshot.hasData
            ? ListView.builder(
                itemCount: 10,
                addAutomaticKeepAlives: true,
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
                    snapshot: snapshot.data[item],
                  );
                })
            : LoadingScreen();
      },
    );
  }
}

import 'package:async/async.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutterapperadauti/events/fetch_data.dart';
import 'package:flutterapperadauti/events/widgets/event_widget.dart';
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
    const itemCount = 20;
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
                itemCount: itemCount,
                itemBuilder: (BuildContext context, int item) {
                  if (DateTime.now().isAfter(
                      DateTime.fromMillisecondsSinceEpoch(
                          snapshot.data[item].end * 1000))) {
                    return NewEventWidget(
                      snapshot: snapshot.data[item],
                    );
                  } else {
                    return Container();
                  }
                })
            : LoadingScreen();
      },
    );
  }
}

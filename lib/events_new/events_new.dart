import 'package:async/async.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutterapperadauti/events_new/widgets/event_widget.dart';
import 'package:flutterapperadauti/events_new/fetch_data.dart';
import 'package:flutterapperadauti/widgets/src/loading_screen_ui.dart';
import 'package:provider/provider.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class NewEventsScreen extends StatefulWidget {
  const NewEventsScreen({Key key}) : super(key: key);

  @override
  State<NewEventsScreen> createState() => _NewEventsScreenState();
}

class _NewEventsScreenState extends State<NewEventsScreen> {
  @override
  void initState() {
    super.initState();
    initializeFB();
  }

  final AsyncMemoizer dCMemorizer = AsyncMemoizer();

  FirebaseApp firebaseApp;

  Future<void> initializeFB() async {
    firebaseApp = await Firebase.initializeApp();
  }

  @override
  Widget build(BuildContext context) {
    FetchData fetchData = Provider.of<FetchData>(context, listen: true);
    DateTime currentDate = DateTime.now();
    bool thereAreEvents = false;
    bool hasDisplayedThatThereAreNoEvents = false;

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
                itemCount: fetchData.getLength(),
                itemBuilder: (BuildContext context, int item) {
                  if (currentDate.isBefore(DateTime.fromMillisecondsSinceEpoch(
                      snapshot.data[item].end * 1000))) {
                    thereAreEvents = true;
                    return NewEventWidget(
                      snapshot: snapshot.data[item],
                    );
                  }
                  if (!hasDisplayedThatThereAreNoEvents && !thereAreEvents) {
                    hasDisplayedThatThereAreNoEvents = true;
                    debugPrint('here');
                    return Center(
                      child: Container(
                        child: Text(
                          'Nu am gasit nici un eveniment!\nReveniti mai tarziu',
                          style: TextStyle(color: Colors.black, fontSize: 24),
                        ),
                      ),
                    );
                  } else {
                    return Container();
                  }
                })
            : LoadingScreen();
      },
    );
  }

  onRefresh(FetchData fetchData, RefreshController refreshController) {
    fetchData.getEventsFromFirebase();
    refreshController.refreshCompleted();
  }
}

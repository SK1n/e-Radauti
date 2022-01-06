import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutterapperadauti/widgets/src/appBarModelNew.dart';
import 'package:flutterapperadauti/widgets/src/nav_drawer.dart';
import 'package:flutter/foundation.dart';

class SettingsNotification extends StatefulWidget {
  SettingsNotification({Key key}) : super(key: key);

  @override
  State<SettingsNotification> createState() => _SettingsNotificationState();
}

class _SettingsNotificationState extends State<SettingsNotification> {
  List subscribed = [];
  String token;
  @override
  Widget build(BuildContext context) {
    GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

    List topics = ['Toate', 'Evenimente', 'Sesizari', 'Test'];
    return Scaffold(
      key: _scaffoldKey,
      appBar: PreferredSize(
        child: AppBarUi(
          scaffoldKey: _scaffoldKey,
          leading: Icons.settings,
          content: 'Setari',
        ),
        preferredSize: Size(MediaQuery.of(context).size.width, 50),
      ),
      drawer: NavDrawer(),
      body: Column(
        children: [
          ListView.builder(
              shrinkWrap: kDebugMode ? true : false,
              itemCount: kDebugMode ? topics.length : 3,
              itemBuilder: (BuildContext context, int item) {
                debugPrint('topic lenght: ${topics.length}');
                return ListTile(
                    title: Text('${topics[item]}'),
                    trailing: subscribed.contains(topics[item])
                        ? TextButton(
                            onPressed: () async {
                              await FirebaseMessaging.instance
                                  .unsubscribeFromTopic(topics[item]);
                              await FirebaseFirestore.instance
                                  .collection('topics')
                                  .doc(token)
                                  .update({topics[item]: FieldValue.delete()});
                              setState(() {
                                subscribed.remove(topics[item]);
                              });
                            },
                            child: Text('Unsubscribe'))
                        : TextButton(
                            onPressed: () async {
                              await FirebaseMessaging.instance
                                  .subscribeToTopic(topics[item]);
                              await FirebaseFirestore.instance
                                  .collection('topics')
                                  .doc(token)
                                  .set({topics[item]: 'subscribed'},
                                      SetOptions(merge: true));
                              setState(() {
                                subscribed.add(topics[item]);
                              });
                            },
                            child: Text('Subscribe')));
              }),
        ],
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    getToken();
    getTopics();
  }

  getToken() async {
    token = await FirebaseMessaging.instance.getToken();
    setState(() {
      token = token;
    });
  }

  getTopics() async {
    await FirebaseFirestore.instance.collection('topics').get().then((value) {
      value.docs.forEach((element) {
        if (token == element.id) {
          subscribed = element.data().keys.toList();
        }
      });
    });
    setState(() {
      subscribed = subscribed;
    });
  }
}

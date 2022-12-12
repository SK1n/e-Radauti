import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutterapperadauti/utils/shared_widgets/app_bar_widget.dart';
import 'package:flutterapperadauti/utils/shared_widgets/nav_drawer.dart';
import 'package:flutter/foundation.dart';

class SettingsNotification extends StatefulWidget {
  const SettingsNotification({super.key});

  @override
  State<SettingsNotification> createState() => _SettingsNotificationState();
}

class _SettingsNotificationState extends State<SettingsNotification> {
  List subscribed = [];
  String? token;
  @override
  Widget build(BuildContext context) {
    List topics = ['Toate', 'Evenimente', 'Sesizari', 'Test'];
    return Scaffold(
      endDrawer: const NavDrawer(),
      body: CustomScrollView(
        slivers: [
          const AppBarWidget(
            leading: Icons.settings,
            content: 'Setari',
          ),
          SliverToBoxAdapter(
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: kReleaseMode ? topics.length - 1 : topics.length,
              itemBuilder: (BuildContext context, int item) {
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
                          child: const Text('Unsubscribe'))
                      : TextButton(
                          onPressed: () async {
                            await FirebaseMessaging.instance
                                .subscribeToTopic(topics[item]);
                            await FirebaseFirestore.instance
                                .collection('topics')
                                .doc(token)
                                .set({topics[item]: 'subscribed'},
                                    SetOptions(merge: true));
                            setState(
                              () {
                                subscribed.add(topics[item]);
                              },
                            );
                          },
                          child: const Text('Subscribe'),
                        ),
                );
              },
            ),
          ),
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
      for (var element in value.docs) {
        if (token == element.id) {
          subscribed = element.data().keys.toList();
        }
      }
    });
    setState(() {
      subscribed = subscribed;
    });
  }
}

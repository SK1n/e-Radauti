import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutterapperadauti/state/fcm_state.dart';
import 'package:flutterapperadauti/state/subscribed.dart';
import 'package:flutterapperadauti/widgets/src/appBarModelNew.dart';
import 'package:flutterapperadauti/widgets/src/nav_drawer.dart';
import 'package:list_tile_switch/list_tile_switch.dart';
import 'package:provider/provider.dart';

class SettingsNotification extends StatelessWidget {
  const SettingsNotification({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
    Subscription subscribed = Provider.of<Subscription>(context);
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
          ListTileSwitch(
            switchType: SwitchType.cupertino,
            visualDensity: VisualDensity.comfortable,
            switchActiveColor: Platform.isAndroid ? Colors.blue : Colors.green,
            leading: Icon(subscribed.topicAll
                ? Icons.notifications_active
                : Icons.notifications_none),
            title: Text('Toate notificarile importante'),
            onChanged: (value) async {
              subscribed.changeSubscription(value);
              value = !value;
              if (value == true) {
                await FirebaseMessaging.instance
                    .unsubscribeFromTopic('default');
                await FirebaseFirestore.instance
                    .collection('topics')
                    .doc(context.read<FCMState>().fcm)
                    .update({'default': FieldValue.delete()});
              } else {
                await FirebaseMessaging.instance.subscribeToTopic('default');
                await FirebaseFirestore.instance
                    .collection('topics')
                    .doc(context.read<FCMState>().fcm)
                    .set({'default': 'subscribe'});
              }
            },
            value: context.watch<Subscription>().topicAll,
          ),
        ],
      ),
    );
  }
}

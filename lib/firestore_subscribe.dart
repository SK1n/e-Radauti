import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterapperadauti/state/fcm_state.dart';
import 'package:provider/provider.dart';

Future<void> pushTopicToFirestoreAndSubscribe(
    {@required BuildContext context}) async {
  try {
    await FirebaseMessaging.instance.getToken.call().then((value) {
      context.read<FCMState>().getFcm(value);
    });
    await FirebaseMessaging.instance.subscribeToTopic('default');
    await FirebaseFirestore.instance
        .collection('topics')
        .doc(context.read<FCMState>().fcm)
        .set({'default': 'subscribe'});
    debugPrint('Pushed and subscribed to the topic: default');
  } on FirebaseException catch (firebaseException) {
    debugPrint('error: ${firebaseException.code}');
    firebaseError(
      context: context,
      message: firebaseException.message,
    );
  }
}

Future<void> deleteFromFirestoreAndUnsubscribe(
    {@required BuildContext context}) async {
  try {
    await FirebaseMessaging.instance.unsubscribeFromTopic('default');
    await FirebaseFirestore.instance
        .collection('topics')
        .doc(context.read<FCMState>().fcm)
        .update({'default': FieldValue.delete()});
    debugPrint('Deleted from firestore and unsubscribed');
  } on FirebaseException catch (firebaseException) {
    debugPrint('error: ${firebaseException.message}');
    firebaseError(
      context: context,
      message: firebaseException.message,
    );
  }
}

firebaseError({BuildContext context, String message}) {
  showDialog(
    context: context,
    builder: (BuildContext context) => Platform.isIOS
        ? CupertinoAlertDialog(
            title: Text('Eroare'),
            content: Text('$message'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text('OK'),
              ),
            ],
          )
        : AlertDialog(
            title: Text('Eroare'),
            content: Text('$message'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text('OK'),
              ),
            ],
          ),
  );
}

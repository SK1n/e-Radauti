import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterapperadauti/state/fcm_state.dart';
import 'package:provider/provider.dart';

Future<void> pushTopicToFirestoreAndSubscribe({
  @required BuildContext context,
  bool all,
  bool events,
  bool notice,
}) async {
  try {
    await FirebaseMessaging.instance.getToken.call().then((value) {
      context.read<FCMState>().getFcm(value);
    });
    await FirebaseFirestore.instance
        .collection('topics')
        .doc(context.read<FCMState>().fcm)
        .set({
      'default': all ? 'subscribed' : null,
      'events': events ? 'subscribed' : null,
      'notice': notice ? 'subscribed' : null,
    });
    debugPrint('Pushed and subscribed to the topic: default');
  } on FirebaseException catch (firebaseException) {
    firebaseError(
      context: context,
      message: firebaseException.message,
    );
  }
}

Future<void> deleteFromFirestoreAndUnsubscribe({
  @required BuildContext context,
  bool all,
  bool events,
  bool notice,
}) async {
  try {
    await FirebaseMessaging.instance.unsubscribeFromTopic('default');
    await FirebaseFirestore.instance
        .collection('topics')
        .doc(context.read<FCMState>().fcm)
        .update({
      'default': all ? FieldValue.delete() : DoNothingAction(),
      'events': events ? FieldValue.delete() : DoNothingAction(),
      'notice': notice ? FieldValue.delete() : DoNothingAction(),
    });
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

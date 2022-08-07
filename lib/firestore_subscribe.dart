// import 'dart:io';

// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_messaging/firebase_messaging.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';

// Future<void> pushTopicToFirestoreAndSubscribe({
//   required BuildContext context,
//   required bool all,
//   required bool events,
//   required bool notice,
// }) async {
//   try {
//     await FirebaseMessaging.instance.getToken.call().then((value) {
//       context.read<FCMState>().getFcm(value!);
//     });
//     await FirebaseFirestore.instance
//         .collection('topics')
//         .doc(context.read<FCMState>().fcm)
//         .set({
//       'Toate': all ? 'subscribed' : null,
//       'Evenimente': events ? 'subscribed' : null,
//       'Sesizari': notice ? 'subscribed' : null,
//     });
//     FirebaseMessaging.instance.subscribeToTopic('Toate');
//     FirebaseMessaging.instance.subscribeToTopic('Evenimente');
//     FirebaseMessaging.instance.subscribeToTopic('Sesizari');
//     debugPrint('Pushed and subscribed to the topic: default');
//   } on FirebaseException catch (firebaseException) {
//     firebaseError(
//       context: context,
//       message: firebaseException.message,
//     );
//   }
// }

// Future<void> deleteFromFirestoreAndUnsubscribe({
//   required BuildContext context,
//   required bool all,
//   required bool events,
//   required bool notice,
// }) async {
//   try {
//     await FirebaseMessaging.instance.unsubscribeFromTopic('default');
//     await FirebaseFirestore.instance
//         .collection('topics')
//         .doc(context.read<FCMState>().fcm)
//         .update({
//       'Toate': all ? FieldValue.delete() : DoNothingAction(),
//       'Evenimente': events ? FieldValue.delete() : DoNothingAction(),
//       'Sesizari': notice ? FieldValue.delete() : DoNothingAction(),
//     });
//     FirebaseMessaging.instance.unsubscribeFromTopic('Toate');
//     FirebaseMessaging.instance.unsubscribeFromTopic('Evenimente');
//     FirebaseMessaging.instance.unsubscribeFromTopic('Sesizari');
//     debugPrint('Deleted from firestore and unsubscribed');
//   } on FirebaseException catch (firebaseException) {
//     debugPrint('error: ${firebaseException.message}');
//     firebaseError(
//       context: context,
//       message: firebaseException.message,
//     );
//   }
// }

// firebaseError({required BuildContext context, String? message}) {
//   showDialog(
//     context: context,
//     builder: (BuildContext context) => Platform.isIOS
//         ? CupertinoAlertDialog(
//             title: Text('Eroare'),
//             content: Text('$message'),
//             actions: [
//               TextButton(
//                 onPressed: () {
//                   Navigator.pop(context);
//                 },
//                 child: Text('OK'),
//               ),
//             ],
//           )
//         : AlertDialog(
//             title: Text('Eroare'),
//             content: Text('$message'),
//             actions: [
//               TextButton(
//                 onPressed: () {
//                   Navigator.pop(context);
//                 },
//                 child: Text('OK'),
//               ),
//             ],
//           ),
//   );
// }

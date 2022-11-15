import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_loadingindicator/flutter_loadingindicator.dart';
import 'package:get/get.dart';

class SignInController extends GetxController {
  Future signInEmail(String emailAddress, String password) async {
    try {
      EasyLoading.show();
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: emailAddress, password: password);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        EasyLoading.dismiss();
        Get.defaultDialog(
          title: 'Oops',
          middleText: 'Nu exista un user cu acest email!',
          actions: [
            TextButton(
              onPressed: () => Get.back(),
              child: const Text('Ok'),
            ),
          ],
        );
        debugPrint('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        EasyLoading.dismiss();
        Get.defaultDialog(
          title: 'Oops',
          middleText: 'Parola introdusa nu este corecta!',
          actions: [
            TextButton(
              onPressed: () => Get.back(),
              child: const Text('Ok'),
            ),
          ],
        );
        debugPrint('Wrong password provided for that user.');
      }
    }
  }
}

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_loadingindicator/flutter_loadingindicator.dart';
import 'package:get/get.dart';

class ResetPasswordController extends GetxController {
  Future forgotPassword(String email) async {
    if (!EasyLoading.isShow) {
      EasyLoading.show();
    }
    try {
      await FirebaseAuth.instance
          .sendPasswordResetEmail(email: email)
          .then((value) {
        EasyLoading.dismiss();
        Get.defaultDialog(
          barrierDismissible: false,
          title: 'Succes',
          middleText: 'A fost trimis un email de resetare a parolei pe $email',
          actions: [
            TextButton(
              onPressed: () => Get.back(),
              child: const Text('ok'),
            ),
          ],
        );
      });
    } on FirebaseAuthException catch (e) {
      if (e.code == "user-not-found") {
        EasyLoading.dismiss();
        Get.defaultDialog(
          barrierDismissible: false,
          title: 'Oops',
          middleText: 'Nu exista un user cu acest email!',
          onConfirm: () => Get.back(),
        );
        debugPrint('No user found for that email.');
      }
    }
  }
}

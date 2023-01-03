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
          title: 'success'.tr,
          middleText: 'reset-password-email'.trParams(
            {
              "email": email,
            },
          ),
          actions: [
            TextButton(
              onPressed: () => Get.back(),
              child: const Text('ok'),
            ),
          ],
        );
      });
    } on FirebaseAuthException catch (e) {
      EasyLoading.dismiss();
      Get.defaultDialog(
        barrierDismissible: false,
        title: 'Oops',
        middleText: e.code,
        onConfirm: () => Get.back(),
      );
    }
  }
}

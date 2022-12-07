import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_loadingindicator/flutter_loadingindicator.dart';
import 'package:get/get.dart';

class SignUpController extends GetxController {
  Future createAccount(String emailAddress, String password) async {
    EasyLoading.show();
    try {
      await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
        email: emailAddress,
        password: password,
      )
          .then((value) {
        EasyLoading.dismiss();
        Get.defaultDialog(
          title: 'Succes',
          middleText: 'User-ul ${value.user!.email} a fost creat',
          actions: [
            TextButton(
              onPressed: () => Get.back(),
              child: const Text('ok'),
            ),
          ],
        );
      });
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        EasyLoading.dismiss();
        Get.defaultDialog(
          title: 'Oops',
          middleText:
              'Parola este prea slaba, introduceti o parola mai complexa',
          actions: [
            TextButton(
              onPressed: () => Get.back(),
              child: const Text('Ok'),
            ),
          ],
        );
      } else if (e.code == 'email-already-in-use') {
        EasyLoading.dismiss();
        Get.defaultDialog(
          title: 'Oops',
          middleText: 'Acest email exista deja in baza de date!',
          actions: [
            TextButton(
              onPressed: () => Get.back(),
              child: const Text('Ok'),
            ),
          ],
        );
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }
}

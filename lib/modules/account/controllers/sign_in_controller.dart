import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_loadingindicator/flutter_loadingindicator.dart';
import 'package:flutterapperadauti/routes/app_pages.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SignInController extends GetxController {
  Future signInEmail(String emailAddress, String password) async {
    try {
      EasyLoading.show();
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: emailAddress, password: password)
          .then((account) async {
        EasyLoading.dismiss();
        SharedPreferences sharedPreferences =
            await SharedPreferences.getInstance();
        sharedPreferences.setString("email", emailAddress);
        sharedPreferences.setString("password", password);
        Get.defaultDialog(
          title: 'Succes',
          middleText: 'Ati fost autentificat cu success',
          actions: [
            TextButton(
              onPressed: () => Get.offAndToNamed(Routes.home),
              child: const Text('ok'),
            ),
          ],
        );
      });
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

  Future<UserCredential> signInWithGoogle() async {
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );
    EasyLoading.show();
    // Once signed in, return the UserCredential
    return await FirebaseAuth.instance.signInWithCredential(credential).then(
      (value) {
        Get.offAndToNamed(Routes.home);
        return value;
      },
    );
  }

  Future signInAsGuest() async {
    try {
      if (!EasyLoading.isShow) {
        EasyLoading.show();
      }
      await FirebaseAuth.instance.signInAnonymously().then((value) {
        EasyLoading.dismiss();
        Get.defaultDialog(
          title: 'Succes',
          middleText: 'Ati fost autentificat cu success ca si Guest',
          barrierDismissible: false,
          actions: [
            TextButton(
              onPressed: () {
                // Get.offAllNamed(Routes.HOME);
                Get.back();
                Get.offAndToNamed(Routes.home);
              },
              child: const Text('ok'),
            ),
          ],
        );
      });
      debugPrint("Signed in with temporary account.");
    } on FirebaseAuthException catch (e) {
      EasyLoading.dismiss();
      switch (e.code) {
        case "operation-not-allowed":
          debugPrint("Anonymous auth hasn't been enabled for this project.");
          break;
        default:
          debugPrint("Unknown error.");
      }
    }
  }
}

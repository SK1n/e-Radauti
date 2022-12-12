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
          barrierDismissible: false,
          title: 'Succes',
          middleText: 'Ati fost autentificat cu success',
          onConfirm: () => Get.offAllNamed(Routes.home),
        );
      });
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        EasyLoading.dismiss();
        Get.defaultDialog(
          barrierDismissible: false,
          title: 'Oops',
          middleText: 'Nu exista un user cu acest email!',
          onConfirm: () => Get.back(),
        );
        debugPrint('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        EasyLoading.dismiss();
        Get.defaultDialog(
          barrierDismissible: false,
          title: 'Oops',
          middleText: 'Parola introdusa nu este corecta!',
          onConfirm: () => Get.back(),
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
          barrierDismissible: false,
          title: 'Succes',
          middleText: 'Ati fost autentificat cu success ca si Guest',
          onConfirm: () => Get.offAllNamed(Routes.home),
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

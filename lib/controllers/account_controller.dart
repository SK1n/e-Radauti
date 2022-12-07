import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_loadingindicator/flutter_loadingindicator.dart';
import 'package:flutterapperadauti/routes/app_pages.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AccountController extends GetxController {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  late SharedPreferences _sharedPreferences;

  final _newPassword = ''.obs;
  get newPassword => _newPassword.value;
  set newPassword(value) => _newPassword.value = value;

  getPassword() {
    return _sharedPreferences.getString("password");
  }

  isSignedIn() => _firebaseAuth.currentUser != null;
  getEmail() => _firebaseAuth.currentUser?.email;
  getVerified() => _firebaseAuth.currentUser?.emailVerified;
  signOut() async {
    !EasyLoading.isShow ? EasyLoading.show() : DoNothingAction();
    await _firebaseAuth.signOut().then((value) {
      EasyLoading.isShow ? EasyLoading.dismiss() : DoNothingAction();
      Get.offAllNamed(Routes.signIn);
    });
  }

  isAnnonymous() => _firebaseAuth.currentUser?.isAnonymous;
  Future updatePassword(String newPassword) async {
    try {
      await _firebaseAuth.currentUser!
          .updatePassword(newPassword)
          .then((value) => Get.back());
    } on FirebaseAuthException catch (exception) {
      Get.defaultDialog(title: exception.code.tr);
    }
  }

  @override
  void onReady() async {
    _sharedPreferences = await SharedPreferences.getInstance();
    super.onReady();
  }
}

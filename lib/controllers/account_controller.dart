import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutterapperadauti/routes/app_pages.dart';
import 'package:flutterapperadauti/utils/helpers/get_data_firebase.dart';
import 'package:flutterapperadauti/utils/helpers/upload_data_firebase.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AccountController extends GetxController
    with GetDataFirebase, UploadDataFirebase {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  late SharedPreferences _sharedPreferences;

  // final _username = _firebaseAuth.currentUser!.displayName.obs;
  // get username => _username.value;
  // set username(value) => _username.value = value;

  final _username = ''.obs;
  get username => _username.value;
  set username(value) => _username.value = value;

  final _newPassword = ''.obs;
  get newPassword => _newPassword.value;
  set newPassword(value) => _newPassword.value = value;

  updateDisplayName(String displayName) async {
    try {
      await _firebaseAuth.currentUser!.updateDisplayName(displayName);
      Get.defaultDialog(
        barrierDismissible: false,
        title: 'success'.tr,
        onConfirm: () => Get.back(),
        content: Text(
          'success-name-update'.trParams(
            {"name": displayName},
          ),
        ),
      );
      username = displayName;
    } catch (e) {
      Get.defaultDialog(
        barrierDismissible: false,
        title: 'error'.tr,
        content: Text('please-retry'.tr),
        onConfirm: () => Get.back(),
      );
    }
  }

  setInitialUsername() {
    username = _firebaseAuth.currentUser!.displayName;
  }

  getPassword() => _sharedPreferences.getString("password");
  getPhoneNumber() => _firebaseAuth.currentUser!.phoneNumber;

  getEmail() => _firebaseAuth.currentUser?.email;
  getVerified() => _firebaseAuth.currentUser?.emailVerified;

  isAnnonymous() => _firebaseAuth.currentUser?.isAnonymous;

  Future updatePassword(String newPassword) async {
    try {
      await _firebaseAuth.currentUser!
          .updatePassword(newPassword)
          .then((value) => Get.back());
    } on FirebaseAuthException catch (exception) {
      Get.defaultDialog(
        barrierDismissible: false,
        title: exception.code.tr,
        onConfirm: () => Get.back(),
        middleText: '',
      );
    }
  }

  isSignedIn() => _firebaseAuth.currentUser != null;
  signOut() async {
    await _firebaseAuth.signOut().then((value) {
      Get.offAllNamed(Routes.logIn);
    });
  }

  @override
  void onReady() async {
    if (Get.currentRoute != Routes.reportProblem) {
      if (!isAnnonymous()) {
        _sharedPreferences = await SharedPreferences.getInstance();
        setInitialUsername();
      } else {
        Get.offAndToNamed(Routes.logIn);
      }
    }
    super.onReady();
  }
}

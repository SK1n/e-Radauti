import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutterapperadauti/routes/app_pages.dart';
import 'package:flutterapperadauti/utils/base_controller.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AccountController extends BaseController {
  late SharedPreferences _sharedPreferences;

  // final _username = fireRepo.auth.currentUser!.displayName.obs;
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
      await fireRepo.auth.currentUser!.updateDisplayName(displayName);
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
    username = fireRepo.auth.currentUser!.displayName;
  }

  getPassword() => _sharedPreferences.getString("password");
  getPhoneNumber() => fireRepo.auth.currentUser!.phoneNumber;

  getEmail() => fireRepo.auth.currentUser?.email;
  getVerified() => fireRepo.auth.currentUser?.emailVerified;

  isAnnonymous() => fireRepo.auth.currentUser?.isAnonymous;

  Future updatePassword(String newPassword) async {
    try {
      await fireRepo.auth.currentUser!
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

  isSignedIn() => fireRepo.auth.currentUser != null;
  signOut() async {
    await fireRepo.auth.signOut().then((value) {
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

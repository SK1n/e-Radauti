import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_loadingindicator/flutter_loadingindicator.dart';
import 'package:flutterapperadauti/data/models/user/user_model.dart';
import 'package:flutterapperadauti/routes/app_pages.dart';
import 'package:flutterapperadauti/utils/helpers/get_data_firebase.dart';
import 'package:flutterapperadauti/utils/helpers/upload_data_firebase.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AccountController extends GetxController
    with GetDataFirebase, UploadDataFirebase {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  late SharedPreferences _sharedPreferences;
  late Rx<UserModel> userData = const UserModel("", "", false, "").obs;

  final _newPassword = ''.obs;
  get newPassword => _newPassword.value;
  set newPassword(value) => _newPassword.value = value;

  updateDisplayName(String displayName) async {
    try {
      EasyLoading.show();
      await _firebaseAuth.currentUser!.updateDisplayName(displayName);
      await updateUserData(name: displayName);
      userData.value = await getUserData();
      EasyLoading.dismiss();
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
    } catch (e) {
      EasyLoading.dismiss();
      Get.defaultDialog(
        barrierDismissible: false,
        title: 'error'.tr,
        content: Text('please-retry'.tr),
        onConfirm: () => Get.back(),
      );
    }
  }

  updatePhoneNumber(String phoneNumber) async {
    try {
      EasyLoading.show();

      await updateUserData(phoneNumber: phoneNumber);
      userData.value = await getUserData();
      EasyLoading.dismiss();
      Get.defaultDialog(
        barrierDismissible: false,
        title: 'success'.tr,
        content: Text(
          'success-phone-update'.trParams(
            {"phone": phoneNumber},
          ),
        ),
        onConfirm: () => Get.back(),
      );
    } catch (e) {
      EasyLoading.dismiss();
      Get.defaultDialog(
        barrierDismissible: false,
        title: 'error'.tr,
        content: Text('please-retry'.tr),
        onConfirm: () => Get.back(),
      );
    }
  }

  updateUserData({String? phoneNumber, String? name}) async {
    var currentUser = _firebaseAuth.currentUser!;
    Map<String, dynamic> data = {
      "email": currentUser.email,
      "verified_email": currentUser.emailVerified,
      "phoneNumber": phoneNumber ?? _firebaseAuth.currentUser!.phoneNumber,
      "name": name ?? _firebaseAuth.currentUser!.displayName,
    };
    await uploadData(
        collection: "users", data: data, uid: _firebaseAuth.currentUser!.uid);
  }

  getPassword() => _sharedPreferences.getString("password");
  getPhoneNumber() => _firebaseAuth.currentUser!.phoneNumber;

  getUserData() async {
    try {
      return await getData(
        convert: UserModel.fromJson,
        collection: "users",
        document: _firebaseAuth.currentUser!.uid,
      );
    } catch (e) {
      rethrow;
    }
  }

  getDisplayName() => _firebaseAuth.currentUser!.displayName;
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
    !EasyLoading.isShow ? EasyLoading.show() : DoNothingAction();
    await _firebaseAuth.signOut().then((value) {
      EasyLoading.isShow ? EasyLoading.dismiss() : DoNothingAction();
      Get.offAllNamed(Routes.signIn);
    });
  }

  @override
  void onReady() async {
    if (Get.currentRoute != Routes.noticeProblem) {
      if (!isAnnonymous()) {
        _sharedPreferences = await SharedPreferences.getInstance();
        try {
          userData.value = await getUserData();
        } catch (e) {
          Get.defaultDialog(
            barrierDismissible: false,
            title: 'no-data-account'.tr,
            middleText: '',
            onConfirm: () => Get.back(),
          );
        }
      } else {
        Get.offAndToNamed(Routes.signIn);
      }
    }
    super.onReady();
  }
}

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
        title: 'success'.tr,
        content: Text(
          'success-name-update'.trParams(
            {"name": displayName},
          ),
        ),
        actions: [
          TextButton(
            onPressed: () {
              Get.back();
            },
            child: const Text('OK'),
          ),
        ],
      );
    } catch (e) {
      EasyLoading.dismiss();
      Get.defaultDialog(
        title: 'error'.tr,
        content: Text('please-retry'.tr),
        actions: [
          TextButton(
            onPressed: () => Get.back(),
            child: const Text('OK'),
          ),
        ],
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
        title: 'success'.tr,
        content: Text(
          'success-phone-update'.trParams(
            {"phone": phoneNumber},
          ),
        ),
        actions: [
          TextButton(
            onPressed: () {
              Get.back();
            },
            child: const Text('OK'),
          ),
        ],
      );
    } catch (e) {
      EasyLoading.dismiss();
      Get.defaultDialog(
        title: 'error'.tr,
        content: Text('please-retry'.tr),
        actions: [
          TextButton(
            onPressed: () => Get.back(),
            child: const Text('OK'),
          ),
        ],
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
  Future<UserModel> getUserData() async {
    return await getData(
      convert: UserModel.fromJson,
      collection: "users",
      document: _firebaseAuth.currentUser!.uid,
    );
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
      Get.defaultDialog(title: exception.code.tr);
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
    if (!isAnnonymous()) {
      _sharedPreferences = await SharedPreferences.getInstance();
      userData.value = await getUserData();
    } else {
      Get.offAndToNamed(Routes.signIn);
    }

    super.onReady();
  }
}

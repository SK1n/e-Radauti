import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_loadingindicator/flutter_loadingindicator.dart';
import 'package:flutterapperadauti/utils/helpers/upload_data_firebase.dart';
import 'package:flutterapperadauti/utils/helpers/upload_to_firebase.dart';
import 'package:get/get.dart';

class SignUpController extends GetxController with UploadDataFirebase {
  Future createAccount(String emailAddress, String password, String phoneNumber,
      String name) async {
    EasyLoading.show();
    try {
      await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
        email: emailAddress,
        password: password,
      )
          .then((value) async {
        EasyLoading.dismiss();
        await uploadData(
          uid: value.user!.uid,
          data: {
            "phone_number": phoneNumber,
            "email": emailAddress,
            "verified_email": false,
            "name": name,
          },
        );
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
      EasyLoading.dismiss();
      Get.defaultDialog(
        title: e.code.tr,
        middleText: '',
        actions: [
          TextButton(
            onPressed: () => Get.back(),
            child: const Text('Ok'),
          ),
        ],
      );
    } catch (e) {
      debugPrint(e.toString());
    }
  }
}

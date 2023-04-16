import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_loadingindicator/flutter_loadingindicator.dart';
import 'package:flutterapperadauti/data/models/user/user_model.dart';
import 'package:flutterapperadauti/repositories/firebase_repository.dart';
import 'package:get/get.dart';

class SignUpController extends GetxController with FirebaseRepository {
  final formKey = GlobalKey<FormBuilderState>();
  String _email = "";
  String _password = "";
  String _name = "";

  final _obscurePassword = true.obs;
  get obscurePassword => _obscurePassword.value;
  set obscurePassword(value) => _obscurePassword.value = value;

  Future<void> createAcc() async {
    try {
      if (!formKey.currentState!.validate()) {
        return;
      }
      EasyLoading.show();
      _email = formKey.currentState!.fields['email']!.value;
      _password = formKey.currentState!.fields['password']!.value;
      _name = formKey.currentState!.fields['name']!.value;
      final UserCredential authCredential = await signUp(_email, _password);
      await addUser(
        authCredential.user!.uid,
        UserModel(
          _email,
          _name,
          "",
          false,
          false,
          false,
          false,
          false,
          false,
          false,
        ),
      );
      EasyLoading.showSuccess('user-created'.trParams({'name': _name}));
      Get.rootDelegate.popRoute();
    } on FirebaseAuthException catch (e) {
      Get.snackbar(
        'Error',
        e.code.tr,
        duration: const Duration(seconds: 5),
      );
    } finally {
      EasyLoading.dismiss();
    }
  }

  Future createAccount(String emailAddress, String password, String phoneNumber,
      String name) async {
    EasyLoading.show();
    try {
      await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
            email: emailAddress,
            password: password,
          )
          .then(
            (value) async => await FirebaseAuth.instance.currentUser!
                .updateDisplayName(name),
          );
      EasyLoading.dismiss();
      Get.defaultDialog(
        barrierDismissible: false,
        title: 'success'.tr,
        middleText: 'user-created'.trParams({"name": name}),
        onConfirm: () => Get.back(closeOverlays: true),
      );
    } on FirebaseAuthException catch (e) {
      EasyLoading.dismiss();
      Get.defaultDialog(
        barrierDismissible: false,
        title: e.code.tr,
        middleText: '',
        onConfirm: () => Get.back(),
      );
    } catch (e) {
      debugPrint(e.toString());
    }
  }
}

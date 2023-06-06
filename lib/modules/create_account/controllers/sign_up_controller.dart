import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutterapperadauti/data/models/user/user_model.dart';
import 'package:flutterapperadauti/utils/base_controller.dart';
import 'package:get/get.dart';

class SignUpController extends BaseController {
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
      _email = formKey.currentState!.fields['email']!.value;
      _password = formKey.currentState!.fields['password']!.value;
      _name = formKey.currentState!.fields['name']!.value;
      final UserCredential authCredential =
          await fireRepo.signUp(_email, _password);
      fireRepo.setDisplayName(_name);
      await fireRepo.addUser(
        authCredential.user!.uid,
        UserModel(_email, _name, "", false, false, false, false, false, false,
            false, []),
      );
      Get.back();
    } on FirebaseAuthException catch (e) {
      Get.snackbar(
        'Error',
        e.code.tr,
        duration: const Duration(seconds: 5),
      );
    } finally {}
  }

  Future createAccount(String emailAddress, String password, String phoneNumber,
      String name) async {
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
      Get.defaultDialog(
        barrierDismissible: false,
        title: 'success'.tr,
        middleText: 'user-created'.trParams({"name": name}),
        onConfirm: () => Get.back(closeOverlays: true),
      );
    } on FirebaseAuthException catch (e) {
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

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutterapperadauti/routes/app_pages.dart';
import 'package:flutterapperadauti/utils/base_controller.dart';
import 'package:get/get.dart';

class LoginController extends BaseController {
  final formKey = GlobalKey<FormBuilderState>();
  String _email = "";
  String _password = "";
  bool rememberMe = false;

  Future<void> login() async {
    formKey.currentState!.save();
    if (formKey.currentState!.validate()) {
      _email = formKey.currentState!.fields['email']!.value;
      _password = formKey.currentState!.fields['password']!.value;
      rememberMe = formKey.currentState!.fields['rememberme']?.value ?? false;
      try {
        await fireRepo.signIn(_email, _password);
        if (rememberMe) {
          await saveCredentials();
        } else {
          await clearCredentials();
        }
        Get.offAllNamed(Routes.home);
      } on FirebaseAuthException catch (e) {
        Get.snackbar(
          'Error',
          e.message ?? 'An error occurred',
          duration: const Duration(seconds: 5),
        );
      } finally {}
    }
  }

  Future<void> saveCredentials() async {
    const storage = FlutterSecureStorage();
    await storage.write(key: 'user_email', value: _email);
    await storage.write(key: 'user_password', value: _password);
  }

  Future<void> clearCredentials() async {
    const storage = FlutterSecureStorage();
    await storage.delete(key: 'user_email');
    await storage.delete(key: 'user_password');
  }

  Future<void> loginAsGuest() async {
    try {
      await fireRepo.signInAnonymously();
      Get.offAllNamed(Routes.home);
    } finally {}
  }
}

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_loadingindicator/flutter_loadingindicator.dart';
import 'package:flutterapperadauti/repositories/firebase_repository.dart';
import 'package:flutterapperadauti/routes/app_pages.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginController extends GetxController with FirebaseRepository {
  final formKey = GlobalKey<FormBuilderState>();
  String _email = "";
  String _password = "";
  bool rememberMe = false;

  Future<void> login() async {
    formKey.currentState!.save();
    if (formKey.currentState!.validate()) {
      EasyLoading.show();
      _email = formKey.currentState!.fields['email']!.value;
      _password = formKey.currentState!.fields['password']!.value;
      try {
        await signIn(_email, _password);
        if (rememberMe) {
          await saveCredentials(_email, _password);
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
      } finally {
        EasyLoading.dismiss();
      }
    }
  }

  Future<void> saveCredentials(String email, String password) async {
    final storage = await SharedPreferences.getInstance();
    await storage.setString('email', email);
    await storage.setString('password', password);
  }

  Future<void> clearCredentials() async {
    final storage = await SharedPreferences.getInstance();
    await storage.remove('email');
    await storage.remove('password');
  }

  Future<void> loginAsGuest() async {
    try {
      EasyLoading.show();
      await FirebaseAuth.instance.signInAnonymously();
      Get.rootDelegate.offAndToNamed(Routes.home);
    } finally {
      EasyLoading.dismiss();
    }
  }
}

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutterapperadauti/repositories/firebase_repository.dart';
import 'package:flutterapperadauti/routes/app_pages.dart';
import 'package:get/get.dart';

class LoginController extends GetxController with FirebaseRepository {
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
        await signIn(_email, _password);
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
      } finally {
      }
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
      await signInAnonymously();
      Get.offAllNamed(Routes.home);
    } finally {
    }
  }

  @override
  void onReady() async {
    super.onReady();
    const storage = FlutterSecureStorage();
    String? email = await storage.read(key: 'user_email');
    String? password = await storage.read(key: 'user_password');
    if (email == null && password == null) {
      return;
    }
    Get.offAllNamed(Routes.home);
  }
}

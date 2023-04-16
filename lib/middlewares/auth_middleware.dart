import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutterapperadauti/repositories/firebase_repository.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../routes/app_pages.dart';

class AuthMiddleware extends GetMiddleware with FirebaseRepository {
  @override
  Future<GetNavConfig?> redirectDelegate(GetNavConfig route) async {
    final prefs = await SharedPreferences.getInstance();
    final email = prefs.getString('email');
    final password = prefs.getString('password');
    debugPrint("AUTH MIDDLEWARE");
    // if (isAnonymous) {
    //   return null;
    // }
    if (email != null && password != null) {
      debugPrint("EMAIL: $email");
      try {
        UserCredential userCredentials = await signIn(email, password);
        await prefs.setString('email', userCredentials.user!.email!);
        await prefs.setString('password', password);

        Get.offAllNamed(Routes.home);
      } on FirebaseAuthException catch (e) {
        Get.snackbar(
          'Error',
          e.message ?? 'An error occurred',
          duration: const Duration(seconds: 5),
        );
        Get.offAllNamed(Routes.logIn);
      }
      return null;
    } else {
      // Redirect to the login screen
      return route;
    }
  }
}

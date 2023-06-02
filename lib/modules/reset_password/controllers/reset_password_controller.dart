import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutterapperadauti/repositories/firebase_repository.dart';
import 'package:get/get.dart';

class ResetPasswordController extends GetxController with FirebaseRepository {
  final formKey = GlobalKey<FormBuilderState>();
  String _email = "";

  Future<void> sendEmailResetPassword() async {
    if (!formKey.currentState!.validate()) {
      return;
    }
    _email = formKey.currentState!.fields['email']!.value;
    try {
      await resetPassword(_email);
      Get.back();
    } on FirebaseAuthException catch (e) {
      rethrow;
    } 
  }
}

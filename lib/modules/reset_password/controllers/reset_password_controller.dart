import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutterapperadauti/utils/base_controller.dart';
import 'package:get/get.dart';

class ResetPasswordController extends BaseController {
  final formKey = GlobalKey<FormBuilderState>();
  String _email = "";

  Future<void> sendEmailResetPassword() async {
    if (!formKey.currentState!.validate()) {
      return;
    }
    _email = formKey.currentState!.fields['email']!.value;
    try {
      await fireRepo.resetPassword(_email);
      Get.back();
    } on FirebaseAuthException catch (e) {
      rethrow;
    }
  }
}

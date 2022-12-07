import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class FAuthException extends FirebaseAuthException {
  FAuthException({required super.code}) {
    switch (code) {
      case "wrong-password":
        _showDialog(message: message);
    }
  }

  _showDialog({required String? message}) {
    Get.defaultDialog(title: message!);
  }
}

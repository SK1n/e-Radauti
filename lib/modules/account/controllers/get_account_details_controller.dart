import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class GetAccountDetailsController extends GetxController {
  getEmail() {
    FirebaseAuth firebaseAuth = FirebaseAuth.instance;
    return firebaseAuth.currentUser != null
        ? firebaseAuth.currentUser!.email ?? "nothing"
        : "no user";
  }
}

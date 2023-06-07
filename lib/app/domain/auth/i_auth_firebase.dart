import 'package:flutterapperadauti/app/domain/auth/auth_firebase_result.dart';

abstract class IAuthFirebase {
  Future<AuthFirebaseResult> createUserWithEmailAndPassword({
    required String email,
    required String password,
    required String username,
    required String phoneNumber,
  });
  Future<AuthFirebaseResult> signInWithEmailAndPassword({
    required String email,
    required String password,
  });
}

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutterapperadauti/app/domain/auth/auth_firebase_result.dart';
import 'package:flutterapperadauti/app/domain/auth/i_auth_firebase.dart';
import 'package:flutterapperadauti/app/infrastructure/auth/auth_failure_or_success.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: IAuthFirebase)
class AuthFirebase extends IAuthFirebase {
  final FirebaseAuth _firebaseAuth;

  AuthFirebase(this._firebaseAuth);
  @override
  Future<AuthFirebaseResult> createUserWithEmailAndPassword({
    required String email,
    required String password,
    required String username,
    required String phoneNumber,
  }) async {
    try {
      await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      _firebaseAuth.currentUser?.updateDisplayName(username);
      return AuthFirebaseResult(
        isSuccess: true,
        authFailureOrSuccess: const AuthFailureOrSuccess.success(),
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'email-already-in-use') {
        return AuthFirebaseResult(
          isSuccess: false,
          authFailureOrSuccess: const AuthFailureOrSuccess.emailAlreadyInUse(),
        );
      } else if (e.code == 'weak-password') {
        return AuthFirebaseResult(
          isSuccess: false,
          authFailureOrSuccess: const AuthFailureOrSuccess.weakPassword(),
        );
      } else {
        return AuthFirebaseResult(
          isSuccess: false,
          authFailureOrSuccess: const AuthFailureOrSuccess.serverError(),
        );
      }
    }
  }

  @override
  Future<AuthFirebaseResult> signInWithEmailAndPassword(
      {required String email, required String password}) async {
    try {
      await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return AuthFirebaseResult(
        isSuccess: true,
        authFailureOrSuccess: const AuthFailureOrSuccess.success(),
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == "invalid-email" ||
          e.code == "user-not-found" ||
          e.code == 'wrong-password') {
        return AuthFirebaseResult(
          isSuccess: false,
          authFailureOrSuccess:
              const AuthFailureOrSuccess.invalidEmailAndPassword(),
        );
      } else {
        return AuthFirebaseResult(
          isSuccess: false,
          authFailureOrSuccess: const AuthFailureOrSuccess.serverError(),
        );
      }
    }
  }
}

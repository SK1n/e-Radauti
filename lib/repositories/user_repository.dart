import 'package:firebase_auth/firebase_auth.dart';

class UserRepository {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<void> signUp(String email, String password) async {
    await _auth.createUserWithEmailAndPassword(
        email: email, password: password);
  }

  Future<UserCredential> signIn(String email, String password) async {
    return await _auth.signInWithEmailAndPassword(
        email: email, password: password);
  }

  Future<void> signOut() async {
    await _auth.signOut();
  }

  Future<void> resetPassword(String email) async {
    await _auth.sendPasswordResetEmail(email: email);
  }

  Future<void> updateEmail(String email) async {
    final user = _auth.currentUser;
    if (user != null) {
      await user.updateEmail(email);
    }
  }

  Future<void> updatePassword(String password) async {
    final user = _auth.currentUser;
    if (user != null) {
      await user.updatePassword(password);
    }
  }

  Future<void> deleteAccount() async {
    final user = _auth.currentUser;
    if (user != null) {
      await user.delete();
    }
  }

  bool isSignedIn() {
    return _auth.currentUser != null;
  }

  bool get isAnonymous => _auth.currentUser!.isAnonymous;

  User? getUser() {
    return _auth.currentUser;
  }
}

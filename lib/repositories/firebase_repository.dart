import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutterapperadauti/data/models/user/user_model.dart';

class FirebaseRepository {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseStorage _storage = FirebaseStorage.instance;

  Future<UserCredential> signUp(String email, String password) async {
    return await _auth.createUserWithEmailAndPassword(
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

  Future<void> signInAnonymously() async {
    await _auth.signInAnonymously();
  }

  bool isSignedIn() {
    return _auth.currentUser != null;
  }

  bool get isAnonymous => _auth.currentUser!.isAnonymous;

  User? getUser() {
    return _auth.currentUser;
  }

  Future<void> addUser(String uid, UserModel userModel) async {
    await _firestore.collection('users').doc(uid).set(userModel.toJson());
  }

  Future<UserModel> getUserDoc(String uid) async {
    final snapshot = await _firestore.collection('users').doc(uid).get();
    return UserModel.fromJson(snapshot.data()!);
  }

  String? getAvatarUrl() {
    return _auth.currentUser!.photoURL;
  }

  Future<void> setDisplayName(String name) async {
    _auth.currentUser?.updateDisplayName(name);
  }

  Future<String> uploadImage(String path, String fileName) async {
    final Reference reference = _storage.ref().child(path).child(fileName);
    final UploadTask uploadTask = reference.putFile(File(fileName));
    final TaskSnapshot taskSnapshot = await uploadTask.whenComplete(() => null);
    return taskSnapshot.ref.getDownloadURL();
  }

  Future<void> deleteImage(String url) async {
    final Reference reference = _storage.refFromURL(url);
    await reference.delete();
  }
}

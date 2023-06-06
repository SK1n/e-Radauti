import 'dart:convert';
import 'dart:io';
import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutterapperadauti/data/models/user/user_model.dart';

class FirebaseRepository {
  final FirebaseAuth auth = FirebaseAuth.instance;
  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  final FirebaseStorage _storage = FirebaseStorage.instance;

  Future<UserCredential> signUp(String email, String password) async {
    return await auth.createUserWithEmailAndPassword(
        email: email, password: password);
  }

  Future<UserCredential> signIn(String email, String password) async {
    return await auth.signInWithEmailAndPassword(
        email: email, password: password);
  }

  Future<void> signOut() async {
    await auth.signOut();
  }

  Future<void> resetPassword(String email) async {
    await auth.sendPasswordResetEmail(email: email);
  }

  Future<void> updateEmail(String email) async {
    final user = auth.currentUser;
    if (user != null) {
      await user.updateEmail(email);
    }
  }

  Future<void> updatePassword(String password) async {
    final user = auth.currentUser;
    if (user != null) {
      await user.updatePassword(password);
    }
  }

  Future<void> deleteAccount() async {
    final user = auth.currentUser;
    if (user != null) {
      await user.delete();
    }
  }

  Future<void> signInAnonymously() async {
    await auth.signInAnonymously();
  }

  bool isSignedIn() {
    return auth.currentUser != null;
  }

  bool get isAnonymous => auth.currentUser!.isAnonymous;

  User? getUser() {
    return auth.currentUser;
  }

  String getUID() {
    return getUser()!.uid;
  }

  Future<void> addUser(String uid, UserModel userModel) async {
    await firestore.collection('users').doc(uid).set(userModel.toJson());
  }

  Future<UserModel> getUserDoc(String uid) async {
    final snapshot = await firestore.collection('users').doc(uid).get();
    return UserModel.fromJson(snapshot.data()!);
  }

  String? getAvatarUrl() {
    return auth.currentUser!.photoURL;
  }

  Future<void> setDisplayName(String name) async {
    auth.currentUser?.updateDisplayName(name);
  }

  Future<void> deleteImage(String url) async {
    final Reference reference = _storage.refFromURL(url);
    await reference.delete();
  }

  Future<dynamic> getDocument({
    required DocumentReference document,
    required Function convert,
  }) async {
    try {
      DocumentSnapshot ds = await document.get();
      return convert(ds.data());
    } on Exception {
      rethrow;
    }
  }

  Future<String> getImageUrl(String path) async {
    return await _storage.refFromURL(path).getDownloadURL();
  }

  Future<String> uploadImageToFirebase({String? path, dynamic file}) async {
    FirebaseStorage storage = FirebaseStorage.instance;
    Reference ref = storage.ref().child(
        '$path/${DateTime.now().millisecondsSinceEpoch.toString() + Random().nextInt(3000).toString()}');
    try {
      UploadTask uploadTask;
      File newFile = File(file.path);
      uploadTask = ref.putFile(newFile);
      var link = await (await uploadTask).ref.getDownloadURL();
      return link;
    } catch (e) {
      rethrow;
    }
  }

  Future<void> uploadDataToFirebase({
    String? collection,
    String? document,
    dynamic data,
    String? array,
  }) async {
    CollectionReference collectionReference =
        FirebaseFirestore.instance.collection(collection!);
    DocumentReference documentReference = collectionReference.doc(document);
    try {
      await documentReference.update(
        {
          array!: FieldValue.arrayUnion(jsonDecode(data)),
        },
      );
    } catch (e) {
      rethrow;
    }
  }
}

import 'dart:convert';
import 'dart:io';
import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class UploadToFirebase {
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
      await documentReference.update({
        array!: FieldValue.arrayUnion(jsonDecode(data))
      });
    } catch (e) {
      rethrow;
    }
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
      debugPrint(link);
      return link;
    } catch (e) {
      rethrow;
    }
  }
}

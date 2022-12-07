import 'package:cloud_firestore/cloud_firestore.dart';

abstract class UploadDataFirebase {
  Future<dynamic> uploadData({
    String? collection = 'users',
    String? uid,
    Map<String, dynamic>? data,
  }) async {
    CollectionReference collectionReference =
        FirebaseFirestore.instance.collection(collection!);
    await collectionReference.doc(uid).set(data);
  }
}

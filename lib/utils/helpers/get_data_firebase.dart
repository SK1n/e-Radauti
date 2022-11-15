import 'package:cloud_firestore/cloud_firestore.dart';

abstract class GetDataFirebase {
  Future<dynamic> getData({
    String? collection = 'collection',
    String? document,
    required Function convert,
  }) async {
    CollectionReference collectionReference =
        FirebaseFirestore.instance.collection(collection!);
    DocumentReference documentReference = collectionReference.doc(document);
    try {
      DocumentSnapshot snapshot = await documentReference.get();
      return convert(snapshot.data());
    } on Exception {
      rethrow;
    }
  }
}

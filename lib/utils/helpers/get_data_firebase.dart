import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_loadingindicator/flutter_loadingindicator.dart';

abstract class GetDataFirebase {
  Future<dynamic> getData({
    String? collection = 'collection',
    required String document,
    required Function convert,
  }) async {
    if (!EasyLoading.isShow) {
      // EasyLoading.show();
    }
    CollectionReference collectionReference =
        FirebaseFirestore.instance.collection(collection!);
    DocumentReference documentReference = collectionReference.doc(document);
    try {
      DocumentSnapshot snapshot = await documentReference.get();
      //EasyLoading.dismiss();
      return convert(snapshot.data());
    } on Exception {
      // EasyLoading.dismiss();

      rethrow;
    }
  }
}

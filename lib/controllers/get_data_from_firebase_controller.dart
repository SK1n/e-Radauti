import 'package:cloud_firestore/cloud_firestore.dart';

class GetDataFromFirebaseController {
  FirebaseFirestore? _instance;
  var _localModel = [];
  List<dynamic> get localModel => _localModel;

  getDataFromFirebase(document) async {
    _instance = FirebaseFirestore.instance;
    CollectionReference collectionReference =
        _instance!.collection('collection');
    DocumentSnapshot snapshot = await collectionReference.doc(document).get();
    var _localModel = snapshot.data();
    return _localModel;
  }

  getSortedDataFromFirebase(
      {String? document, String? array, String? sortValue}) async {
    var localModel = await getDataFromFirebase(document);
    var aux;
    for (int element1 = 0; element1 < localModel[array].length; element1++) {
      for (int element2 = element1;
          element2 < localModel[array].length;
          element2++) {
        if (localModel[array][element1][sortValue] <
            localModel[array][element2][sortValue]) {
          aux = localModel[array][element2];
          localModel[array][element2] = localModel[array][element1];
          localModel[array][element1] = aux;
        }
      }
    }
    return localModel;
  }

  int getLength(List firebaseArray) {
    return firebaseArray.length;
  }
}

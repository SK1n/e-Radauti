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

  int getLength(List firebaseArray) {
    return firebaseArray.length;
  }

  getDataFromFirebase2<TModel>(String array, String document,
      TModel Function(Map<String, dynamic>) converter) async {
    final instance = FirebaseFirestore.instance;
    final localModel = <TModel>[];
    final collectionReference = instance.collection('collection');
    final snapshot = await collectionReference.doc(document).get();
    final data = snapshot.data() as Map;
    final localData = data[array] as List<dynamic>;

    localData.forEach((element) {
      localModel.add(converter(element));
    });

    return localModel;
  }
}

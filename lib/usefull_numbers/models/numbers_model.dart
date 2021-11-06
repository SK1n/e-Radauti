import 'package:cloud_firestore/cloud_firestore.dart';

class NumbersModel {
  String title;
  List<dynamic> phone;
  List<dynamic> email;
  NumbersModel({
    this.title,
    this.phone,
    this.email,
  });

  factory NumbersModel.fromJson(Map<String, dynamic> json) {
    return NumbersModel(
      title: json['title'],
      phone: json['phone'],
      email: json['email'],
    );
  }
}

class FetchNumbersData {
  FirebaseFirestore _instance;
  List<NumbersModel> _localModel = [];
  List<NumbersModel> get localModel => _localModel;

  getDataFromFirebase(String array) async {
    _instance = FirebaseFirestore.instance;
    _localModel = [];
    CollectionReference collectionReference =
        _instance.collection('collection');
    DocumentSnapshot snapshot = await collectionReference.doc('Numbers').get();
    var data = snapshot.data() as Map;
    var localData;
    localData = data['$array'] as List<dynamic>;
    localData.forEach((element) {
      _localModel.add(NumbersModel.fromJson(element));
    });
    return _localModel;
  }

  int getLength() {
    return _localModel.length;
  }
}

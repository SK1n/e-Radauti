import 'package:cloud_firestore/cloud_firestore.dart';

class LocalCouncilModel {
  String party;
  String name;
  String function;
  String phoneNumber;
  String email;
  String url;
  LocalCouncilModel({
    this.email,
    this.function,
    this.name,
    this.party,
    this.phoneNumber,
    this.url,
  });

  factory LocalCouncilModel.fromJson(Map<String, dynamic> json) {
    return LocalCouncilModel(
      name: json['name'],
      function: json['function'],
      party: json['party'],
      url: json['url'],
      email: json['email'],
      phoneNumber: json['phone_number'],
    );
  }
}

class FetchLocalCouncilData {
  FirebaseFirestore _instance;
  List<LocalCouncilModel> _localModel = [];
  List<LocalCouncilModel> get localModel => _localModel;

  getDataFromFirebase() async {
    _instance = FirebaseFirestore.instance;
    _localModel = [];
    CollectionReference collectionReference =
        _instance.collection('collection');
    DocumentSnapshot snapshot =
        await collectionReference.doc('LocalCouncil').get();
    var data = snapshot.data() as Map;
    var localData;
    localData = data['localcouncil'] as List<dynamic>;
    localData.forEach((element) {
      _localModel.add(LocalCouncilModel.fromJson(element));
    });
    return _localModel;
  }

  int getLength() {
    return _localModel.length;
  }
}

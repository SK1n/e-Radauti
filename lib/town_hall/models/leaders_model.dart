import 'package:cloud_firestore/cloud_firestore.dart';

class LeadersModel {
  String? name;
  String? function;
  String? location;
  String? urlFb;
  String? email;
  String? wealth;
  String? interests;
  String? urlImg;

  LeadersModel({
    this.email,
    this.function,
    this.interests,
    this.location,
    this.name,
    this.urlFb,
    this.wealth,
    this.urlImg,
  });

  factory LeadersModel.fromJson(Map<String, dynamic> json) {
    return LeadersModel(
      name: json['name'],
      function: json['function'],
      location: json['location'],
      urlFb: json['url_fb'],
      email: json['email'],
      wealth: json['wealth'],
      interests: json['interests'],
      urlImg: json['url_img'],
    );
  }
}

class FetchLeaderData {
  FirebaseFirestore? _instance;
  List<LeadersModel> _localModel = [];
  List<LeadersModel> get localModel => _localModel;

  getDataFromFirebase() async {
    _instance = FirebaseFirestore.instance;
    _localModel = [];
    CollectionReference collectionReference =
        _instance!.collection('collection');
    DocumentSnapshot snapshot = await collectionReference.doc('Leaders').get();
    var data = snapshot.data() as Map;
    var localData;
    localData = data['leaders'] as List<dynamic>;
    localData.forEach((element) {
      _localModel.add(LeadersModel.fromJson(element));
    });
    return _localModel;
  }

  int getLength() {
    return _localModel.length;
  }
}

import 'package:cloud_firestore/cloud_firestore.dart';

class LegislationModel {
  String url;
  int? date;
  String title;
  LegislationModel({
    required this.url,
    this.date,
    required this.title,
  });
  factory LegislationModel.fromJson(Map<String, dynamic> json) {
    return LegislationModel(
      url: json['link'],
      date: json['an'],
      title: json['titlu'],
    );
  }
}

class FetchLegislationData {
  FirebaseFirestore? _instance;
  List<LegislationModel> _localModel = [];
  List<LegislationModel> get localModel => _localModel;

  getLegislationFromFirebase() async {
    _instance = FirebaseFirestore.instance;
    _localModel = [];
    CollectionReference collectionReference =
        _instance!.collection('collection');
    DocumentSnapshot snapshot =
        await collectionReference.doc('Legislation').get();
    var data = snapshot.data() as Map;
    var localLegislationData;
    localLegislationData = data['2020'] as List<dynamic>;
    localLegislationData.forEach((element) {
      _localModel.add(LegislationModel.fromJson(element));
    });
    return _localModel;
  }

  int getLength() {
    return _localModel.length;
  }
}

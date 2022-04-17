import 'package:cloud_firestore/cloud_firestore.dart';

class CouncilMeetingsModel {
  String url;
  String date;
  String theagend;
  CouncilMeetingsModel({
    required this.url,
    required this.date,
    required this.theagend,
  });
  factory CouncilMeetingsModel.fromJson(Map<String, dynamic> json) {
    return CouncilMeetingsModel(
      url: json['URL'],
      date: json['date'],
      theagend: json['theagend'],
    );
  }
}

class FetchCouncilMeetingsData {
  FirebaseFirestore? _instance;
  List<CouncilMeetingsModel> _localModel = [];
  List<CouncilMeetingsModel> get localModel => _localModel;

  getCouncilMeetingsFromFirebase() async {
    _instance = FirebaseFirestore.instance;
    _localModel = [];
    CollectionReference collectionReference =
        _instance!.collection('collection');
    DocumentSnapshot snapshot =
        await collectionReference.doc('CouncilMeetings').get();
    var data = snapshot.data() as Map;
    var localData;
    localData = data['meetings'] as List<dynamic>;
    localData.forEach((element) {
      _localModel.add(CouncilMeetingsModel.fromJson(element));
    });
    return _localModel;
  }

  int getLength() {
    return _localModel.length;
  }
}

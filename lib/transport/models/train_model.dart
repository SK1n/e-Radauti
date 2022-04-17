import 'package:cloud_firestore/cloud_firestore.dart';

class TrainModel {
  List<dynamic> stations;
  List<dynamic> timeTable;
  String title;
  String train;

  TrainModel({
    required this.stations,
    required this.timeTable,
    required this.title,
    required this.train,
  });

  factory TrainModel.fromJson(Map<String, dynamic> json) {
    return TrainModel(
      stations: json['stations'],
      train: json['train'],
      title: json['title'],
      timeTable: json['time_table'],
    );
  }
}

class FetchTrainData {
  FirebaseFirestore? _instance;
  List<TrainModel> _localModel = [];
  List<TrainModel> get localModel => _localModel;

  getDataFromFirebase() async {
    _instance = FirebaseFirestore.instance;
    _localModel = [];
    CollectionReference collectionReference =
        _instance!.collection('collection');
    DocumentSnapshot snapshot = await collectionReference.doc('Train').get();
    var data = snapshot.data() as Map;
    var localData;
    localData = data['train'] as List<dynamic>;
    localData.forEach((element) {
      _localModel.add(TrainModel.fromJson(element));
    });
    return _localModel;
  }

  int getLength() {
    return _localModel.length;
  }
}

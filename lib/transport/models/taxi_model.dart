import 'package:cloud_firestore/cloud_firestore.dart';

class TaxiModel {
  String url;
  String phoneNumber;
  String driverName;
  String car;
  String plateNumber;

  TaxiModel({
    required this.car,
    required this.driverName,
    required this.phoneNumber,
    required this.plateNumber,
    required this.url,
  });

  factory TaxiModel.fromJson(Map<String, dynamic> json) {
    return TaxiModel(
      url: json['image_url'],
      phoneNumber: json['phone_number'],
      car: json['car_type'],
      plateNumber: json['plate_number'],
      driverName: json['driver_name'],
    );
  }
}

class FetchTaxiData {
  FirebaseFirestore? _instance;
  List<TaxiModel> _localModel = [];
  List<TaxiModel> get localModel => _localModel;

  getTaxiFromFirebase() async {
    _instance = FirebaseFirestore.instance;
    _localModel = [];
    CollectionReference collectionReference =
        _instance!.collection('collection');
    DocumentSnapshot snapshot = await collectionReference.doc('Taxi').get();
    var data = snapshot.data() as Map;
    var localData;
    localData = data['taxi'] as List<dynamic>;
    localData.forEach((element) {
      _localModel.add(TaxiModel.fromJson(element));
    });
    return _localModel;
  }

  int getLength() {
    return _localModel.length;
  }
}

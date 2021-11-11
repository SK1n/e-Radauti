import 'package:cloud_firestore/cloud_firestore.dart';

class AirQualityModel {
  final int pm;
  final int co;
  final double humidity;
  final double temperature;
  final String wind;
  final String pression;
  String airTS;

  AirQualityModel({
    this.pm,
    this.co,
    this.humidity,
    this.temperature,
    this.airTS,
    this.wind,
    this.pression,
  });

  factory AirQualityModel.fromJson(Map<String, dynamic> json) {
    return AirQualityModel(
      pm: json['pm25'].toInt(),
      co: json['co2'].toInt(),
      humidity: json['hm'].toDouble(),
      temperature: json['tp'].toDouble(),
      airTS: json['airTS'].toString(),
      wind: json['wind'],
      pression: json['pression'],
    );
  }
}

class FetchAirQualityData {
  FirebaseFirestore _instance;
  List<AirQualityModel> _localModel = [];
  List<AirQualityModel> get localModel => _localModel;

  getDataFromFirebase() async {
    _instance = FirebaseFirestore.instance;
    _localModel = [];
    CollectionReference collectionReference =
        _instance.collection('collection');
    DocumentSnapshot snapshot = await collectionReference.doc('Air').get();
    var data = snapshot.data() as Map;
    var localData;
    localData = data['air'] as List<dynamic>;
    localData.forEach((element) {
      _localModel.add(AirQualityModel.fromJson(element));
    });
    return _localModel;
  }

  int getLength() {
    return _localModel.length;
  }
}

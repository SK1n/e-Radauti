import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/rendering.dart';

class NewAirQualityModel {
  final int? co;
  final String? date;
  final String? direction;
  final int? hum;
  final int? hum_c;
  final int? pm;
  final double? temp_c;
  final double? temp_m;
  final double? wind;
  final int? pression;

  NewAirQualityModel({
    this.co,
    this.date,
    this.direction,
    this.hum,
    this.hum_c,
    this.pm,
    this.temp_c,
    this.temp_m,
    this.wind,
    this.pression,
  });

  factory NewAirQualityModel.fromJson(Map<String, dynamic> json) {
    return NewAirQualityModel(
      pm: json['pm25'].toInt(),
      co: json['co2'].toInt(),
      hum: json['humidity'],
      temp_c: json['temp_center'].toDouble(),
      temp_m: json['temp_meteo'].toDouble(),
      wind: json['wind'].toDouble(),
      pression: json['pression'],
      date: json['date'],
      direction: json['direction'],
      hum_c: json['humidity_center'],
    );
  }
}

class NewFetchAirQualityData {
  FirebaseFirestore? _instance;
  List<NewAirQualityModel> _localModel = [];
  List<NewAirQualityModel> get localModel => _localModel;

  getDataFromFirebase() async {
    _instance = FirebaseFirestore.instance;
    _localModel = [];
    CollectionReference collectionReference =
        _instance!.collection('collection');
    DocumentSnapshot snapshot =
        await collectionReference.doc('AirDatabase2').get();
    var data = snapshot.data() as Map;
    var localData;
    localData = data['air'] as List<dynamic>;
    localData.forEach((element) {
      _localModel.add(NewAirQualityModel.fromJson(element));
    });
    debugPrint('AirDatabase: ${_localModel.reversed.toList()}');
    return _localModel.reversed.toList();
  }

  int getLength() {
    return _localModel.length;
  }
}

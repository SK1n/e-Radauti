import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class LocalAnnouncementModel {
  String url;
  String description;
  String date;
  String host;
  String title;
  LocalAnnouncementModel({
    this.url,
    this.description,
    this.date,
    this.host,
    this.title,
  });
  factory LocalAnnouncementModel.fromJson(Map<String, dynamic> json) {
    return LocalAnnouncementModel(
      url: json['URL'],
      description: json['description'],
      date: json['date'],
      host: json['host'],
      title: json['title'],
    );
  }
}

class FetchAnnouncementData {
  FirebaseFirestore _instance;
  List<LocalAnnouncementModel> _localAnnouncement = [];

  Future<void> getAnnouncementsFromFirebase() async {
    _instance = FirebaseFirestore.instance;
    _localAnnouncement = [];
    CollectionReference localAnnouncement = _instance.collection('collection');
    DocumentSnapshot snapshot =
        await localAnnouncement.doc('Announcements').get();
    var data = snapshot.data() as Map;
    var localAnnouncementData = data['announcement'] as List<dynamic>;
    localAnnouncementData.forEach((element) {
      _localAnnouncement.add(LocalAnnouncementModel.fromJson(element));
    });
    debugPrint('data fetched');
    return _localAnnouncement.reversed.toList();
  }

  int getLength() {
    return _localAnnouncement.length;
  }
}

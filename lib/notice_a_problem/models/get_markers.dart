import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:flutter_map/flutter_map.dart';
import 'package:fluttericon/entypo_icons.dart';
import 'package:fluttericon/font_awesome5_icons.dart';
import 'package:fluttericon/octicons_icons.dart';
import 'package:latlong2/latlong.dart' as latLng;

class GetMarkers {
  String category;
  String description;
  int index;
  String institution;
  double? lat;
  double? long;
  String status;
  String subject;

  GetMarkers({
    required this.category,
    required this.description,
    required this.index,
    required this.institution,
    this.lat,
    this.long,
    required this.status,
    required this.subject,
  });

  factory GetMarkers.fromJson(Map<String, dynamic> json) {
    return GetMarkers(
      category: json['category'],
      description: json['description'],
      index: json['index'],
      institution: json['institution'],
      lat: json['lat'],
      long: json['long'],
      status: json['status'],
      subject: json['subject'],
    );
  }
}

class FetchMarkers {
  FirebaseFirestore? _instance;
  List<GetMarkers> _getMarkers = [];
  List<Marker> _marker = [];

  getMarkersFromFirebase() async {
    _instance = FirebaseFirestore.instance;
    _getMarkers = [];
    _marker = [];
    CollectionReference getMarkers = _instance!.collection('collection');
    DocumentSnapshot snapshot = await getMarkers.doc('Markers').get();
    var data = snapshot.data() as Map;
    var eventsData = data['markers'] as List<dynamic>;
    eventsData.forEach((element) {
      _getMarkers.add(GetMarkers.fromJson(element));
    });
    _getMarkers.forEach((element) {
      if (element.lat != null && element.long != null) {
        _marker.add(
          Marker(
              point: latLng.LatLng(element.lat!, element.long!),
              builder: (BuildContext context) {
                return InkWell(
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) => Platform.isIOS
                          ? CupertinoAlertDialog(
                              title: Text(
                                '${element.subject}',
                              ),
                              content: Text('${element.description}'),
                              actions: [
                                TextButton(
                                  onPressed: () => Navigator.pop(context),
                                  child: Text(
                                    'Inchide',
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ],
                            )
                          : AlertDialog(
                              title: Text('${element.subject}'),
                              content: bodyText(
                                element.description,
                                element.status,
                                element.institution,
                              ),
                              actions: [
                                TextButton(
                                  onPressed: () => Navigator.pop(context),
                                  child: Text('Inchide'),
                                ),
                              ],
                            ),
                    );
                  },
                  child: Container(
                      width: 40,
                      height: 40,
                      child: CircleAvatar(
                        backgroundColor: Colors.white,
                        child: switchIcon(element.index),
                      )),
                );
              }),
        );
      }
    });
    return _marker;
  }

  RichText bodyText(
    String description,
    String status,
    String institution,
  ) {
    return RichText(
      text: TextSpan(
        children: [
          TextSpan(
            text: '\nDescriere',
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
          ),
          TextSpan(
            text: ': $description',
            style: TextStyle(color: Colors.black),
          ),
          TextSpan(
            text: '\nStatus:',
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
          ),
          TextSpan(
            text: ' $status',
            style: TextStyle(color: Colors.black),
          ),
          TextSpan(
            text: '\nInstitutia:',
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
          ),
          TextSpan(
            text: ' $institution',
            style: TextStyle(color: Colors.black),
          ),
        ],
      ),
    );
  }

  int getLength() {
    return _getMarkers.length;
  }

  Icon switchIcon(int icon) {
    switch (icon) {
      case 0:
        return Icon(
          Entypo.dot_3,
          color: Colors.black,
        );
      case 1:
        return Icon(
          Entypo.trash,
          color: Colors.black,
        );

      case 2:
        return Icon(
          FontAwesome5.road,
          color: Colors.black,
        );

      case 3:
        return Icon(
          Entypo.lamp,
          color: Colors.black,
        );

      case 4:
        return Icon(
          Entypo.home,
          color: Colors.black,
        );

      case 5:
        return Icon(
          Octicons.shield_check,
          color: Colors.black,
        );

      case 6:
        return Icon(
          Icons.blur_circular,
          color: Colors.black,
        );

      default:
        return Icon(
          Entypo.dot_3,
          color: Colors.black,
        );
    }
  }
}

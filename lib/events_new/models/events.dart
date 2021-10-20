import 'package:add_2_calendar/add_2_calendar.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class Events {
  String url;
  String host;
  String street;
  String headline;
  String description;
  Timestamp start;
  Timestamp end;
  String category;
  String location;

  Events({
    this.category,
    this.description,
    this.end,
    this.headline,
    this.host,
    this.location,
    this.start,
    this.street,
    this.url,
  });

  factory Events.fromJson(Map<String, dynamic> json) {
    return Events(
      category: json['category'],
      description: json['description'],
      end: json['end'],
      start: json['start'],
      headline: json['headline'],
      host: json['host'],
      location: json['location'],
      street: json['street'],
      url: json['URL'],
    );
  }
}

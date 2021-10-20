import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class NewEventWidget extends StatelessWidget {
  final String headline;
  final String host;
  final String description;
  final String location;
  final String street;
  final Timestamp start;
  final Timestamp end;
  final String url;
  final String category;

  const NewEventWidget({
    Key key,
    this.headline,
    this.host,
    this.description,
    this.location,
    this.street,
    this.start,
    this.end,
    this.url,
    this.category,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          Text('$headline'),
          Text('$host'),
          Text('$category'),
          Text('$description'),
          Text('$location'),
          Text('$street'),
          Text('$start'),
          Text('$end'),
          Text('$url')
        ],
      ),
    );
  }
}

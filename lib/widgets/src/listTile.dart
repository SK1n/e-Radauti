import 'package:flutter/material.dart';
import 'package:flutterapperadauti/transport/timeline.dart';

RaisedButton listTileDesign(
    BuildContext context, String slug, IconData leadingIcon, String title,
    [String subTitle]) {
  return RaisedButton.icon(
    onPressed: () {
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => TimelineRoute(slug: slug)));
    },
    icon: Container(
      padding: EdgeInsets.only(right: 12.0),
      decoration: new BoxDecoration(
          border: new Border(
              right: new BorderSide(width: 1.0, color: Colors.white24))),
      child: Icon(leadingIcon, color: Colors.white),
    ),
    label: Text(
      "$title",
      style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
    ),
  );
}

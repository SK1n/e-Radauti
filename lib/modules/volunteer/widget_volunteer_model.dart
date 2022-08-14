import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher_string.dart';

class WidgetVolunteerModel{
  Widget textCard(child, childSize, childFontWeight, childColor, childDecoration){
    return Text(
      child,
      style: new TextStyle(
        fontSize: childSize,
        fontWeight: childFontWeight,
        color: childColor,
        decoration: childDecoration,
      ),
    );
  }
  Widget cardRow(children, childPaddingSize, childSize, childFontWeight, childColor, childTextDecoration){
    return Container(
      padding: new EdgeInsets.only(top: childPaddingSize),
      child: new Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          for(final childText in children)
            textCard(childText, childSize, childFontWeight, childColor, childTextDecoration),
        ],
      ),
    );
  }
  Widget cardVolunteer(childRow1, childrenRow2, childrenRow3, childrenRow4, childrenRow5, childrenRow6_1, childRow6_2){
    return Card(
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(3),
        child: new Column(
          children: <Widget>[
            new Image.asset(
              childRow1,
              width: 80.0,
              height: 80.0,
            ),
            cardRow(childrenRow2, 3.0, 16.0, FontWeight.bold, Colors.black, TextDecoration.none),
            cardRow(childrenRow3, 0.0, 14.0, FontWeight.normal, Colors.grey[800], TextDecoration.none),
            cardRow(childrenRow4, 0.0, 14.0, FontWeight.normal, Colors.grey[800], TextDecoration.none),
            cardRow(childrenRow5, 0.0, 14.0, FontWeight.normal, Colors.grey[800], TextDecoration.none),
            new InkWell(
              child:
              cardRow(childrenRow6_1, 0.0, 15.0, FontWeight.normal, Color(0xFF38A49C), TextDecoration.underline),
              onTap: () => launchUrlString(childRow6_2),
            ),
          ],
        ),
      ),
    );
  }
}
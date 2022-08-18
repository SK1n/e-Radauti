import 'package:flutter/material.dart';
import 'package:fluttericon/entypo_icons.dart';
import 'package:url_launcher/url_launcher_string.dart';

class WidgetAboutModel {
  Widget itemText(
      child, childFontWeight, childSize, childColor, childDecoration) {
    return Text(
      child,
      style: TextStyle(
        fontWeight: childFontWeight,
        fontSize: childSize,
        color: childColor,
        decoration: childDecoration,
      ),
    );
  }

  Widget widgetFloatingActionButton(childContext) {
    return FloatingActionButton(
      child: Icon(
        Entypo.mail,
        color: Colors.white,
        size: 35,
      ),
      onPressed: () {
        Navigator.pushNamed(childContext, '/contact');
      },
    );
  }

  Widget widgetCover(child, childContext) {
    return Container(
      padding: EdgeInsets.only(
        bottom: 10,
      ),
      width: MediaQuery.of(childContext).size.width - 30,
      child: Image.asset(
        child,
        fit: BoxFit.cover,
      ),
    );
  }

  Widget widgetTitle(child, childContext) {
    return Container(
      padding: EdgeInsets.only(
        bottom: 10,
      ),
      width: MediaQuery.of(childContext).size.width - 30,
      child: itemText(
          child, FontWeight.bold, 16.0, Colors.black, TextDecoration.none),
    );
  }

  Widget widgetParagraph(child, childContext) {
    return Container(
      padding: EdgeInsets.only(
        bottom: 10,
      ),
      width: MediaQuery.of(childContext).size.width - 30,
      child: itemText(
          child, FontWeight.normal, 15.0, Colors.black, TextDecoration.none),
    );
  }

  Widget widgetParagraphLink(child, childLink, childContext) {
    return Container(
      padding: EdgeInsets.only(
        bottom: 20,
      ),
      width: MediaQuery.of(childContext).size.width - 30,
      child: Center(
        child: new InkWell(
          child: itemText(child, FontWeight.normal, 15.0, Color(0xFF38A49C),
              TextDecoration.underline),
          onTap: () => launchUrlString(childLink),
        ),
      ),
    );
  }
}

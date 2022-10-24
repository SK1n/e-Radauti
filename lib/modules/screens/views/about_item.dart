import 'package:flutter/material.dart';

import 'package:flutterapperadauti/utils/helpers/launch_url_helper.dart';

class AboutModel extends UrlLauncher {
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

  Widget widgetCover(child, childContext) {
    return Container(
      padding: const EdgeInsets.only(
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
      padding: const EdgeInsets.only(
        bottom: 10,
      ),
      width: MediaQuery.of(childContext).size.width - 30,
      child: itemText(
          child, FontWeight.bold, 16.0, Colors.black, TextDecoration.none),
    );
  }

  Widget widgetParagraph(child, childContext) {
    return Container(
      padding: const EdgeInsets.only(
        bottom: 10,
      ),
      width: MediaQuery.of(childContext).size.width - 30,
      child: itemText(
          child, FontWeight.normal, 15.0, Colors.black, TextDecoration.none),
    );
  }

  Widget widgetParagraphLink(child, childLink, childContext) {
    return Container(
      padding: const EdgeInsets.only(
        bottom: 20,
      ),
      width: MediaQuery.of(childContext).size.width - 30,
      child: Center(
        child: InkWell(
          child: itemText(child, FontWeight.normal, 15.0,
              const Color(0xFF38A49C), TextDecoration.underline),
          onTap: () => launchUrl(childLink),
        ),
      ),
    );
  }
}

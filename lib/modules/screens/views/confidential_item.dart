import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:flutterapperadauti/utils/helpers/launch_url_helper.dart';

class ConfidentialItem extends UrlLauncher {
  Widget widgetTitleParagraph(child) {
    return Container(
      padding: const EdgeInsets.only(
        top: 5,
        bottom: 5,
      ),
      child: Text(
        child,
        style: const TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 16,
        ),
      ),
    );
  }

  Widget widgetSubtitleParagraph(child, childContext) {
    return SizedBox(
      width: MediaQuery.of(childContext).size.width - 30,
      child: Text(
        child,
        style: const TextStyle(
          fontSize: 15,
          fontStyle: FontStyle.italic,
        ),
      ),
    );
  }

  Widget widgetParagraph(child, childContext) {
    return Container(
      padding: const EdgeInsets.only(
        bottom: 5,
      ),
      width: MediaQuery.of(childContext).size.width - 30,
      child: Text(
        child,
        style: const TextStyle(
          fontSize: 15,
        ),
      ),
    );
  }

  TextSpan widgetTextSpanLink(child, link) {
    return TextSpan(
      text: child,
      style: const TextStyle(
        decoration: TextDecoration.underline,
        color: Color(0xFF38A49C),
        fontSize: 15,
      ),
      recognizer: TapGestureRecognizer()
        ..onTap = () async => await launchUrlS(link),
    );
  }

  Widget widgetRichText(child, children, childContext) {
    return Container(
      padding: const EdgeInsets.only(
        bottom: 5,
      ),
      width: MediaQuery.of(childContext).size.width - 30,
      child: RichText(
        text: TextSpan(
          text: child,
          style: const TextStyle(
            color: Colors.black,
            fontSize: 15,
          ),
          children: <TextSpan>[
            for (final item in children) item,
          ],
        ),
      ),
    );
  }
}

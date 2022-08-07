import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart' as UrlLauncher;
import 'package:flutter/gestures.dart';

class WidgetConfidentialModel{
  Widget widgetTitleParagraph(child){
    return Container(
      padding: EdgeInsets.only(top: 5, bottom: 5,),
      child: Text(
        child,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 16,
        ),
      ),
    );
  }
  Widget widgetSubtitleParagraph(child, childContext){
    return Container(
      width: MediaQuery.of(childContext).size.width - 30,
      child: Text(
        child,
        style: TextStyle(
          fontSize: 15,
          fontStyle: FontStyle.italic,
        ),
      ),
    );
  }
  Widget widgetParagraph(child, childContext){
    return Container(
      padding: EdgeInsets.only(bottom: 5,),
      width: MediaQuery.of(childContext).size.width - 30,
      child: Text(
        child,
        style: TextStyle(
          fontSize: 15,
        ),
      ),
    );
  }
  TextSpan widgetTextSpanLink(child, link){
    return TextSpan(
      text: child,
      style: TextStyle(decoration: TextDecoration.underline, color: Color(0xFF38A49C), fontSize: 15,),
      recognizer: new TapGestureRecognizer()..onTap = () => UrlLauncher.launch(link),
    );
  }
  Widget widgetRichText(child, children, childContext){
    return Container(
      padding: EdgeInsets.only(bottom: 5,),
      width: MediaQuery.of(childContext).size.width - 30,
      child: RichText(
        text: TextSpan(
          text: child,
          style: TextStyle(color: Colors.black, fontSize: 15,),
          children: <TextSpan>[
            for(final item in children) item,
          ],
        ),
      ),
    );
  }
}
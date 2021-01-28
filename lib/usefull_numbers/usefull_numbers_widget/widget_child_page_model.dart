import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:url_launcher/url_launcher.dart' as UrlLauncher;

class WidgetChildPageModel{
  Widget itemText(child, childFontWeight, childTextDecoration, childSize, childColor){
    return Text(
      child,
      style: TextStyle(
        fontWeight: childFontWeight,
        decoration: childTextDecoration,
        fontSize: childSize,
        color: childColor,
      ),
    );
  }
  Widget widgetItem(childImage, childContext, childText1, childrenText3, childUrl1, ){
    return Column(
      children: <Widget>[
        Container(
          padding: EdgeInsets.only(left: 25, right: 25, bottom: 10, top: 15,),
          child: Column(
            children: <Widget>[
              //1,2
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(height: 30, width: 30, child: SvgPicture.asset(childImage),),
                  Container(
                    padding: EdgeInsets.only(left: 10,),
                    child: Column(
                      children: <Widget>[
                        Container(
                          padding: EdgeInsets.only(bottom: 10, top: 5,),
                          width: MediaQuery.of(childContext).size.width - 90,
                          child: itemText(childText1, FontWeight.bold, TextDecoration.none, 16.0, Color(0xFF32325D)),
                        ),
                        Container(
                          width: MediaQuery.of(childContext).size.width - 90,
                          child: itemText('Contact', FontWeight.bold, TextDecoration.underline, 15.0, Colors.black),
                        ),
                        for(final childText3 in childrenText3)
                          Container(
                            width: MediaQuery.of(childContext).size.width - 90,
                            child: itemText(childText3, FontWeight.normal, TextDecoration.none, 15.0, Colors.black),
                          ),
                      ],
                    ),
                  ),
                ],
              ),
              //3
              Container(
                padding: EdgeInsets.only(top: 10,),
                width: MediaQuery.of(childContext).size.width - 35,
                child: FlatButton(
                  color: Color(0xFF38A49C),
                  textColor: Colors.white,
                  disabledColor: Colors.grey,
                  disabledTextColor: Colors.black,
                  splashColor: Color(0x8838A49C),
                  child: itemText('Sună acum', FontWeight.bold, TextDecoration.none, 15.0, Colors.white),
                  onPressed: () { UrlLauncher.launch(childUrl1);},
                ),
              ),
              //4
              Container(
                padding: EdgeInsets.only(top: 10),
                child: new InkWell(
                  child: itemText('Trimite unui prieten', FontWeight.normal, TextDecoration.none, 15.0, Color(0xFF38A49C)),
                  onTap: () => UrlLauncher.launch("mailto:"),
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.0),
          child: Container(height: 1.0, color: Color.fromRGBO(0, 0, 0, 0.1),),
        ),
      ],
    );
  }
}
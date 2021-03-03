import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:url_launcher/url_launcher.dart' as UrlLauncher;

class WidgetLeadersModel{
  _launchURL(url) async {
    if (await UrlLauncher.canLaunch(url)) {
      await UrlLauncher.launch(url);
    } else {
      throw 'Nu se poate încărca $url';
    }
  }
  Widget textItem(child, childColor, childFontWeight, childSize, childTextDecoration){
    return Text(
      child,
      overflow: TextOverflow.ellipsis,
      maxLines: 5,
      style: TextStyle(
        color: childColor,
        fontWeight: childFontWeight,
        fontSize: childSize,
        decoration: childTextDecoration,
      ),
    );
  }
  Function functionOnPressed1(child){
    return () {
      _launchURL(child);
    };
  }
  Function functionOnPressed2(child){
    return () {
      UrlLauncher.launch(child);
    };
  }
  Function functionOnTap(child){
    return () => UrlLauncher.launch(child);
  }
  Widget widgetItem(childImage, childContext, childText1, childText2, childFunctionUrl1, childFunctionUrl2, childFunctionUrl3, childFunctionUrl4,){
    return Column(
      children: <Widget>[
        Container(
          padding: EdgeInsets.only(left: 17, right: 17, top: 20, bottom: 20),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                height: 91,
                width: 91,
                child: CircleAvatar( radius: 50, backgroundImage: AssetImage(childImage),),
              ),
              Container(
                padding: EdgeInsets.only(left: 10),
                child: Column(
                  children: <Widget>[
                    Container(
                      width: MediaQuery.of(childContext).size.width - 136,
                      child: textItem(childText1, Color(0xFF38A49C), FontWeight.bold, 21.0, TextDecoration.none),
                    ),
                    Container(
                      padding: EdgeInsets.only(bottom: 10),
                      width: MediaQuery.of(childContext).size.width - 136,
                      child: textItem(childText2, Colors.black, FontWeight.bold, 15.0, TextDecoration.none),
                    ),
                    Row(
                      children: <Widget>[
                        FlatButton(
                          child: Icon(Ionicons.logo_facebook, color: Colors.indigo, size: 40,),
                          onPressed: childFunctionUrl1,
                        ),
                        FlatButton(
                          child: Icon(Ionicons.ios_mail, color: Colors.orangeAccent, size: 40,),
                          onPressed: childFunctionUrl2,
                        ),
                      ],
                    ),
                    Container(
                      padding: EdgeInsets.only(top: 10),
                      width: MediaQuery.of(childContext).size.width - 136,
                      child: textItem("Informații adiționale", Colors.black, FontWeight.bold, 15.0, TextDecoration.underline),
                    ),
                    Container(
                      width: MediaQuery.of(childContext).size.width - 136,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          new InkWell(
                            child: textItem('Declarație de avere', Color(0xFF38A49C), FontWeight.normal, 15.0, TextDecoration.underline),
                            onTap: childFunctionUrl3,
                          ),
                          new InkWell(
                            child: textItem('Declarație de interese', Color(0xFF38A49C), FontWeight.normal, 15.0, TextDecoration.underline),
                            onTap: childFunctionUrl4,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              )
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
  Widget widgetItem1(childContext){
    return Column(
      children: <Widget>[
        Container(
          padding: EdgeInsets.only(left: 25, right: 25, bottom: 10, top: 15),
          child: Column(
            children: <Widget>[
              Row(
                children: <Widget>[
                  Container(height: 30, width: 30, child: SvgPicture.asset("assets/images/circle_69E781.svg"),),
                  Container(
                    width: MediaQuery.of(childContext).size.width - 90,
                    padding: EdgeInsets.only(left: 10,),
                    child: textItem("Conducere", Colors.black, FontWeight.bold, 16.0, TextDecoration.none),
                  ),
                ],
              ),
              Container(
                padding: EdgeInsets.only(top: 10),
                width: MediaQuery.of(childContext).size.width - 50,
                child: textItem("Informații despre primar, viceprimar și atribuțiile fiecăruia.", Color(0xFF38A49C), FontWeight.normal, 15.0, TextDecoration.none),
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
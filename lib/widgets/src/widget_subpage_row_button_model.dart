import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class WidgetSubpageRowButtonModel{
  Widget textItem(child, childContext, childTopPadding, childLeftPadding, childWidthNr, childColor, childFontSize, childFontWeight){
    return Container(
      padding: EdgeInsets.only(top: childTopPadding, left: childLeftPadding,),
      width: MediaQuery.of(childContext).size.width - childWidthNr,
      child: Text(
        child,
        overflow: TextOverflow.ellipsis,
        maxLines: 5,
        style: TextStyle(
          color: childColor,
          fontSize: childFontSize,
          fontWeight: childFontWeight,
        ),
      ),
    );
  }
  Function functionOnTap(childContext, childOnTapPath){
    return () {
      Navigator.pushNamed(childContext, childOnTapPath);
    };
  }
  Widget widgetItem(childImagePath, childContext, childText1, childText2, childColor1, childColor2, childOnTapFunction){
    return Column(
      children: <Widget>[
        Container(
          padding: EdgeInsets.only(left: 25, right: 25, bottom: 10, top: 15,),
          child: GestureDetector(
            child: Row(
              children: <Widget>[
                Column(
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Container(height: 30, width: 30, child: SvgPicture.asset(childImagePath),),
                        textItem(childText1, childContext, 0.0, 10.0, 120, childColor1, 16.0, FontWeight.bold),
                      ],
                    ),
                    textItem(childText2, childContext, 10.0, 0.0, 80, childColor2, 15.0, FontWeight.normal),
                  ],
                ),
                Container(
                  child: Icon(Icons.keyboard_arrow_right, color: Color(0xFF979797),),
                ),
              ],
            ),
            onTap: childOnTapFunction,
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.0),
          child: Container(height: 1.0, color: Color.fromRGBO(0, 0, 0, 0.1),
          ),
        ),
      ],
    );
  }
}
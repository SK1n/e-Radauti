import 'package:flutter/material.dart';

class WidgetPartnerModel{
  Widget widgetItem(childImage, childText, childContext){
    return Column(
      children: <Widget>[
        Container(
          padding: EdgeInsets.only(bottom: 10,),
          child: Center(
            child: Image.asset(childImage, height: 100, width: MediaQuery.of(childContext).size.width - 50,),
          ),
        ),
        Container(
          padding: EdgeInsets.only(bottom: 20,),
          child: Text(
            childText,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: Colors.grey,),
          ),
        ),
      ],
    );
  }
}
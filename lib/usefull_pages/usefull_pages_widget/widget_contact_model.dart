import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class WidgetContactModel{
  Widget widgetTextFieldIcon(child, childIcon, childLabel, childError, childMessage){
    return Container(
      margin: EdgeInsets.only(top: 20, left: 20, right: 20),
      child: TextField(
        textCapitalization: TextCapitalization.sentences,
        controller: child,
        enabled: true,
        decoration: new InputDecoration(
          border: new OutlineInputBorder(borderSide: new BorderSide(color: Color(0xFF38A49C)),),
          prefixIcon: childIcon,
          labelText: childLabel,
          prefixText: '',
          errorText: childError ? childMessage : null,
          enabledBorder: OutlineInputBorder(borderSide: BorderSide(width: 1, color: Color(0xFF38A49C)),),
          focusedBorder: OutlineInputBorder(borderSide: BorderSide(width: 1, color: Color(0xFF38A49C)),),
          labelStyle: TextStyle(color: Colors.grey,),
        ),
      ),
    );
  }
  Widget widgetTextField(child, childLabel, childError, childMessage){
    return Container(
      margin: EdgeInsets.only(top: 20, left: 20, right: 20, bottom: 0,),
      child: TextField(
        textCapitalization: TextCapitalization.sentences,
        controller: child,
        keyboardType: TextInputType.multiline,
        maxLines: null,
        enabled: true,
        decoration: new InputDecoration(
          border: new OutlineInputBorder(borderSide: new BorderSide(color: Color.fromRGBO(56, 164, 156, 10)),),
          labelText: childLabel,
          labelStyle: TextStyle(color: Colors.grey,),
          prefixText: '',
          errorText: childError ? childMessage : null,
          enabledBorder: OutlineInputBorder(borderSide: BorderSide(width: 1, color: Color.fromRGBO(56, 164, 156, 10)),),
          focusedBorder: OutlineInputBorder(borderSide: BorderSide(width: 1, color: Color.fromRGBO(56, 164, 156, 10)),),
        ),
      ),
    );
  }
  Widget widgetButton(childFunction, childContext){
    return Container(
      margin: EdgeInsets.only(top: 20, left: 20, right: 20),
      width: MediaQuery.of(childContext).size.width,
      child: FlatButton(
        color: Color.fromRGBO(56, 164, 156, 10),
        textColor: Colors.white,
        onPressed: () {childFunction;},
        child: Text("Trimite"),
      ),
    );
  }
}
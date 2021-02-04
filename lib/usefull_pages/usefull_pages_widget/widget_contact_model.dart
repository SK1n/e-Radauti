import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class WidgetContactModel{
  Widget widgetTextFieldIcon(_controller,_validate,_icon,_label,_string){
    return Container(
      margin: EdgeInsets.only(top: 20, left: 20, right: 20),
      child: TextField(
        textCapitalization: TextCapitalization.sentences,
        controller: _controller,
        enabled: true,
        decoration: new InputDecoration(
          border: new OutlineInputBorder(borderSide: new BorderSide(color: Color(0xFF38A49C)),),
          prefixIcon: _icon,
          labelText: _label,
          prefixText: '',
          errorText: _validate ? _string : null,
          enabledBorder: OutlineInputBorder(borderSide: BorderSide(width: 1, color: Color(0xFF38A49C)),),
          focusedBorder: OutlineInputBorder(borderSide: BorderSide(width: 1, color: Color(0xFF38A49C)),),
          labelStyle: TextStyle(color: Colors.grey,),
        ),
      ),
    );
  }
  Widget widgetTextField(_controller,_validate){
    return Container(
      margin: EdgeInsets.only(top: 20, left: 20, right: 20, bottom: 0,),
      child: TextField(
        textCapitalization: TextCapitalization.sentences,
        controller: _controller,
        keyboardType: TextInputType.multiline,
        maxLines: null,
        enabled: true,
        decoration: new InputDecoration(
          border: new OutlineInputBorder(borderSide: new BorderSide(color: Color.fromRGBO(56, 164, 156, 10)),),
          labelText: 'Mesaj:',
          labelStyle: TextStyle(color: Colors.grey,),
          prefixText: '',
          errorText: _validate ? 'Nu ați introdus un mesaj!' : null,
          enabledBorder: OutlineInputBorder(borderSide: BorderSide(width: 1, color: Color.fromRGBO(56, 164, 156, 10)),),
          focusedBorder: OutlineInputBorder(borderSide: BorderSide(width: 1, color: Color.fromRGBO(56, 164, 156, 10)),),
        ),
      ),
    );
  }
}
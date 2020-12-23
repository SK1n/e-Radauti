import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';

var appBarModel = AppBarModel();

class AppBarModel {
  AppBar loadAppBar(context, title, icon, scaffoldKey) {
    return AppBar(
      backgroundColor: Color.fromARGB(255, 255, 255, 255),
      title: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
        Icon(
          icon,
          color: Color(0x55FB6340),
          size: 30,
        ),
        Padding(
          padding: EdgeInsets.only(left: 10),
        ),
        Text(title),
      ]),
      leading: Container(
        child: FlatButton(
          child: Icon(Ionicons.ios_arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      actions: <Widget>[
        Container(
          alignment: Alignment.topRight,
          margin: EdgeInsets.only(top: 0.0, right: 0.0),
          child: IconButton(
            icon: Icon(
              Icons.menu,
              size: 24,
              color: Colors.black,
            ),
            onPressed: () => scaffoldKey.currentState.openDrawer(),
          ),
        ),
      ],
    );
  }
}

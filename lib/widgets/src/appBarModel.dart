import 'package:flutter/material.dart';

//var appBarModel = AppBarModel();

@deprecated
class AppBarModel {
  AppBar loadAppBar(context, title, icon, scaffoldKey, {TabBar? tabBar}) {
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
        Expanded(
          child: Text(
            title,
            maxLines: 2,
          ),
        ),
      ]),
      leading: Container(
        child: FlatButton(
          child: Icon(Icons.arrow_back),
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
      bottom: tabBar != null ? tabBar : null,
    );
  }
}

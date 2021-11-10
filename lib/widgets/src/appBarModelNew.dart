import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';

class AppBarUiSliver extends StatelessWidget {
  final GlobalKey<ScaffoldState> scaffoldKey;
  final IconData leading;
  final String content;
  final bool pinned;
  const AppBarUiSliver({
    Key key,
    this.scaffoldKey,
    this.leading,
    this.pinned = false,
    @required this.content,
  }) : super(
          key: key,
        );

  Widget build(BuildContext context) {
    return SliverAppBar(
        pinned: true,
        floating: true,
        backgroundColor: Colors.white,
        elevation: 10,
        forceElevated: true,
        shadowColor: Colors.black,
        leading: SafeArea(
          child: FlatButton(
            child: Icon(Ionicons.ios_arrow_back),
            onPressed: () => Navigator.pop(context),
          ),
        ),
        actions: [
          scaffoldKey != null
              ? SafeArea(
                  child: IconButton(
                    icon: Icon(
                      Icons.menu,
                      color: Colors.black,
                    ),
                    onPressed: () => scaffoldKey.currentState.openDrawer(),
                  ),
                )
              : null,
        ],
        title: SafeArea(
          top: false,
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 10),
                child: leading != null
                    ? Icon(
                        leading,
                        color: Color(0x55FB6340),
                      )
                    : null,
              ),
              Expanded(
                child: Text(
                  '$content',
                  maxLines: 2,
                  style: TextStyle(color: Colors.black),
                ),
              )
            ],
          ),
        ));
  }
}

class AppBarUi extends StatelessWidget {
  final GlobalKey<ScaffoldState> scaffoldKey;
  final IconData leading;
  final String content;
  final bool pinned;
  final TabBar bottom;
  const AppBarUi({
    Key key,
    this.scaffoldKey,
    this.leading,
    this.pinned = false,
    @required this.content,
    this.bottom,
  }) : super(
          key: key,
        );

  Widget build(BuildContext context) {
    return AppBar(
        elevation: 10,
        backgroundColor: Colors.white,
        // bottom: bottom != null
        //     ? bottom
        //     : PreferredSize(child: Container(), preferredSize: Size(0, 0)),
        shadowColor: Colors.black,
        bottom: bottom != null ? bottom : null,
        leading: SafeArea(
          child: FlatButton(
            child: Icon(Ionicons.ios_arrow_back),
            onPressed: () => Navigator.pop(context),
          ),
        ),
        actions: [
          scaffoldKey != null
              ? SafeArea(
                  child: IconButton(
                    icon: Icon(
                      Icons.menu,
                      color: Colors.black,
                    ),
                    onPressed: () => scaffoldKey.currentState.openDrawer(),
                  ),
                )
              : null,
        ],
        title: SafeArea(
          top: false,
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 10),
                child: leading != null
                    ? Icon(
                        leading,
                        color: Color(0x55FB6340),
                      )
                    : null,
              ),
              Expanded(
                child: Text(
                  '$content',
                  maxLines: 2,
                  style: TextStyle(color: Colors.black),
                ),
              )
            ],
          ),
        ));
  }
}

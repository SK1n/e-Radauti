import 'package:flutter/material.dart';

class AppBarUiSliver extends StatelessWidget {
  final GlobalKey<ScaffoldState> scaffoldKey;
  final IconData? leading;
  final String content;
  final bool pinned;
  const AppBarUiSliver({
    Key? key,
    required this.scaffoldKey,
    this.leading,
    this.pinned = false,
    required this.content,
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
          // ignore: deprecated_member_use
          child: FlatButton(
            child: Icon(Icons.arrow_back),
            onPressed: () => Navigator.pop(context),
          ),
        ),
        actions: [
          TextButton.icon(
            label: Text(''),
            icon: Icon(
              Icons.menu,
              color: Colors.black,
            ),
            onPressed: () => scaffoldKey.currentState!.openDrawer(),
          )
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
  final IconData? leading;
  final String content;
  final bool pinned;
  final TabBar? bottom;
  const AppBarUi({
    Key? key,
    required this.scaffoldKey,
    this.leading,
    this.pinned = false,
    required this.content,
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
          // ignore: deprecated_member_use
          child: FlatButton(
            child: Icon(Icons.arrow_back),
            onPressed: () => Navigator.pop(context),
          ),
        ),
        actions: [
          SafeArea(
            child: TextButton.icon(
              label: Text(''),
              icon: Icon(
                Icons.menu,
                color: Colors.black,
              ),
              onPressed: () => scaffoldKey.currentState!.openDrawer(),
            ),
          )
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

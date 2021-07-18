import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';

class AppBarUi extends StatelessWidget {
  final GlobalKey<ScaffoldState> scaffoldKey;
  final IconData leading;
  final String content;
  final bool pinned;
  const AppBarUi({
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
        pinned: pinned,
        floating: true,
        elevation: 10,
        forceElevated: true,
        shadowColor: Colors.black,
        leading: FlatButton(
          child: Icon(Ionicons.ios_arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
        actions: [
          scaffoldKey != null
              ? IconButton(
                  icon: Icon(Icons.menu),
                  onPressed: () => scaffoldKey.currentState.openDrawer(),
                )
              : null,
        ],
        title: Row(
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
              ),
            )
          ],
        ));
  }
}

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';

class CustomListTile extends ListTile {
  final IconData leadingIcon;
  final double leadingSize;
  final String content;
  final String subTitle;
  final Color leadingColor;
  final String route;
  const CustomListTile({
    Key key,
    this.content,
    this.subTitle,
    this.leadingIcon,
    this.leadingSize = 35,
    this.leadingColor,
    this.route,
    bool isThreeLine = false,
    Function onTap,
  }) : super(
          key: key,
          isThreeLine: isThreeLine,
          onTap: onTap,
        );

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 1,
      child: ListTile(
        trailing: Platform.isAndroid
            ? Icon(Ionicons.md_arrow_forward)
            : Icon(Ionicons.ios_arrow_forward),
        leading: Icon(
          leadingIcon,
          size: leadingSize,
          color: leadingColor != null ? leadingColor : null,
        ),
        //isThreeLine: isThreeLine,
        subtitle: Text('$subTitle'),
        onTap: () => Navigator.pushNamed(context, route != null ? route : null),
        title: Text(
          '$content',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
      ),
    );
  }
}

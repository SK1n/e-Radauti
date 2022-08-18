import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AnnouncementsListTile extends ListTile {
  final IconData leadingIcon;
  final double leadingSize;
  final String content;
  final String subTitle;
  final Color? leadingColor;
  final String route;
  const AnnouncementsListTile({
    Key? key,
    required this.content,
    required this.subTitle,
    required this.leadingIcon,
    this.leadingSize = 35,
    required this.leadingColor,
    required this.route,
    bool isThreeLine = false,
    Function()? onTap,
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
            ? Icon(Icons.arrow_forward)
            : Icon(Icons.arrow_forward_ios),
        leading: Icon(
          leadingIcon,
          size: leadingSize,
          color: leadingColor != null ? leadingColor : null,
        ),
        subtitle: Text('$subTitle'),
        onTap: () {
          Get.toNamed(route);
        },
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

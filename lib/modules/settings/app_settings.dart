import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutterapperadauti/routes/app_pages.dart';
import 'package:flutterapperadauti/utils/not_switch.dart';
import 'package:flutterapperadauti/widgets/src/appBarModelNew.dart';
import 'package:flutterapperadauti/widgets/src/nav_drawer.dart';
import 'package:get/get.dart';

class AppSettings extends StatefulWidget {
  const AppSettings({Key? key}) : super(key: key);

  @override
  State<AppSettings> createState() => _AppSettingsState();
}

class _AppSettingsState extends State<AppSettings> {
  TextEditingController debugTextEditingController =
      new TextEditingController();
  bool debugPasswordHasError = false;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        child: AppBarUi(
          leading: Icons.settings,
          content: 'Setari',
        ),
        preferredSize: Size(MediaQuery.of(context).size.width, 50),
      ),
      drawer: NavDrawer(),
      body: Column(
        children: [
          kDebugMode
              ? ListTileSettings(
                  routeName: 'debug',
                  title: 'Debug',
                  leadingIcon: Icons.bug_report_outlined,
                  onTap: () {
                    Get.toNamed(Routes.DEBUG);
                  })
              : Container(),
          NotSwitch(),
        ],
      ),
    );
  }
}

class ListTileSettings extends StatelessWidget {
  final String title;
  final String routeName;
  final IconData? leadingIcon;
  final Function() onTap;
  const ListTileSettings({
    Key? key,
    required this.title,
    this.leadingIcon,
    required this.routeName,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      leading: leadingIcon != null ? Icon(leadingIcon) : Icon(Icons.error),
      title: Text(title),
      trailing: Icon(
        Platform.isAndroid ? Icons.arrow_forward : Icons.arrow_forward_ios,
      ),
    );
  }
}

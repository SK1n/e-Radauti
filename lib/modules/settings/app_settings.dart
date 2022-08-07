import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutterapperadauti/routes/app_pages.dart';
import 'package:flutterapperadauti/geolocator.dart';
import 'package:flutterapperadauti/widgets/src/appBarModelNew.dart';
import 'package:flutterapperadauti/widgets/src/nav_drawer.dart';
import 'package:get/get.dart';
import 'package:list_tile_switch/list_tile_switch.dart';

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
    // GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
    // GeolocatorState geolocatorState = Provider.of<GeolocatorState>(context);
    // NoticeFormState noticeFormState = Provider.of<NoticeFormState>(context);

    return Scaffold(
      //key: _scaffoldKey,
      appBar: PreferredSize(
        child: AppBarUi(
          //scaffoldKey: _scaffoldKey,
          leading: Icons.settings,
          content: 'Setari',
        ),
        preferredSize: Size(MediaQuery.of(context).size.width, 50),
      ),
      drawer: NavDrawer(),
      body: Column(
        children: [
          // notificationSection(),
          // geolocatorSection(
          //     geolocatorState: geolocatorState,
          //     noticeFormState: noticeFormState),
          kDebugMode
              ? ListTileSettings(
                  routeName: 'debug',
                  title: 'Debug',
                  leadingIcon: Icons.bug_report_outlined,
                  onTap: () {
                    Get.rootDelegate.toNamed(Routes.DEBUG);
                    // Navigator.pushNamed(context, '/settings/debug');
                  })
              : Container(),
        ],
      ),
    );
  }

  notificationSection() {
    return Card(
      child: ListTileSettings(
        routeName: 'notifications',
        title: 'Notificari',
        leadingIcon: Icons.topic,
        onTap: () {
          Navigator.pushNamed(context, '/settings/notifications');
        },
      ),
    );
  }

  // geolocatorSection(
  //     {required GeolocatorState geolocatorState,
  //     required NoticeFormState noticeFormState}) {
  //   return ListTileSwitch(
  //       value: geolocatorState.value,
  //       onChanged: (value) => geolocationOnChanged(
  //             context: context,
  //             geolocatorState: geolocatorState,
  //             value: value,
  //             noticeFormState: noticeFormState,
  //           ),
  //       title: Text('Locatie'));
  // }
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

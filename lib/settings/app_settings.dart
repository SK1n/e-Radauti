import 'dart:io';

import 'package:expandable/expandable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterapperadauti/widgets/src/appBarModelNew.dart';
import 'package:flutterapperadauti/widgets/src/nav_drawer.dart';
import 'package:geolocator/geolocator.dart';

class AppSettings extends StatefulWidget {
  const AppSettings({Key key}) : super(key: key);

  @override
  State<AppSettings> createState() => _AppSettingsState();
}

class _AppSettingsState extends State<AppSettings> {
  TextEditingController debugTextEditingController =
      new TextEditingController();
  bool debugPasswordHasError = false;
  LocationPermission locationPermission;
  bool locationStatus;
  @override
  void initState() {
    super.initState();
    getLocationStatus();
  }

  getLocationStatus() async {
    locationPermission = await Geolocator.checkPermission();
    locationStatus =
        locationPermission == LocationPermission.denied ? false : true;
  }

  @override
  Widget build(BuildContext context) {
    GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

    return Scaffold(
      key: _scaffoldKey,
      appBar: PreferredSize(
        child: AppBarUi(
          scaffoldKey: _scaffoldKey,
          leading: Icons.settings,
          content: 'Setari',
        ),
        preferredSize: Size(MediaQuery.of(context).size.width, 50),
      ),
      drawer: NavDrawer(),
      body: Column(
        children: [
          notificationSection(),
          geolocatorSection(),
          ListTileSettings(
              routeName: 'debug',
              title: 'Debug',
              leadingIcon: Icons.bug_report_outlined,
              onTap: () {
                debugDialog(context);
              }),
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

  //TODO: set up so that when user wants to use "notice a problem" he will be required to switch to true this (below) switch // the user will be redirected to /settings

  geolocatorSection() {
    return Card(
      child: Container(
        width: MediaQuery.of(context).size.width,
        child: TextButton(
          onPressed: () {
            showDialog(
                context: context,
                builder: (_) => Platform.isIOS
                    ? locationStatus
                        ? CupertinoAlertDialog(
                            title: Text(
                                'Permisiunile pentru locatie sunt acceptate'),
                            actions: [
                              TextButton(
                                onPressed: () => Navigator.pop(context),
                                child: Text('OK'),
                              )
                            ],
                          )
                        : CupertinoAlertDialog(
                            title: Text(
                                'Permisiunile pentru locatie nu sunt acceptate'),
                            actions: [
                              TextButton(
                                onPressed: () => Navigator.pop(context),
                                child: Text('Inchide'),
                              ),
                              TextButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                  Geolocator.openLocationSettings();
                                },
                                child: Text('Setari'),
                              ),
                            ],
                          )
                    : locationStatus
                        ? AlertDialog(
                            title: Text(
                                'Permisiunile pentru locatie sunt acceptate'),
                            actions: [
                              TextButton(
                                onPressed: () => Navigator.pop(context),
                                child: Text('OK'),
                              )
                            ],
                          )
                        : AlertDialog(
                            title: Text(
                                'Permisiunile pentru locatie nu sunt acceptate'),
                            actions: [
                              TextButton(
                                onPressed: () => Navigator.pop(context),
                                child: Text('Inchide'),
                              ),
                              locationPermission !=
                                      LocationPermission.deniedForever
                                  ? TextButton(
                                      onPressed: () =>
                                          Geolocator.requestPermission(),
                                      child: Text('Activeaza permisiunile'),
                                    )
                                  : Container(),
                              TextButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                  Geolocator.openLocationSettings();
                                },
                                child: Text('Setari'),
                              ),
                            ],
                          ));
          },
          child: Text('Verificati Permisiunea de locatie'),
        ),
      ),
    );
  }

  debugDialog(BuildContext context) {
    return showDialog(
        context: context,
        builder: (BuildContext context) => Platform.isIOS
            ? CupertinoAlertDialog(
                title: Text('Introduceti parola'),
                content: TextField(
                  controller: debugTextEditingController,
                ),
              )
            : AlertDialog(
                title: Text('Introduceti parola'),
                content: TextField(
                  controller: debugTextEditingController,
                  decoration: InputDecoration(
                      errorText: debugPasswordHasError
                          ? 'Parola nu este corecta!'
                          : null),
                ),
                actions: [
                  TextButton(
                    child: Text(
                      'Cancel',
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                  TextButton(
                    child: Text(
                      'Open',
                      textAlign: TextAlign.end,
                    ),
                    onPressed: () {
                      if (debugTextEditingController.text == 'e-radauti2021') {
                        debugPrint('corect');
                        Navigator.pop(context);
                        Navigator.pushNamed(context, '/settings/debug');
                      } else {
                        setState(() {
                          debugPasswordHasError = false;
                        });
                      }
                    },
                  ),
                ],
              ));
  }
}

class ListTileSettings extends StatelessWidget {
  final String title;
  final String routeName;
  final IconData leadingIcon;
  final Function onTap;
  const ListTileSettings({
    Key key,
    this.title,
    this.leadingIcon,
    this.routeName,
    this.onTap,
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

Future<bool> checkGeolocatorStatus() async {
  return await Geolocator.isLocationServiceEnabled();
}

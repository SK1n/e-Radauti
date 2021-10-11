import 'dart:io';

import 'package:expandable/expandable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterapperadauti/widgets/src/appBarModelNew.dart';
import 'package:flutterapperadauti/widgets/src/nav_drawer.dart';

class AppSettings extends StatefulWidget {
  const AppSettings({Key key}) : super(key: key);

  @override
  State<AppSettings> createState() => _AppSettingsState();
}

class _AppSettingsState extends State<AppSettings> {
  TextEditingController debugTextEditingController =
      new TextEditingController();
  bool debugPasswordHasError = false;

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

  ///Add collapsed to expanded child and add SwitchListTile for permissions notification

  notificationSection() {
    return ScrollOnExpand(
      child: Expandable(
        collapsed: ExpandableButton(
          child: Card(
            child: Text(
              'Permisiuni',
              style: TextStyle(fontSize: 30),
            ),
          ),
        ),
        expanded: ExpandableButton(
          child: Card(
            child: Column(
              children: [
                ListTileSettings(
                  routeName: 'notifications',
                  title: 'Notificari',
                  leadingIcon: Icons.notification_important,
                  onTap: () {
                    Navigator.pushNamed(context, '/settings/notifications');
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  geolocatorSection() {
    return ScrollOnExpand(
        child: Expandable(
      collapsed: ExpandableButton(
        child: ListTile(
          leading: Icon(Icons.location_on_outlined),
          title: Text('Permisiune de locatie'),
          trailing: Icon(Icons.arrow_drop_down_outlined),
        ),
      ),
      expanded: ExpandableButton(
          child: Column(
        children: [
          ListTile(
            leading: Icon(Icons.location_on_outlined),
            title: Text('Permisiune de locatie'),
            trailing: Icon(Icons.arrow_drop_up_outlined),
          ),
          SwitchListTile(
            value: false,
            onChanged: (value) {
              ///TODO: add notifier state for geolocation and update the widget with a title
            },
            title: Text('placeholder'),
          )
        ],
      )),
    ));
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
    return Card(
      child: ListTile(
        onTap: onTap,
        leading: leadingIcon != null ? Icon(leadingIcon) : Icon(Icons.error),
        title: Text(title),
        trailing: Icon(
          Platform.isAndroid ? Icons.arrow_forward : Icons.arrow_forward_ios,
        ),
      ),
    );
  }
}

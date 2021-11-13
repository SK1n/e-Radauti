import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterapperadauti/geolocator.dart';
import 'package:flutterapperadauti/state/geolocator_state.dart';
import 'package:flutterapperadauti/widgets/src/appBarModelNew.dart';
import 'package:flutterapperadauti/widgets/src/nav_drawer.dart';
import 'package:list_tile_switch/list_tile_switch.dart';
import 'package:provider/provider.dart';

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
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
    GeolocatorState geolocatorState = Provider.of<GeolocatorState>(context);

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
          geolocatorSection(geolocatorState: geolocatorState),
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

  geolocatorSection({@required GeolocatorState geolocatorState}) {
    return ListTileSwitch(
        value: geolocatorState.value,
        onChanged: (value) => geolocationOnChanged(
              context: context,
              geolocatorState: geolocatorState,
              value: value,
            ),
        title: Text('Locatie'));
  }

  debugDialog(BuildContext context) {
    return showDialog(
        context: context,
        builder: (BuildContext context) => Platform.isIOS
            ? CupertinoAlertDialog(
                title: Text('Introduceti parola'),
                content: Container(
                  child: CupertinoTextField(
                    controller: debugTextEditingController,
                  ),
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
                      if (debugTextEditingController.text == 'e-Radauti2021') {
                        //e-radauti2021
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
                      if (debugTextEditingController.text == 'e-Radauti2021') {
                        //e-radauti2021
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

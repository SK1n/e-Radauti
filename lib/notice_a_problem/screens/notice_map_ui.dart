import 'package:flutter/foundation.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:flutterapperadauti/notice_a_problem/models/get_markers.dart';
import 'package:flutterapperadauti/notice_a_problem/widgets/info_window.dart';
import 'package:flutter/material.dart';

import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_map_marker_popup/flutter_map_marker_popup.dart';
import 'package:flutterapperadauti/widgets/src/appBarModelNew.dart';
import 'package:flutterapperadauti/widgets/src/loading_screen_ui.dart';
import 'package:flutterapperadauti/widgets/src/nav_drawer.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:latlong2/latlong.dart' as latLng;
import 'package:provider/provider.dart';

class NoticeMapUi extends StatefulWidget {
  const NoticeMapUi({Key key}) : super(key: key);

  @override
  _NoticeMapUiState createState() => _NoticeMapUiState();
}

class _NoticeMapUiState extends State<NoticeMapUi>
    with TickerProviderStateMixin {
  final db = FirebaseDatabase.instance.reference().child('Notice_Problem_Map');
  List<Marker> _markers = [];
  double size = 300;
  var extend = true;
  final PopupController _popupLayerController = PopupController();

  @override
  void initState() {
    getData();
    super.initState();
  }

  getData() async {
    await db.once().then((snapshot) {
      Map<dynamic, dynamic> values = snapshot.value;
      values.forEach((key, value) {
        _markers.add(
          Marker(
            subject: value["subject"],
            category: value['category'],
            description: value['description'],
            iconIndex: value['index'],
            institution: value['institution'],
            status: value['status'],
            point: latLng.LatLng(value["lat"], value["long"]),
            width: 40.0,
            height: 40.0,
            builder: (_) => Container(
                width: 40,
                height: 40,
                child: CircleAvatar(
                  child: switchIcon(value['index']),
                )),
            anchorPos: AnchorPos.align(AnchorAlign.top),
          ),
        );
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
    FetchMarkers fetchMarkers = Provider.of<FetchMarkers>(context);
    return Scaffold(
      key: _scaffoldKey,
      drawer: NavDrawer(),
      floatingActionButton: SpeedDial(
        overlayOpacity: 0.3,
        icon: Icons.menu_book_outlined,
        onOpen: () => extend = !extend,
        onClose: () => extend = !extend,
        curve: Curves.elasticInOut,
        label: extend ? Text('Legenda') : null,
        useRotationAnimation: false,
        activeLabel: extend ? Text('Inchide') : null,
        //label: extend ? null : Text('Legenda'),
        labelTransitionBuilder: (widget, animation) =>
            ScaleTransition(scale: animation, child: widget),
        //label: Text('Legenda'),
        children: [
          speedDialChild(6, 'Calitatea aerului si poluare'),
          speedDialChild(3, 'Probleme la utilitati'),
          speedDialChild(4, 'Constructii ilegale'),
          speedDialChild(1, 'Gunoi neridicat'),
          speedDialChild(2, 'Infrastructură'),
          speedDialChild(5, 'Siguranta'),
          speedDialChild(0, 'Altele'),
        ],
      ),
      appBar: PreferredSize(
          child: AppBarUi(
            scaffoldKey: _scaffoldKey,
            leading: Icons.camera,
            content: 'Sesizează o problemă',
          ),
          preferredSize: Size(MediaQuery.of(context).size.width, 50)),
      body: FutureBuilder(
        future: fetchMarkers.getMarkersFromFirebase(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            return FlutterMap(
              options: MapOptions(
                interactiveFlags: InteractiveFlag.all & ~InteractiveFlag.rotate,
                zoom: 11.0,
                center: latLng.LatLng(47.843876, 25.916276),
                onTap: (_, __) => _popupLayerController.hideAllPopups(),
              ),
              layers: [
                TileLayerOptions(
                  urlTemplate:
                      'https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png',
                  subdomains: ['a', 'b', 'c'],
                ),
                PopupMarkerLayerOptions(
                  popupController: _popupLayerController,
                  markers: snapshot.data,
                  markerRotateAlignment:
                      PopupMarkerLayerOptions.rotationAlignmentFor(
                          AnchorAlign.top),
                  popupBuilder: (BuildContext context, Marker marker) => null,
                ),
              ],
            );
          } else {
            return LoadingScreen();
          }
        },
      ),
    );
  }

  SpeedDialChild speedDialChild(int iconID, String label) {
    return SpeedDialChild(
        child: iconID != null ? switchIcon(iconID) : null,
        backgroundColor: Colors.white,
        labelBackgroundColor: Colors.black,
        elevation: iconID != null ? 10 : 0,
        label: label,
        labelStyle: TextStyle(
          color: Colors.white,
        ));
  }

  Icon switchIcon(int icon) {
    switch (icon) {
      case 0:
        return Icon(
          MaterialCommunityIcons.dots_horizontal_circle_outline,
          color: Colors.black,
        );
        break;
      case 1:
        return Icon(
          MaterialCommunityIcons.trash_can_outline,
          color: Colors.black,
        );
        break;
      case 2:
        return Icon(
          MaterialCommunityIcons.road,
          color: Colors.black,
        );
        break;
      case 3:
        return Icon(
          MaterialCommunityIcons.electric_switch,
          color: Colors.black,
        );
        break;
      case 4:
        return Icon(
          MaterialCommunityIcons.home_alert,
          color: Colors.black,
        );
        break;
      case 5:
        return Icon(
          MaterialCommunityIcons.security,
          color: Colors.black,
        );
        break;
      case 6:
        return Icon(
          MaterialCommunityIcons.blur,
          color: Colors.black,
        );
        break;
      default:
        return Icon(
          MaterialCommunityIcons.dots_horizontal_circle_outline,
          color: Colors.black,
        );
    }
  }
}

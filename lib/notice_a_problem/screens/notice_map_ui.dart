import 'package:flutter/foundation.dart';
import 'package:flutterapperadauti/notice_a_problem/widgets/info_window.dart';
import 'package:flutter/material.dart';

import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_map_marker_popup/flutter_map_marker_popup.dart';
import 'package:flutterapperadauti/notice_a_problem/widgets/map_legend.dart';
import 'package:flutterapperadauti/widgets/src/appBarModelNew.dart';
import 'package:flutterapperadauti/widgets/src/nav_drawer.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:latlong/latlong.dart' as latLng;

class NoticeMapUi extends StatefulWidget {
  const NoticeMapUi({Key key}) : super(key: key);

  @override
  _NoticeMapUiState createState() => _NoticeMapUiState();
}

class _NoticeMapUiState extends State<NoticeMapUi> {
  final db = FirebaseDatabase.instance.reference().child('Notice_Problem_Map');
  List<Marker> _markers = [];
  double size = 300;
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
            category: value['categoria'],
            description: value['description'],
            iconIndex: value['iconIndex'],
            institution: value['institutia'],
            status: value['status'],
            point: latLng.LatLng(value["lat"], value["long"]),
            width: 40.0,
            height: 40.0,
            builder: (_) => Container(
                width: 40,
                height: 40,
                child: Image.asset(switchIcon(value['iconIndex']))),
            anchorPos: AnchorPos.align(AnchorAlign.top),
          ),
        );
      });
    });
    debugPrint('length: ${_markers.length}');
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
    return Scaffold(
      drawer: NavDrawer(),
      appBar: PreferredSize(
          child: AppBarUi(
            scaffoldKey: _scaffoldKey,
            leading: Icons.camera,
            content: 'Sesizează o problemă',
          ),
          preferredSize: Size(MediaQuery.of(context).size.width, 50)),
      body: Stack(children: [
        FlutterMap(
          options: MapOptions(
              zoom: 9.0,
              center: latLng.LatLng(47.4444, 25.897350),
              plugins: [PopupMarkerPlugin()],
              onTap: (latLong) => _popupLayerController.hidePopup()),
          layers: [
            TileLayerOptions(
              urlTemplate: 'https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png',
              subdomains: ['a', 'b', 'c'],
            ),
            PopupMarkerLayerOptions(
              markers: _markers,
              popupController: _popupLayerController,
              popupBuilder: (BuildContext _, Marker marker) =>
                  InfoWindow(marker: marker),
            ),
          ],
        ),
        Container(
          decoration: BoxDecoration(color: Colors.transparent),
          margin: EdgeInsets.only(top: size),
          child: MapLegend(),
        ),
      ]),
    );
  }

  String switchIcon(int icon) {
    switch (icon) {
      case 1:
        return 'assets/images/mapIcons/car_abandonned.png';
        break;
      case 2:
        return 'assets/images/mapIcons/bin.png';
        break;
      case 3:
        return 'assets/images/mapIcons/pitfall.png';
        break;
      case 4:
        return 'assets/images/mapIcons/iluminat_public.png';
        break;
      case 5:
        return 'assets/images/mapIcons/probleme_utilitati.png';
        break;
      case 6:
        return 'assets/images/mapIcons/illegal_constructions.png';
        break;
      case 7:
        return 'assets/images/mapIcons/deranj_ordinea_publica.png';
        break;
      case 8:
        return 'assets/images/mapIcons/sanatate.png';
        break;
      case 9:
        return 'assets/images/mapIcons/siguranta.png';
        break;
      case 10:
        return 'assets/images/mapIcons/lipsa_loc_handicap.png';
      case 11:
        return 'assets/images/mapIcons/poluare.png';
        break;
      case 12:
        return 'assets/images/mapIcons/lipsa_semn_circulatie.png';
        break;
      default:
        return 'assets/images/mapIcons/default_marker.png';
    }
  }
}

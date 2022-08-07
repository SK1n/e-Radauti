import 'package:flutter_loadingindicator/flutter_loadingindicator.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map_marker_cluster/flutter_map_marker_cluster.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutterapperadauti/controllers/get_data_from_firebase_controller.dart';
import 'package:flutterapperadauti/widgets/src/appBarModelNew.dart';
import 'package:flutterapperadauti/widgets/src/nav_drawer.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:fluttericon/entypo_icons.dart';
import 'package:fluttericon/font_awesome5_icons.dart';
import 'package:fluttericon/octicons_icons.dart';
import 'package:futuristic/futuristic.dart';
import 'package:get/get.dart';
import 'package:latlong2/latlong.dart' as latLng;

class NoticeMapUi extends StatefulWidget {
  const NoticeMapUi({Key? key}) : super(key: key);

  @override
  _NoticeMapUiState createState() => _NoticeMapUiState();
}

class _NoticeMapUiState extends State<NoticeMapUi>
    with TickerProviderStateMixin {
  final db = FirebaseDatabase.instance.ref().child('Notice_Problem_Map');
  double size = 300;
  var extend = true;
  final PopupController _popupLayerController = PopupController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
    final GetDataFromFirebaseController _getDataFromFirebaseController =
        Get.find<GetDataFromFirebaseController>();
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
        labelTransitionBuilder: (widget, animation) =>
            ScaleTransition(scale: animation, child: widget),
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
      body: Futuristic(
        futureBuilder:
            _getDataFromFirebaseController.getDataFromFirebase('Markers'),
        busyBuilder: (_) {
          if (!EasyLoading.isShow) {
            EasyLoading.show();
          }
          return Container();
        },
        errorBuilder: (_, error, retry) {
          EasyLoading.showError("Eroare");
          return TextButton(
              onPressed: () => retry, child: Text('Incearca din nou!'));
        },
        dataBuilder: (BuildContext context, AsyncSnapshot snapshot) {
          if (EasyLoading.isShow) {
            EasyLoading.dismiss();
          }
          return FlutterMap(
            options: MapOptions(
              interactiveFlags: InteractiveFlag.all & ~InteractiveFlag.rotate,
              zoom: 11.0,
              plugins: [
                MarkerClusterPlugin(),
              ],
              center: latLng.LatLng(47.843876, 25.916276),
              onTap: (_, __) => _popupLayerController.hideAllPopups(),
            ),
            layers: [
              TileLayerOptions(
                urlTemplate:
                    'https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png',
                subdomains: ['a', 'b', 'c'],
              ),
              MarkerClusterLayerOptions(
                maxClusterRadius: 120,
                size: Size(40, 40),
                fitBoundsOptions: FitBoundsOptions(
                  padding: EdgeInsets.all(50),
                ),
                markers: snapshot.data['markers'],
                polygonOptions: PolygonOptions(
                    borderColor: Colors.white,
                    color: Colors.black12,
                    borderStrokeWidth: 3),
                builder: (context, markers) {
                  return FloatingActionButton(
                    child: Text(markers.length.toString()),
                    onPressed: null,
                  );
                },
              ),
            ],
          );
        },
      ),
    );
  }

  SpeedDialChild speedDialChild(int? iconID, String label) {
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
          Entypo.dot_3,
          color: Colors.black,
        );

      case 1:
        return Icon(
          Entypo.trash,
          color: Colors.black,
        );

      case 2:
        return Icon(
          FontAwesome5.road,
          color: Colors.black,
        );

      case 3:
        return Icon(
          Entypo.lamp,
          color: Colors.black,
        );

      case 4:
        return Icon(
          Entypo.home,
          color: Colors.black,
        );

      case 5:
        return Icon(
          Octicons.shield_check,
          color: Colors.black,
        );

      case 6:
        return Icon(
          Icons.blur_circular,
          color: Colors.black,
        );

      default:
        return Icon(
          Entypo.dot_3,
          color: Colors.black,
        );
    }
  }
}

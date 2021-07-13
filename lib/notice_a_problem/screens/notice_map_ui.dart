import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutterapperadauti/widgets/src/appBarModelNew.dart';
import 'package:flutterapperadauti/widgets/src/nav_drawer.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutterapperadauti/state/marker_notifier.dart';
import 'package:provider/provider.dart';

class NoticeMapUi extends StatefulWidget {
  const NoticeMapUi({Key key}) : super(key: key);

  static final CameraPosition _cameraPosition =
      CameraPosition(target: LatLng(47.8425, 25.9097), zoom: 15.0);

  @override
  _NoticeMapUiState createState() => _NoticeMapUiState();
}

class _NoticeMapUiState extends State<NoticeMapUi> {
  final databaseRef =
      FirebaseDatabase.instance.reference().child('Notice_Problem_Map');

  GoogleMapController googleMapController;
  Map<MarkerId, Marker> markers = <MarkerId, Marker>{};

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    googleMapController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
    MarkerNotifier markerNotifier = Provider.of<MarkerNotifier>(context);
    return Scaffold(
      drawer: NavDrawer(),
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return [
            AppBarUi(
              scaffoldKey: _scaffoldKey,
              leading: Icons.camera,
              content: 'Sesizează o problemă',
              pinned: true,
            ),
          ];
        },
        body: GoogleMap(
          gestureRecognizers: Set()
            ..add(Factory<EagerGestureRecognizer>(
                () => EagerGestureRecognizer())),
          scrollGesturesEnabled: true,
          mapType: MapType.normal,
          initialCameraPosition: NoticeMapUi._cameraPosition,
          // cameraTargetBounds: new CameraTargetBounds(
          //   new LatLngBounds(
          //     northeast: LatLng(47.8591, 25.9660),
          //     southwest: LatLng(47.7808, 25.8642),
          //   ),
          // ),
          onMapCreated: (controller) {
            googleMapController = controller;
            databaseRef.once().then((snapshot) {
              Map<dynamic, dynamic> values = snapshot.value;
              values.forEach((key, value) {
                debugPrint('data: ${value['title']}');
                debugPrint('key: ${key.toString()}');
                markerNotifier.markerMap(
                  MarkerId(key),
                  Marker(
                    icon: BitmapDescriptor.defaultMarkerWithHue(
                        BitmapDescriptor.hueBlue),
                    infoWindow: InfoWindow(
                        snippet: 'Status: ${value["status"]}',
                        title: value['title'].toString()),
                    markerId: MarkerId(key),
                    position: LatLng(
                      value['lat'],
                      value['long'],
                    ),
                  ),
                );
              });
            });
          },
          markers: Set<Marker>.of(markerNotifier.marker.values),
        ),
      ),
    );
  }
}

import 'dart:typed_data';
import 'dart:ui' as ui;

import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutterapperadauti/notice_a_problem/widgets/map_legend.dart';
import 'package:flutterapperadauti/widgets/src/appBarModelNew.dart';
import 'package:flutterapperadauti/widgets/src/nav_drawer.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutterapperadauti/state/marker_notifier.dart';
import 'package:custom_info_window/custom_info_window.dart';
import 'package:provider/provider.dart';

class NoticeMapUi extends StatefulWidget {
  const NoticeMapUi({Key key}) : super(key: key);

  static final CameraPosition _cameraPosition = CameraPosition(
      target: LatLng(47.845102094508654, 25.91661650843215), zoom: 11.0);

  @override
  _NoticeMapUiState createState() => _NoticeMapUiState();
}

class _NoticeMapUiState extends State<NoticeMapUi> {
  final databaseRef =
      FirebaseDatabase.instance.reference().child('Notice_Problem_Map');
  CustomInfoWindowController _customInfoWindowController =
      CustomInfoWindowController();

  Uint8List iconIllegalConstructions;
  Uint8List iconBin;
  Uint8List iconCarAbandonned;
  Uint8List iconPublicDisturbance;
  Uint8List iconPublicLight;
  Uint8List iconSpecialPeople;
  Uint8List iconNoSign;
  Uint8List iconPolution;
  Uint8List iconUtilityProblems;
  Uint8List iconHealth;
  Uint8List iconPolice;
  Uint8List iconPitfall;
  Uint8List iconDefaultMarker;

  @override
  void initState() {
    getIcon();
    super.initState();
  }

  @override
  void dispose() {
    _customInfoWindowController.dispose();
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
        body: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Stack(children: [
                Card(
                  margin: EdgeInsets.all(8.0),
                  child: Center(
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      height: 400,
                      child: GoogleMap(
                        gestureRecognizers: Set()
                          ..add(Factory<EagerGestureRecognizer>(
                              () => EagerGestureRecognizer())),
                        //scrollGesturesEnabled: true,
                        mapType: MapType.normal,
                        initialCameraPosition: NoticeMapUi._cameraPosition,
                        onTap: (position) {
                          _customInfoWindowController.hideInfoWindow();
                        },
                        onCameraMove: (position) {
                          _customInfoWindowController.onCameraMove();
                        },
                        onMapCreated: (controller) {
                          _customInfoWindowController.googleMapController =
                              controller;
                          databaseRef.once().then((snapshot) {
                            Map<dynamic, dynamic> values = snapshot.value;
                            values.forEach((key, value) {
                              markerNotifier.markerMap(
                                MarkerId(key),
                                Marker(
                                  icon: BitmapDescriptor.fromBytes(
                                      switchIcon(value["iconIndex"])),
                                  onTap: () {
                                    _customInfoWindowController.addInfoWindow(
                                      Container(
                                        decoration:
                                            BoxDecoration(color: Colors.white),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text(
                                                'Categorie: ${value["categoria"]}'),
                                            Text(
                                                'Descriere: ${value["description"]}'),
                                            Text('Status: ${value["status"]}'),
                                            Text(
                                                'Institutia: ${value["institutia"]}'),
                                            Text(
                                                'Subject: ${value["subject"]}'),
                                            Text(
                                                'Lat: ${value["lat"].toString().substring(0, 7)}, Long: ${value["long"].toString().substring(0, 7)}'),
                                          ],
                                        ),
                                      ),
                                      LatLng(value['lat'], value['long']),
                                    );
                                  },
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
                  ),
                ),
                CustomInfoWindow(
                  offset: 30,
                  controller: _customInfoWindowController,
                  width: 300,
                  height: 100,
                ),
              ]),
            ),
            SliverToBoxAdapter(
              child: Center(
                child: Text(
                  'Legenda',
                  style: TextStyle(fontSize: 20),
                ),
              ),
            ),
            SliverToBoxAdapter(child: MapLegend()),
          ],
        ),
      ),
    );
  }

  switchIcon(int icon) {
    debugPrint('iconIndex: $icon');
    switch (icon) {
      case 1:
        return iconCarAbandonned;
        break;
      case 2:
        return iconBin;
        break;
      case 3:
        return iconPitfall;
        break;
      case 4:
        return iconPublicLight;
        break;
      case 5:
        return iconUtilityProblems;
        break;
      case 6:
        return iconIllegalConstructions;
        break;
      case 7:
        return iconPublicDisturbance;
        break;
      case 8:
        return iconHealth;
        break;
      case 9:
        return iconPolice;
        break;
      case 10:
        return iconSpecialPeople;
      case 11:
        return iconPolution;
        break;
      case 12:
        return iconNoSign;
        break;
      default:
        return iconDefaultMarker;
    }
  }

  getIcon() async {
    final Uint8List iconIllegalConstructions = await getBytesFromAsset(
        'assets/images/mapIcons/ilegal_constructions.png', 50);
    final Uint8List iconBin =
        await getBytesFromAsset('assets/images/mapIcons/bin.png', 50);
    final Uint8List iconCarAbandonned = await getBytesFromAsset(
        'assets/images/mapIcons/car_abandonned.png', 50);
    final Uint8List iconPublicDisturbance = await getBytesFromAsset(
        'assets/images/mapIcons/deranj_ordinea_publica.png', 50);
    final Uint8List iconPublicLight = await getBytesFromAsset(
        'assets/images/mapIcons/iluminat_public.png', 50);
    final Uint8List iconSpecialPeople = await getBytesFromAsset(
        'assets/images/mapIcons/lipsa_loc_handicap.png', 50);
    final Uint8List iconNoSign = await getBytesFromAsset(
        'assets/images/mapIcons/lipsa_semn_circulatie.png', 50);
    final Uint8List iconPolution =
        await getBytesFromAsset('assets/images/mapIcons/poluare.png', 50);
    final Uint8List iconUtilityProblems = await getBytesFromAsset(
        'assets/images/mapIcons/probleme_utilitati.png', 50);
    final Uint8List iconHealth =
        await getBytesFromAsset('assets/images/mapIcons/sanatate.png', 50);
    final Uint8List iconPolice =
        await getBytesFromAsset('assets/images/mapIcons/siguranta.png', 50);
    final Uint8List iconPitfall =
        await getBytesFromAsset('assets/images/mapIcons/pitfall.png', 50);
    final Uint8List iconDefaultMarker = await getBytesFromAsset(
        'assets/images/mapIcons/default_marker.png', 50);
    setState(() {
      this.iconIllegalConstructions = iconIllegalConstructions;
      this.iconBin = iconBin;
      this.iconCarAbandonned = iconCarAbandonned;
      this.iconPublicDisturbance = iconPublicDisturbance;
      this.iconPublicLight = iconPublicLight;
      this.iconSpecialPeople = iconSpecialPeople;
      this.iconNoSign = iconNoSign;
      this.iconPolution = iconPolution;
      this.iconUtilityProblems = iconUtilityProblems;
      this.iconHealth = iconHealth;
      this.iconPolice = iconPolice;
      this.iconPitfall = iconPitfall;
      this.iconDefaultMarker = iconDefaultMarker;
    });
  }

  Future<Uint8List> getBytesFromAsset(String path, int width) async {
    ByteData data = await rootBundle.load(path);
    ui.Codec codec = await ui.instantiateImageCodec(data.buffer.asUint8List(),
        targetWidth: width);
    ui.FrameInfo fi = await codec.getNextFrame();
    return (await fi.image.toByteData(format: ui.ImageByteFormat.png))
        .buffer
        .asUint8List();
  }
}

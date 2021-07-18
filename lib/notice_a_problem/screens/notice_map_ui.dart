import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
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
      target: LatLng(47.845102094508654, 25.91661650843215), zoom: 15.0);

  @override
  _NoticeMapUiState createState() => _NoticeMapUiState();
}

class _NoticeMapUiState extends State<NoticeMapUi> {
  final databaseRef =
      FirebaseDatabase.instance.reference().child('Notice_Problem_Map');
  CustomInfoWindowController _customInfoWindowController =
      CustomInfoWindowController();

  Map<MarkerId, Marker> markers = <MarkerId, Marker>{};
  BitmapDescriptor iconIllegalConstructions;
  BitmapDescriptor iconBin;
  BitmapDescriptor iconCarAbandonned;
  BitmapDescriptor iconPublicDisturbance;
  BitmapDescriptor iconPublicLight;
  BitmapDescriptor iconSpecialPeople;
  BitmapDescriptor iconNoSign;
  BitmapDescriptor iconPolution;
  BitmapDescriptor iconUtilityProblems;
  BitmapDescriptor iconHealth;
  BitmapDescriptor iconPolice;
  BitmapDescriptor iconPitfall;

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
                Container(
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
                          debugPrint('data: ${value['title']}');
                          debugPrint('key: ${key.toString()}');
                          markerNotifier.markerMap(
                            MarkerId(key),
                            Marker(
                              icon: switchIcon(value["iconIndex"]),
                              onTap: () {
                                _customInfoWindowController.addInfoWindow(
                                  Container(
                                    decoration:
                                        BoxDecoration(color: Colors.white),
                                    child: Column(
                                      children: [
                                        Text('${value["title"]}'),
                                        Text('status: ${value["status"]}'),
                                        Text(
                                            'Lat: ${value["lat"]}, Long: ${value["long"]}'),
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
                CustomInfoWindow(
                  controller: _customInfoWindowController,
                  width: 300,
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
        return BitmapDescriptor.defaultMarker;
    }
  }

  getIcon() async {
    var iconIllegalConstructions = await BitmapDescriptor.fromAssetImage(
        ImageConfiguration(
          devicePixelRatio: 3.0,
        ),
        "assets/images/mapIcons/ilegal_constructions.png");
    var iconBin = await BitmapDescriptor.fromAssetImage(
        ImageConfiguration(
          devicePixelRatio: 3.0,
        ),
        "assets/images/mapIcons/bin.png");
    var iconCarAbandonned = await BitmapDescriptor.fromAssetImage(
        ImageConfiguration(
          devicePixelRatio: 3.0,
        ),
        "assets/images/mapIcons/car_abandonned.png");
    var iconPublicDisturbance = await BitmapDescriptor.fromAssetImage(
        ImageConfiguration(
          devicePixelRatio: 3.0,
        ),
        "assets/images/mapIcons/deranj_ordinea_publica.png");
    var iconPublicLight = await BitmapDescriptor.fromAssetImage(
        ImageConfiguration(
          devicePixelRatio: 3.0,
        ),
        "assets/images/mapIcons/iluminat_public.png");
    var iconSpecialPeople = await BitmapDescriptor.fromAssetImage(
        ImageConfiguration(
          devicePixelRatio: 3.0,
        ),
        "assets/images/mapIcons/lipsa_loc_handicap.png");
    var iconNoSign = await BitmapDescriptor.fromAssetImage(
        ImageConfiguration(
          devicePixelRatio: 3.0,
        ),
        "assets/images/mapIcons/lipsa_semn_circulatie.png");
    var iconPolution = await BitmapDescriptor.fromAssetImage(
        ImageConfiguration(
          devicePixelRatio: 3.0,
        ),
        "assets/images/mapIcons/poluare.png");
    var iconUtilityProblems = await BitmapDescriptor.fromAssetImage(
        ImageConfiguration(
          devicePixelRatio: 3.0,
        ),
        "assets/images/mapIcons/probleme_utilitati.png");
    var iconHealth = await BitmapDescriptor.fromAssetImage(
        ImageConfiguration(
          devicePixelRatio: 3.0,
        ),
        "assets/images/mapIcons/sanatate.png");
    var iconPolice = await BitmapDescriptor.fromAssetImage(
        ImageConfiguration(
          devicePixelRatio: 3.0,
        ),
        "assets/images/mapIcons/siguranta.png");
    var iconPitfall = await BitmapDescriptor.fromAssetImage(
        ImageConfiguration(
          devicePixelRatio: 3.0,
        ),
        "assets/images/mapIcons/pitfall.png");
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
    });
  }
}

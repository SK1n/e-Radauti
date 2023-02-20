import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map_marker_cluster/flutter_map_marker_cluster.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutterapperadauti/data/models/notice_problem_map/notice_problem_map_marker_model.dart';
import 'package:flutterapperadauti/modules/report_a_problem/controllers/notice_map_controller.dart';
import 'package:flutterapperadauti/utils/helpers/get_data_firebase.dart';
import 'package:flutterapperadauti/utils/shared_widgets/futuristic.dart';
import 'package:get/get.dart';
// ignore: library_prefixes, depend_on_referenced_packages
import 'package:latlong2/latlong.dart' as latLng;

class ReportProblemMap extends StatelessWidget with GetDataFirebase {
  const ReportProblemMap({super.key});

  @override
  Widget build(BuildContext context) {
    NoticeProblemMapController mapController = Get.find();
    return Futuristic(
      initialBuilder: (_, __) => Container(),
      futureBuilder: () => mapController.getMarkers(),
      dataBuilder: (BuildContext context, snapshot) {
        NoticeProblemMapMarkerModel data =
            snapshot as NoticeProblemMapMarkerModel;

        for (var element in data.markers!) {
          if (element.lat != null && element.long != null) {
            mapController.addMarkersToList(element);
          }
        }

        return Padding(
          padding: const EdgeInsets.only(bottom: 20),
          child: ExpandableNotifier(
            initialExpanded: true,
            child: ScrollOnExpand(
              child: Card(
                elevation: 5,
                child: ExpandablePanel(
                  theme: const ExpandableThemeData(
                    useInkWell: true,
                    headerAlignment: ExpandablePanelHeaderAlignment.center,
                  ),
                  header: Text(
                    'map-title'.tr,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  collapsed: Container(),
                  expanded: ExpandableButton(
                    child: SizedBox(
                      height: Get.height / 3,
                      child: FlutterMap(
                        options: MapOptions(
                          interactiveFlags: ~InteractiveFlag.rotate &
                              InteractiveFlag.pinchZoom,
                          zoom: 12.0,
                          plugins: [
                            MarkerClusterPlugin(),
                          ],
                          center: latLng.LatLng(47.843876, 25.916276),
                          onTap: (_, __) =>
                              mapController.popupController.hideAllPopups(),
                        ),
                        layers: [
                          TileLayerOptions(
                            urlTemplate:
                                'https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png',
                            subdomains: ['a', 'b', 'c'],
                          ),
                          MarkerClusterLayerOptions(
                            maxClusterRadius: 120,
                            size: const Size(40, 40),
                            fitBoundsOptions: const FitBoundsOptions(
                              padding: EdgeInsets.all(50),
                            ),
                            markers: mapController.markerList,
                            polygonOptions: const PolygonOptions(
                                borderColor: Colors.white,
                                color: Colors.black12,
                                borderStrokeWidth: 3),
                            builder: (context, markers) {
                              return FloatingActionButton(
                                onPressed: null,
                                child: Text(markers.length.toString()),
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

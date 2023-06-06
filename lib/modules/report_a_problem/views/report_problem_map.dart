import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_map_marker_cluster/flutter_map_marker_cluster.dart';
import 'package:flutterapperadauti/data/models/notice_problem_map/notice_problem_map_marker_model.dart';
import 'package:flutterapperadauti/modules/report_a_problem/controllers/report_problem_controller.dart';
import 'package:flutterapperadauti/utils/loading_widget.dart';
import 'package:flutterapperadauti/utils/shared_widgets/empty_widget.dart';
import 'package:flutterapperadauti/utils/shared_widgets/err_widget.dart';
import 'package:flutterapperadauti/utils/shared_widgets/futuristic.dart';
import 'package:get/get.dart';
// ignore: library_prefixes, depend_on_referenced_packages
import 'package:latlong2/latlong.dart' as latLng;

class ReportProblemMap extends GetView<ReportProblemController> {
  const ReportProblemMap({super.key});

  @override
  Widget build(BuildContext context) {
    return controller.obx(
      (data) => SliverFillRemaining(
        hasScrollBody: true,
        child: FlutterMap(
          options: MapOptions(
            zoom: 12.0,
            center: latLng.LatLng(47.843876, 25.916276),
          ),
          children: [
            TileLayer(
              urlTemplate: 'https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png',
              subdomains: const ['a', 'b', 'c'],
            ),
            MarkerClusterLayerWidget(
              options: MarkerClusterLayerOptions(
                maxClusterRadius: 120,
                size: const Size(40, 40),
                fitBoundsOptions: const FitBoundsOptions(
                  padding: EdgeInsets.all(50),
                ),
                markers: data,
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
            )
          ],
        ),
      ),
      onError: (error) => SliverToBoxAdapter(
        child: ErrWidget(
          error: error.toString(),
          retry: () async => await controller.getMarkers(),
        ),
      ),
      onLoading: const SliverToBoxAdapter(child: LoadingWidget()),
    );
  }
}

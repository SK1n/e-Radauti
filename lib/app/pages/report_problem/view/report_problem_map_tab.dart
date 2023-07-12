import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_map_marker_cluster/flutter_map_marker_cluster.dart';
import '../../../utils/page_state.dart';
import 'package:latlong2/latlong.dart' as lat_lng;

import '../cubit/report_problem_cubit.dart';
import '../../../utils/widgets/loading_widget.dart';
import '../../../utils/widgets/err_widget.dart';

class ReportProblemMapTab extends StatelessWidget {
  const ReportProblemMapTab({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<ReportProblemCubit, ReportProblemState>(
      listener: (context, state) {},
      child: BlocBuilder<ReportProblemCubit, ReportProblemState>(
        builder: ((context, state) {
          if (state.firestoreStatus.isInProgress) {
            return const SliverToBoxAdapter(child: LoadingWidget());
          } else if (state.firestoreStatus.isSuccess) {
            return SliverFillRemaining(
              hasScrollBody: true,
              child: FlutterMap(
                options: MapOptions(
                  zoom: 12.0,
                  center: lat_lng.LatLng(47.843876, 25.916276),
                ),
                children: [
                  TileLayer(
                    urlTemplate:
                        'https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png',
                    subdomains: const ['a', 'b', 'c'],
                  ),
                  MarkerClusterLayerWidget(
                    options: MarkerClusterLayerOptions(
                      maxClusterRadius: 120,
                      size: const Size(40, 40),
                      fitBoundsOptions: const FitBoundsOptions(
                        padding: EdgeInsets.all(50),
                      ),
                      markers: state.markersData ?? [],
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
            );
          } else {
            return SliverToBoxAdapter(
              child: ErrWidget(
                  error: state.errorMessage ?? '',
                  retry: () async =>
                      context.read<ReportProblemCubit>().getReports()),
            );
          }
        }),
      ),
    );
  }
}

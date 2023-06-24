import 'package:firestore_repository/firestore_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_map_marker_cluster/flutter_map_marker_cluster.dart';
import 'package:flutterapperadauti/i18n/strings.g.dart';

import 'package:flutterapperadauti/utils/shared_widgets/app_scaffold/app_scaffold.dart';
import 'package:latlong2/latlong.dart' as latLng;

class ReportProblemReportPage extends StatelessWidget {
  const ReportProblemReportPage({super.key, required this.data});
  final ReportProblemItemModel data;
  static Route<void> route({required ReportProblemItemModel data}) {
    return MaterialPageRoute<void>(
        builder: (_) => ReportProblemReportPage(data: data));
  }

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      appBarTitle: data.subject,
      slivers: [
        Text(
          t.reportProblem.reportPage.subject(
            value: data.subject,
          ),
        ),
        Text(
          t.reportProblem.reportPage.description(
            value: data.description,
          ),
        ),
        Text(
          t.reportProblem.reportPage.category(
            value: data.category,
          ),
        ),
        Text(
          t.reportProblem.reportPage.institution(
            value: data.institution,
          ),
        ),
        Text(
          t.reportProblem.reportPage.institutionEmail(
            value: data.institutionEmail,
          ),
        ),
        Text(
          t.reportProblem.reportPage.sentBy(
            value: data.name,
          ),
        ),
        data.lat != null && data.long != null
            ? SizedBox(
                width: MediaQuery.of(context).size.width,
                height: 200,
                child: FlutterMap(
                  options: MapOptions(
                    zoom: 14.0,
                    center: latLng.LatLng(data.lat!, data.long!),
                  ),
                  children: [
                    TileLayer(
                      urlTemplate:
                          'https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png',
                      subdomains: const ['a', 'b', 'c'],
                    ),
                    MarkerLayer(
                      markers: [
                        Marker(
                          point: latLng.LatLng(data.lat!, data.long!),
                          builder: (context) => const Icon(
                            Icons.pin_drop_rounded,
                          ),
                        )
                      ],
                    )
                  ],
                ),
              )
            : Container(),
      ],
    );
  }
}

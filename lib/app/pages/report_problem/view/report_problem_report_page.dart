import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutterapperadauti/app/utils/app_constants.dart';
import '../../../../gen/strings.g.dart';
import '../../../utils/scaffolds/app_scaffold.dart';
import 'package:latlong2/latlong.dart' as lat_lng;

import '../../../models/report_problem/report_problem_user_model.dart';

class ReportProblemReportPage extends StatelessWidget {
  const ReportProblemReportPage({super.key, required this.data});
  final ReportProblemUserItemModel data;
  static Route<void> route({required ReportProblemUserItemModel data}) {
    return MaterialPageRoute<void>(
        builder: (_) => ReportProblemReportPage(data: data));
  }

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      appBarTitle: data.subject,
      slivers: [
        Text(
          context.t.reportProblem.reportPage.subject(
            value: data.subject,
          ),
        ),
        Text(
          context.t.reportProblem.reportPage.description(
            value: data.description,
          ),
        ),
        Text(
          context.t.reportProblem.reportPage.category(
            value: data.category,
          ),
        ),
        Text(
          context.t.reportProblem.reportPage.institution(
            value: data.institution,
          ),
        ),
        Text(
          context.t.reportProblem.reportPage.institutionEmail(
            value: data.institutionEmail,
          ),
        ),
        Text(
          context.t.reportProblem.reportPage.sentBy(
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
                    center: lat_lng.LatLng(data.lat!, data.long!),
                  ),
                  children: [
                    TileLayer(
                      urlTemplate: AppConstants.mapUrlTemplate,
                      subdomains: const ['a', 'b', 'c'],
                    ),
                    MarkerLayer(
                      markers: [
                        Marker(
                          point: lat_lng.LatLng(data.lat!, data.long!),
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

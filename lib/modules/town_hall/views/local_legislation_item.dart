import 'package:flutter/material.dart';
import 'package:flutterapperadauti/utils/helpers/launch_url_helper.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';

class LocalLegislationItem extends StatelessWidget with UrlLauncher {
  final String? title;
  final String? year;
  final String? link;
  const LocalLegislationItem({super.key, this.title, this.year, this.link});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "[ $year ] $title",
              textAlign: TextAlign.start,
            ),
          ),
          TextButton(
            onPressed: () async {
              Logger logger = Logger();
              logger.d(link);
              await launchUrlS(link!);
            },
            child: Text('open-link'.tr.toUpperCase()),
          )
        ],
      ),
    );
  }
}

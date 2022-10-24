import 'package:flutter/material.dart';
import 'package:flutterapperadauti/utils/helpers/launch_url_helper.dart';

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
          ListTile(
            leading: const Icon(Icons.calendar_today),
            title: Text(year.toString()),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              title.toString(),
              textAlign: TextAlign.start,
            ),
          ),
          TextButton(
            onPressed: () async {
              await launchUrl(link!);
            },
            child: const Text('Deschideti link-ul'),
          )
        ],
      ),
    );
  }
}

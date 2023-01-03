import 'package:flutter/material.dart';
import 'package:flutterapperadauti/utils/shared_widgets/futuristic.dart';
import 'package:flutterapperadauti/utils/helpers/get_image_url.dart';
import 'package:flutterapperadauti/utils/helpers/launch_url_helper.dart';
import 'package:get/get.dart';
import 'package:selectable_autolink_text/selectable_autolink_text.dart';

class LocalAnnouncementsItem extends StatelessWidget
    with GetImageUrl, UrlLauncher {
  final String? url;
  final String? content;
  final String? title;
  final String? host;
  final String? date;
  const LocalAnnouncementsItem({
    super.key,
    this.url,
    required this.content,
    required this.title,
    required this.host,
    required this.date,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Futuristic(
            initialBuilder: (_, __) => Container(),
            futureBuilder: () => getImageUrl(url!),
            dataBuilder: (_, snapshot) => SizedBox(
              width: Get.width,
              child: Image.network(
                snapshot as String,
                scale: 1.0,
                fit: BoxFit.fitWidth,
                height: 200,
              ),
            ),
          ),
          Center(
            child: Text(
              "${title!}\n ${date ?? ""}",
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Center(
            child: Text(
              host ?? "",
              style: const TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SelectableAutoLinkText(
              content ?? "  ",
              onTransformDisplayLink: AutoLinkUtils.shrinkUrl,
              linkStyle: const TextStyle(color: Colors.pinkAccent),
              onTap: (link) async {
                await launchUrl(link);
              },
            ),
          ),
        ],
      ),
    );
  }
}

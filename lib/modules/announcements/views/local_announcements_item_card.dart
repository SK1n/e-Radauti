import 'package:card_loading/card_loading.dart';
import 'package:flutter/material.dart';
import 'package:flutterapperadauti/utils/shared_widgets/futuristic.dart';
import 'package:flutterapperadauti/utils/helpers/get_image_url.dart';
import 'package:flutterapperadauti/utils/helpers/launch_url_helper.dart';
import 'package:get/get.dart';
import 'package:selectable_autolink_text/selectable_autolink_text.dart';

class LocalAnnouncementsItemCard extends StatelessWidget
    with GetImageUrl, UrlLauncher {
  final String? url;
  final String? content;
  final String? title;
  final String? host;
  final String? date;
  const LocalAnnouncementsItemCard({
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
      elevation: 5,
      child: Container(
        padding: const EdgeInsets.only(
          top: 20,
          bottom: 20,
          left: 10,
          right: 10,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Futuristic(
              futureBuilder: () => getImageUrl(url!),
              busyBuilder: (_) {
                return const CardLoading(
                  height: 200,
                  margin: EdgeInsets.only(bottom: 20),
                  borderRadius: BorderRadius.all(
                    Radius.circular(10),
                  ),
                );
              },
              dataBuilder: (_, snap) => SizedBox(
                width: Get.width,
                child: Image.network(
                  snap.data.toString(),
                  scale: 1.0,
                  fit: BoxFit.fitWidth,
                  height: 200,
                ),
              ),
            ),
            Text(
              date ?? '',
              style: const TextStyle(
                fontSize: 15,
              ),
            ),
            Text(
              host ?? "",
              style: const TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width - 90,
              child: Text(
                title ?? "",
                style: const TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            // imageWidget(contentImage),
            SelectableAutoLinkText(
              content ?? "  ",
              onTransformDisplayLink: AutoLinkUtils.shrinkUrl,
              linkStyle: const TextStyle(color: Colors.pinkAccent),
              onTap: (link) async {
                await launchUrl(link);
              },
            ),
          ],
        ),
      ),
    );
  }
}

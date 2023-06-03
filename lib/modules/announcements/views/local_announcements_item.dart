import 'package:flutter/material.dart';
import 'package:flutterapperadauti/data/models/local_announcements/local_announcements_item_model.dart';
import 'package:flutterapperadauti/utils/shared_widgets/futuristic.dart';
import 'package:flutterapperadauti/utils/helpers/get_image_url.dart';
import 'package:flutterapperadauti/utils/helpers/launch_url_helper.dart';
import 'package:get/get.dart';
import 'package:selectable_autolink_text/selectable_autolink_text.dart';

class LocalAnnouncementsItem extends StatelessWidget with UrlLauncher {
  final LocalAnnouncementsItemModel data;
  const LocalAnnouncementsItem({
    super.key,
    required this.data,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: Get.width,
            child: Image.network(
              data.url,
              scale: 1.0,
              fit: BoxFit.fitWidth,
              height: 200,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              data.title!,
              style: const TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Visibility(
            replacement: Container(),
            visible: data.date != null,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                data.date ?? "",
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SelectableAutoLinkText(
              data.description ?? "",
              onTransformDisplayLink: AutoLinkUtils.shrinkUrl,
              linkStyle: const TextStyle(color: Colors.pinkAccent),
              onTap: (link) async {
                await launchUrlS(link);
              },
            ),
          ),
          Visibility(
            replacement: Container(),
            visible: data.author != null,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "${'author'.tr} : ${data.author}",
                style: const TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

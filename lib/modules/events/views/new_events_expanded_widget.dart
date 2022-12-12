import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:flutterapperadauti/utils/helpers/launch_url_helper.dart';
import 'package:get/get.dart';
import 'package:selectable_autolink_text/selectable_autolink_text.dart';

class NewEventsExpandedWidget extends StatelessWidget with UrlLauncher {
  final String? imageUrl;
  final String? headline;
  final String? host;
  final String? start;
  final String? end;
  final String? location;
  final String? street;
  final String? description;
  final String? link;
  const NewEventsExpandedWidget({
    super.key,
    this.imageUrl,
    this.headline,
    this.host,
    this.start,
    this.end,
    this.location,
    this.street,
    this.description,
    this.link,
  });

  @override
  Widget build(BuildContext context) {
    return ExpandableButton(
      child: Card(
        child: Column(
          children: [
            Stack(
              alignment: Alignment.bottomCenter,
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: Image.network(
                    imageUrl.toString(),
                    scale: 1.0,
                    fit: BoxFit.fitWidth,
                    height: 200,
                  ),
                ),
              ],
            ),
            ListTile(
              title: Text(
                '$headline',
                softWrap: true,
                maxLines: 3,
              ),
            ),
            //sendNotifSwitchListTile(fetchData, sendNotif),
            ListTile(
              leading: const Icon(
                Icons.people,
                color: Colors.pinkAccent,
              ),
              title: Text('$host'),
            ),
            ListTile(
              leading: const Icon(
                Icons.calendar_today,
                color: Colors.blueAccent,
              ),
              title: Text('${"start-date".tr}: ${start!}'),
            ),
            ListTile(
              leading: const Icon(
                Icons.calendar_today,
                color: Colors.greenAccent,
              ),
              title: Text('${"end-date".tr}: ${end!}'),
            ),
            ListTile(
              leading: const Icon(
                Icons.location_pin,
                color: Colors.redAccent,
              ),
              title: Text('$location \n$street'),
            ),
            ListTile(
              leading: const Icon(
                Icons.message,
                color: Colors.amberAccent,
              ),
              title: SelectableAutoLinkText(
                '$description',
                onTransformDisplayLink: AutoLinkUtils.shrinkUrl,
                linkStyle: const TextStyle(color: Colors.pinkAccent),
                onTap: (link) async {
                  await launchUrl(link);
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}

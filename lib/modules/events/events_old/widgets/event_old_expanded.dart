import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:selectable_autolink_text/selectable_autolink_text.dart';
import 'package:url_launcher/url_launcher.dart';

class EventsOldExpanded extends StatelessWidget {
  final String? imageUrl;
  final String? headline;
  final String? host;
  final String? start;
  final String? end;
  final String? location;
  final String? street;
  final String? description;
  final String? link;
  const EventsOldExpanded({
    Key? key,
    this.imageUrl,
    this.headline,
    this.host,
    this.start,
    this.end,
    this.location,
    this.street,
    this.description,
    this.link,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ExpandableButton(
      child: Card(
        child: Column(
          children: [
            Stack(
              alignment: Alignment.bottomCenter,
              children: [
                Container(
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
              leading: Icon(
                Icons.people,
                color: Colors.pinkAccent,
              ),
              title: Text('$host'),
            ),
            ListTile(
              leading: Icon(
                Icons.calendar_today,
                color: Colors.blueAccent,
              ),
              title: Text('Data inceperii: ' + start!),
            ),
            ListTile(
              leading: Icon(
                Icons.calendar_today,
                color: Colors.greenAccent,
              ),
              title: Text('Data finalizarii: ' + end!),
            ),
            ListTile(
              leading: Icon(
                Icons.location_pin,
                color: Colors.redAccent,
              ),
              title: Text('$location \n$street'),
            ),
            ListTile(
              leading: Icon(
                Icons.message,
                color: Colors.amberAccent,
              ),
              title: SelectableAutoLinkText(
                '$description',
                onTransformDisplayLink: AutoLinkUtils.shrinkUrl,
                linkStyle: TextStyle(color: Colors.pinkAccent),
                onTap: (link) async {
                  if (await canLaunch(link)) {
                    launch(link, forceSafariVC: false);
                  }
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
